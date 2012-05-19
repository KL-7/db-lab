module ApplicationHelper
  def time(time)
    time.strftime('%H:%M')
  end

  def model_errors(model)
    render(:partial => 'share/model_errors', :locals => { :errors => model.errors }) if model.errors.present?
  end
end
