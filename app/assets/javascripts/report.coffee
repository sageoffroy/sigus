moment.locale('es')

check_general_data = (year, month, service, complement, complement2)->
  if (year.val() != "") && (month.val() != "") && (service.val() != "")
    
    complement.removeClass 'disabled'
    if typeof complement2 != "undefined"
      complement2.removeClass 'disabled'
    else
      "No Entra"


  else
    #console.log "falta algo"
    complement.addClass 'disabled'
    if typeof complement2 != "undefined"
      complement2.addClass 'disabled'

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

set_ids_to_child = ->
  $('.nested-fields').each (index, value) ->
    $(this).attr('id', 'nested-fields_' + index );


set_selects_of_agents = (id)->
  console.log "set_selects_of_agents"
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


selects_controls_reports = ->
  console.log "Days Controls"
  add_report_detail = $('#add_report_details')
  add_report_detail_all = $('#add_report_details_all')
  year = $('#report_year')
  month = $('#report_month')
  service = $('#report_service')
  check_general_data(year, month, service, add_report_detail, add_report_detail_all)
  check_day_of_month()
  set_weekend(year, month)
  set_free_days(year, month)
  year.on 'select2:select', (e) ->
    #console.log "Cambiando el Año"
    check_general_data(year, month, service, add_report_detail, add_report_detail_all)
    check_day_of_month()
    set_free_days(year, month)
  month.on 'select2:select', (e) ->
    #console.log "Cambiando el Mes"
    check_general_data(year, month, service, add_report_detail, add_report_detail_all)
    check_day_of_month()
    set_weekend(year, month)
    set_free_days(year, month)
  service.on 'select2:select', (e) ->
    console.log "Cambiando el Servicio"
    check_general_data(year, month, service, add_report_detail, add_report_detail_all)
    check_day_of_month()
    #actualizar valores del select de agentes
    id = service.val()
    set_selects_of_agents(id)
                   
selects_control_novelties = ->
  console.log "selects_control_novelties"
  add_novelty_detail = $('#add_novelty_details')
  year = $('#novelty_year')
  month = $('#novelty_month')
  service = $('#novelty_service_of_dependence_id')
  check_general_data(year, month, service, add_novelty_detail)
  year.on 'select2:select', (e) ->
    #console.log "Cambiando el Año"
    check_general_data(year, month, service, add_novelty_detail)
  month.on 'select2:select', (e) ->
    check_general_data(year, month, service, add_novelty_detail)
  service.on 'select2:select', (e) ->
    check_general_data(year, month, service, add_novelty_detail)    
    #actualizar valores del select de agentes
    id = service.val()
    console.log "id: " + id
    set_selects_of_agents(id)


selects_control_observations = ->
  console.log "selects_control_observation"
  add_observation_details = $('#add_observation_details')
  year = $('#observation_year')
  month = $('#observation_month')
  service = $('#observation_service_of_dependence_id')
  check_general_data(year, month, service, add_observation_details)
  year.on 'select2:select', (e) ->
    #console.log "Cambiando el Año"
    check_general_data(year, month, service, add_observation_details)
  month.on 'select2:select', (e) ->
    check_general_data(year, month, service, add_observation_details)
  service.on 'select2:select', (e) ->
    check_general_data(year, month, service, add_observation_details)    
    id = service.val()
    console.log "id: " + id
    set_selects_of_agents(id)

selects_control_additionals = ->
  console.log "selects_control_additional"
  add_additional_details = $('#add_additional_details')
  year = $('#additional_year')
  month = $('#additional_month')
  service = $('#additional_service_of_dependence_id')
  check_general_data(year, month, service, add_additional_details)
  year.on 'select2:select', (e) ->
    #console.log "Cambiando el Año"
    check_general_data(year, month, service, add_additional_details)
  month.on 'select2:select', (e) ->
    check_general_data(year, month, service, add_additional_details)
  service.on 'select2:select', (e) ->
    check_general_data(year, month, service, add_additional_details)    
    id = service.val()
    console.log "id: " + id
    set_selects_of_agents(id)


selects_control_office_hours = ->
  console.log "selects_control_office_hours"
  add_office_hour_details = $('#add_office_hour_details')
  year = $('#office_hour_year')
  month = $('#office_hour_month')
  service = $('#office_hour_service_of_dependence_id')
  check_general_data(year, month, service, add_office_hour_details)
  year.on 'select2:select', (e) ->
    check_general_data(year, month, service, add_office_hour_details)
  month.on 'select2:select', (e) ->
    check_general_data(year, month, service, add_office_hour_details)
  service.on 'select2:select', (e) ->
    check_general_data(year, month, service, add_office_hour_details)    
    id = service.val()
    console.log "id: " + id
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




