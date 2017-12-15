moment.locale('es')

check_day_of_month = ->
  
  year = parseInt($('#report_year').val())
  month = parseInt($('#report_month').val())

  #console.log daysInMonth(month, year)

  switch daysInMonth(month, year)
    when 28
      $('.day29-hours').prop 'disabled', true
      $('.day29-hours').val("")
      $('.day30-hours').prop 'disabled', true
      $('.day30-hours').val("")
      $('.day31-hours').prop 'disabled', true
      $('.day31-hours').val("")
    when 29
      $('.day29-hours').prop 'disabled', false
      $('.day30-hours').prop 'disabled', true
      $('.day30-hours').val("")
      $('.day31-hours').prop 'disabled', true
      $('.day31-hours').val("")
    when 30
      $('.day29-hours').prop 'disabled', false
      $('.day30-hours').prop 'disabled', false
      $('.day31-hours').prop 'disabled', true
      $('.day31-hours').val("")
    when 31
      $('.day29-hours').prop 'disabled', false
      $('.day30-hours').prop 'disabled', false      
      $('.day31-hours').prop 'disabled', false

set_weekend = (report_year, report_month) ->
  if (report_year.val() != "") && (report_month.val() != "")
    $('.field-hours-th').css('background-color', 'transparent');
    days = ['lunes', 'martes', 'miércoles', 'jueves', 'viernes', 'sábado', 'domingo']
    day = moment(report_month.val() + '/1/' + report_year.val()).format('dddd')
    number_day = 1
    index = $.inArray(day, days)

    while number_day <= 31
      if index == 5
        $('.day'+number_day+'-th').css('background-color', 'rgba(255, 252, 0, 0.4)');
      else if index == 6
        $('.day'+number_day+'-th').css('background-color', 'rgba(255, 0, 0, 0.4)');
      
      number_day++
      index++
      if index == 7
        index = 0

set_free_days = (report_year, report_month) ->
  if (report_year.val() != "") && (report_month.val() != "")
    r_year = report_year.val()
    r_month = report_month.val()
    url = '/get_free_days/'+r_year+'/' +r_month
    $.ajax(
      url: url
      type: 'POST').done (data) ->
        if data != null
          #console.log data.free_days
          for d in data.free_days
            day_number = parseInt(d.day.substr(d.day.length - 2));
            #console.log d.scope
            if (d.scope == "Local") || (d.scope == "Provincial")
              $('.day'+day_number+'-th').css('background-color', 'rgba(0, 252, 252, 0.4)');
            else
              $('.day'+day_number+'-th').css('background-color', 'rgba(0, 100, 152, 0.4)');

            #console.log d


check_general_data = (report_year, report_month, report_service, complement)->
  if (report_year.val() != "") && (report_month.val() != "") && (report_service.val() != "")
    #console.log "todo en orden"
    complement.removeClass 'disabled'
    $('#add_report_details_all').removeClass 'disabled'
  else
    #console.log "falta algo"
    complement.addClass 'disabled'
    $('#add_report_details_all').addClass 'disabled'

set_ids_to_child = ->
  $('.nested-fields').each (index, value) ->
    $(this).attr('id', 'nested-fields_' + index );

set_selects_of_agents = (id)->
  selects = $('.agent')
  selects.empty()
  $.ajax
    type: 'POST'
    url: '/update_agents_of_service/'+id
    error: (jqXHR, textStatus, errorThrown) ->
      console.log "Error"
      return
    success: (data) ->
      selects.append $('<option></option>').attr('value', 0).text('Agente del Servicio')
      i = 0
      while i < data.agents.length
        #selects.append '<option id=' + data.agents[i].id + ' value=' + '('+data.agents[i].dni+')'+' '+data.agents[i].fullname+'</option>'
        selects.append $('<option></option>').attr('value', data.agents[i].id ).text('('+data.agents[i].dni+')'+' '+data.agents[i].fullname)
        i++
      selects.change()
      return

set_last_select_of_agents = (id)->
  selects = $('.agent').last()
  selects.empty()
  $.ajax
    type: 'POST'
    url: '/update_agents_of_service/'+id
    error: (jqXHR, textStatus, errorThrown) ->
      console.log "Error"
      return
    success: (data) ->
      selects.append $('<option></option>').attr('value', 0).text('Agente del Servicio')
      i = 0
      while i < data.agents.length
        #selects.append '<option id=' + data.agents[i].id + ' value=' + '('+data.agents[i].dni+')'+' '+data.agents[i].fullname+'</option>'
        selects.append $('<option></option>').attr('value', data.agents[i].id ).text('('+data.agents[i].dni+')'+' '+data.agents[i].fullname)
        i++
      selects.change()
      return


