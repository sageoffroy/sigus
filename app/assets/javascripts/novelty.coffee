#set_last_select_of_agents = (id)->
  #selects = $('.agent').last()
  #selects.empty()
  #$.ajax
    #type: 'POST'
    #url: '/update_agents_of_service/'+id
    #error: (jqXHR, textStatus, errorThrown) ->
      #console.log "Error"
      #return
    #success: (data) ->
      #selects.append $('<option></option>').attr('value', 0).text('Agente del Servicio')
      #i = 0
      #while i < data.agents.length
        ##selects.append '<option id=' + data.agents[i].id + ' value=' + '('+data.agents[i].dni+')'+' '+data.agents[i].fullname+'</option>'
        #selects.append $('<option></option>').attr('value', data.agents[i].id ).text('('+data.agents[i].dni+')'+' '+data.agents[i].fullname)
        #i++
      #selects.change()
      #return
#
#
#selects_control = ->
  #console.log "Selects Controls"
  #add_report_detail = $('#add_novelty_details')
  #report_year = $('#novelty_year')
  #report_month = $('#novelty_month')
  #report_service = $('#novelty_service_of_dependence_id')
#
  #report_year.on 'select2:select', (e) ->
    #console.log "Cambiando el Año"
#    
  #report_month.on 'select2:select', (e) ->
    #console.log "Cambiando el Mes"    
#
  #report_service.on 'select2:select', (e) ->
    #console.log "Cambiando el Servicio"
    #id = report_service.val()
    #set_selects_of_agents(id)
#
#
#
#$(document).on 'turbolinks:load', ->
  #if $('.novelties.create').length > 0
    #selects_control()
    #set_days_event()
#
  #if $('.novelties.edit').length > 0
    #selects_control()
    #set_days_event()
#
  #if $('.novelties.update').length > 0
    #selects_control()
    #set_days_event()
#
  #if $('.novelties.new').length > 0
    #selects_control()

  