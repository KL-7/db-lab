class QueriesController < ApplicationController
  def get
    render :json => execute_query(params[:query], parse_query_params(params))
  end

  protected

  def execute_query(query_name, query_params)
    q = QUERIES[query_name.to_sym]
    return if q.blank?

    query = q[:params].present? ? [q[:sql]] + query_params.values_at(*q[:params]) : q[:sql]
    fields = q[:fields]
    fields_map = fields.map { |field| [field, field.to_s.humanize] }

    result = execute_sql(query).map { |row| Hash[fields.zip(row)] }

    { :fields => fields_map, :result => result }
  end

  def parse_query_params(params)
    JSON.parse(params[:query_params]).symbolize_keys
  rescue JSON::ParserError
    {}
  end

  def execute_sql(query)
    ActiveRecord::Base.connection.execute(ActiveRecord::Base.send(:sanitize_sql_array, query))
  end

  def queries
    QUERIES.keys.map { |q| [q.to_s.humanize, q] }
  end
  helper_method :queries

  QUERIES = {
    # lecturers free on Monday & Tuesday
    :lecturers_free_on_monday_and_tuesday => {
        :sql => %Q(
            SELECT lecturers.first_name, lecturers.middle_name, lecturers.last_name
            FROM lecturers
            LEFT JOIN courses  ON lecturers.id = courses.lecturer_id
            LEFT JOIN lectures ON courses.id = lectures.course_id
            GROUP BY lecturers.id, lecturers.first_name, lecturers.middle_name, lecturers.last_name
            HAVING SUM(CASE WHEN lectures.id IS NULL OR lectures.weekday NOT IN ('Mo','Tu','We','Th') THEN 0 ELSE 1 END) = 0;
        ),
        :fields => [:first_name, :middle_name, :last_name]
    },

    # days with smallest number of auditoria used
    :days_with_least_used_auditoria => {
        :sql => %Q(
            SELECT t1.weekday, COUNT(*) AS auditoria_count
            FROM (SELECT lectures.auditorium_id, lectures.weekday FROM lectures GROUP BY lectures.auditorium_id, lectures.weekday) t1
            WHERE
              (
                SELECT COUNT(*)
                FROM (SELECT lectures.auditorium_id, lectures.weekday FROM lectures GROUP BY lectures.auditorium_id, lectures.weekday) t3
                WHERE t3.weekday = t1.weekday
              )
              =
              (
                SELECT MIN(t6.auditoria_count)
                FROM (
                 SELECT COUNT(*) AS auditoria_count
                  FROM (SELECT t5.auditorium_id, t5.weekday FROM lectures t5 GROUP BY t5.auditorium_id, t5.weekday) t4
                  GROUP BY t4.weekday
                ) t6
              )
            GROUP BY t1.weekday;
        ),
        :fields => [:weekday, :auditoria_count]
    },

    # lecturers by weekday & auditorium
    :lecturers_by_weekday_and_auditorium => {
        :sql => %Q(
              SELECT lecturers.id, lecturers.first_name, lecturers.middle_name, lecturers.last_name
              FROM lecturers
              JOIN courses   ON lecturers.id = courses.lecturer_id
              JOIN lectures  ON courses.id   = lectures.course_id
              JOIN auditoria ON auditoria.id = lectures.auditorium_id
              WHERE lectures.weekday = ? AND auditoria.auditorium_number = ?;
          ),
        :fields => [:first_name, :middle_name, :last_name],
        :params => [:weekday, :auditorium_number]
    },
  }

end