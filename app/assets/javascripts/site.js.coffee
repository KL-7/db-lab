$('#query_form').on 'ajax:success', (_, data) ->
  if (data)
    table = $('#query_result').empty()
    head = $('<tr>').appendTo(table)

    for field in data.fields
      $('<th>').html(field[1]).appendTo(head)

    for row in data.result
      tr = $('<tr>').appendTo(table)
      for field in data.fields
        $('<td>').html(row[field[0]]).appendTo(tr)