days_controls = ->
  console.log "Days Controls"
  add_report_detail = $('#add_report_details')
  report_year = $('#report_year')
  report_month = $('#report_month')
  report_service = $('#report_service')

  check_general_data(report_year, report_month, report_service, add_report_detail)
  check_day_of_month()
  set_weekend(report_year, report_month)
  set_free_days(report_year, report_month)
  
 
  report_year.on 'select2:select', (e) ->
    #console.log "Cambiando el Año"
    check_general_data(report_year, report_month, report_service, add_report_detail)
    check_day_of_month()
    set_free_days(report_year, report_month)

  report_month.on 'select2:select', (e) ->
    #console.log "Cambiando el Mes"
    check_general_data(report_year, report_month, report_service, add_report_detail)
    check_day_of_month()
    set_weekend(report_year, report_month)
    set_free_days(report_year, report_month)

  report_service.on 'select2:select', (e) ->
    console.log "Cambiando el Servicio"
    check_general_data(report_year, report_month, report_service, add_report_detail)
    check_day_of_month()
    #actualizar valores del select de agentes
    id = report_service.val()
    set_selects_of_agents(id)

set_days_event = ->
  $('.day-of-month').keyup ->
    total_gs = 0
    total_umu = 0
    $(this).closest('.nested-fields').find('.day-of-month').each ->
      if $(this).val() != ''
        if $(this).hasClass('is-umu')
          total_umu = total_umu + parseInt($(this).val())
        else
          total_gs = total_gs + parseInt($(this).val())
    $(this).closest('.nested-fields').find('.total_hours_gs').val total_gs
    $(this).closest('.nested-fields').find('.total_hours_umu').val total_umu
    $(this).closest('.nested-fields').find('.total_hours').val total_gs + total_umu
    add = 0
    $('.total_hours_gs').each ->
      add = add + parseInt($(this).val())
    $('#report_total_hs').val add

    add_umu = 0
    $('.total_hours_umu').each ->
      add_umu = add_umu + parseInt($(this).val())
    
    $('#report_total_hs_umu').val add_umu

    
    
  $('.field-hours-th').click ->
    class_hours = '.day' + $(this).text() + '-hours'
    class_umu = '.day' + $(this).text() + '-is-umu'
    umu = $(this).closest('table').find(class_umu)
    hours = $(this).closest('table').find(class_hours)
    umu_val = umu.val()
    if umu_val == 'true'
      umu.attr 'value', false
      hours.removeClass 'is-umu'
    else
      umu.attr 'value', true
      hours.addClass 'is-umu'
    total_gs = 0
    total_umu = 0
    $(this).closest('.nested-fields').find('.day-of-month').each ->
      if $(this).val() != ''
        if $(this).hasClass('is-umu')
          total_umu = total_umu + parseInt($(this).val())
        else
          total_gs = total_gs + parseInt($(this).val())
    $(this).closest('.nested-fields').find('.total_hours_gs').val total_gs
    $(this).closest('.nested-fields').find('.total_hours_umu').val total_umu
    $(this).closest('.nested-fields').find('.total_hours').val total_gs + total_umu

    add = 0
    $('.total_hours_gs').each ->
      add = add + parseInt($(this).val())
    $('#report_total_hs').val add

    add_umu = 0
    $('.total_hours_umu').each ->
      add_umu = add_umu + parseInt($(this).val())
    
    $('#report_total_hs_umu').val add_umu

$(document).on 'cocoon:after-insert', (e) ->
  console.log "Se inserto COCOON"
  $('.select2').select2({theme: "bootstrap"})
  add_report_detail = $('#add_report_details')
  report_year = $('#report_year')
  report_month = $('#report_month')
  report_service = $('#report_service')
  check_general_data(report_year, report_month, report_service, add_report_detail)
  check_day_of_month()
  set_weekend(report_year, report_month)
  set_free_days(report_year, report_month)
  set_ids_to_child()
  if e.currentTarget.activeElement.firstChild.data == "Agente del Servicio"
    id = report_service.val()
    set_last_select_of_agents(id)
  set_days_event()
  
  
  

$(document).on 'turbolinks:load', ->
  if $('.reports.create').length > 0
    days_controls()
    #report_service = $('#report_service')
    #id = report_service.val()
    #set_selects_of_agents(id)
    set_days_event()

  if $('.reports.edit').length > 0
    days_controls()
    set_days_event()

  if $('.reports.update').length > 0
    days_controls()
    set_days_event()

  if $('.reports.new_active').length > 0
    days_controls()

  if $('.reports.new_pasive').length > 0
    days_controls()
    
  if $('.reports.new_extra_hours').length > 0
    days_controls()