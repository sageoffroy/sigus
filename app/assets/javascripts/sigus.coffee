# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$.ajaxSetup dataType: 'json'

$.fn.extend {
  integrateSelect2: (selector)->
    selector = selector || '.select2'
    $(@).find(selector).select2({theme: "bootstrap"})
                
  integrateDatepicker: (selector)->
    selector = selector || '.datepicker'
    $(@).find(selector).datepicker({
    	startView: 1,
    	language: "es",
    	orientation: "bottom auto",
    	autoclose: true,
    	todayHighlight: true
    })
}

$.fn.render_form_errors = (model_name, errors) ->
  form = this
  $("#new_dependence_of_agent").clear_form_errors()
  $.each(errors, (field, messages) ->
    field = field.substring(field.lastIndexOf(".")+1).replace("_id","")
    console.log "CAMPO: " + field
    input = form.find('input, select, textarea').filter(->
      name = $(this).attr('name')
      campo = name.substring(name.lastIndexOf('[')+1).replace("]","").replace("_id", "")
      return field == campo
    )
    console.log input
    input.closest('.form-group').addClass('has-danger')
    input.addClass('form-control-danger')

    #input.parent().append('<span class="help-block">' + $.map(messages, (m) -> m.charAt(0).toUpperCase() + m.slice(1)).join('<br />') + '</span>')
    toastr["error"](messages)
  )

$.fn.clear_form_errors = () ->
  this.find('.form-group').removeClass('has-danger')
  this.removeClass('form-control-danger')

$.fn.clear_form_fields = () ->
  this.find(':input','#new_dependence_of_agent')
      .not(':button, :submit, :reset, :hidden')
      .val('')
      .removeAttr('checked')
      .removeAttr('selected')

$(document).on 'turbolinks:load', ->

  datatable = $('.datatable')
  datatable.DataTable
    'language': 'url': '//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json'

  form = $('form')
  form.integrateDatepicker();
  form.integrateSelect2();

  $(".menu").integrateSelect2();

$(document).on 'turbolinks:before-cache', ->
  dataTable =  $($.fn.dataTable.tables(true)).DataTable()
  if (dataTable != null)
   dataTable.destroy();
   dataTable = null;