$(document).on 'cocoon:after-remove', (e) ->
  console.log "Removido"
  add = 0
  $('.total_hours_gs').each ->
    add = add + parseInt($(this).val())
  $('#report_total_hs').val add

  add_umu = 0
  $('.total_hours_umu').each ->
    add_umu = add_umu + parseInt($(this).val())
  
  $('#report_total_hs_umu').val add_umu


$(document).on 'cocoon:after-insert', (e) ->
  $('.select2').select2({theme: "bootstrap"})

  $('.datepicker').datepicker({
      startView: 1,
      language: "es",
      orientation: "bottom auto",
      autoclose: true,
      todayHighlight: true
    })
  


  if ($('.novelties.create').length + $('.novelties.edit').length + $('.novelties.update').length + $('.novelties.new').length) > 0
    console.log "Se inserto COCOON en novedad"
    year = $('#novelty_year')
    month = $('#novelty_month')
    service = $('#novelty_service_of_dependence_id')
    id = service.val()
    set_last_select_of_agents(id)
  else if ($('.observations.create').length + $('.observations.edit').length + $('.observations.update').length + $('.observations.new').length) > 0
    console.log "Se inserto COCOON en ad"
    year = $('#observation_year')
    month = $('#observation_month')
    service = $('#observation_service_of_dependence_id')
    id = service.val()
    set_last_select_of_agents(id)
  else if ($('.additionals.create').length + $('.additionals.edit').length + $('.additionals.update').length + $('.additionals.new').length) > 0
    console.log "Se inserto COCOON en adicionales"
    year = $('#additional_year')
    month = $('#additional_month')
    service = $('#additional_service_of_dependence_id')
    id = service.val()
    set_last_select_of_agents(id)
  else    
    console.log "Se inserto COCOON en reporte"
    add_report_detail = $('#add_report_details')
    add_report_detail_all = $('#add_report_details_all')
    year = $('#report_year')
    month = $('#report_month')
    service = $('#report_service')
  
    check_general_data(year, month, service, add_report_detail, add_report_detail_all)
    check_day_of_month()
    set_weekend(year, month)
    set_free_days(year, month)
    set_ids_to_child()
    if e.currentTarget.activeElement.firstChild.data == "Agente del Servicio"
      id = service.val()
      set_last_select_of_agents(id)
    set_days_event()
  
  
  

$(document).on 'turbolinks:load', ->
  if $('.reports.create').length > 0
    selects_controls_reports()
    #report_service = $('#report_service')
    #id = report_service.val()
    #set_selects_of_agents(id)
    set_days_event()

  if $('.reports.edit').length > 0
    selects_controls_reports()
    set_days_event()

  if $('.reports.update').length > 0
    selects_controls_reports()
    set_days_event()

  if $('.reports.new_active').length > 0
    selects_controls_reports()

  if $('.reports.new_pasive').length > 0
    selects_controls_reports()
    
  if $('.reports.new_extra_hours').length > 0
    selects_controls_reports()

  if $('.novelties.create').length > 0
    selects_control_novelties()
    set_days_event()

  if $('.novelties.edit').length > 0
    selects_control_novelties()
    set_days_event()

  if $('.novelties.update').length > 0
    selects_control_novelties()
    set_days_event()

  if $('.novelties.new').length > 0
    selects_control_novelties()

  if $('.observations.create').length > 0
    selects_control_observations()
    set_days_event()

  if $('.observations.edit').length > 0
    selects_control_observations()
    set_days_event()

  if $('.observations.update').length > 0
    selects_control_observations()
    set_days_event()

  if $('.observations.new').length > 0
    selects_control_observations()

  if $('.additionals.create').length > 0
    selects_control_additionals()
    set_days_event()

  if $('.additionals.edit').length > 0
    selects_control_additionals()
    set_days_event()

  if $('.additionals.update').length > 0
    selects_control_additionals()
    set_days_event()

  if $('.additionals.new').length > 0
    selects_control_additionals()

  if $('.office_hours.create').length > 0
    selects_control_office_hours()
    set_days_event()

  if $('.office_hours.edit').length > 0
    selects_control_office_hours()
    set_days_event()

  if $('.office_hours.update').length > 0
    selects_control_office_hours()
    set_days_event()

  if $('.office_hours.new').length > 0
    selects_control_office_hours()