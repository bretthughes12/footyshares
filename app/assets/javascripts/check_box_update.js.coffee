jQuery ->
  $(".updateable-checkbox").click ->
    spinner = $(this).data('spinner-id')
    dataToSend = this.name + "=" + this.checked 
    $.ajax (
      url: $(this).data('href'),
      type: 'PUT',
      dataType: 'json',
      data: dataToSend,
      beforeSend: -> $(spinner).show(),
      complete: -> $(spinner).hide()
    )