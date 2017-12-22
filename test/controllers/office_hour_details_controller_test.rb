require 'test_helper'

class OfficeHourDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @office_hour_detail = office_hour_details(:one)
  end

  test "should get index" do
    get office_hour_details_url
    assert_response :success
  end

  test "should get new" do
    get new_office_hour_detail_url
    assert_response :success
  end

  test "should create office_hour_detail" do
    assert_difference('OfficeHourDetail.count') do
      post office_hour_details_url, params: { office_hour_detail: { agent_id: @office_hour_detail.agent_id, domingo: @office_hour_detail.domingo, jueves: @office_hour_detail.jueves, lunes: @office_hour_detail.lunes, martes: @office_hour_detail.martes, miercoles: @office_hour_detail.miercoles, office_hour_id: @office_hour_detail.office_hour_id, sabado: @office_hour_detail.sabado, total_hours: @office_hour_detail.total_hours, turno_hora: @office_hour_detail.turno_hora, viernes: @office_hour_detail.viernes } }
    end

    assert_redirected_to office_hour_detail_url(OfficeHourDetail.last)
  end

  test "should show office_hour_detail" do
    get office_hour_detail_url(@office_hour_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_office_hour_detail_url(@office_hour_detail)
    assert_response :success
  end

  test "should update office_hour_detail" do
    patch office_hour_detail_url(@office_hour_detail), params: { office_hour_detail: { agent_id: @office_hour_detail.agent_id, domingo: @office_hour_detail.domingo, jueves: @office_hour_detail.jueves, lunes: @office_hour_detail.lunes, martes: @office_hour_detail.martes, miercoles: @office_hour_detail.miercoles, office_hour_id: @office_hour_detail.office_hour_id, sabado: @office_hour_detail.sabado, total_hours: @office_hour_detail.total_hours, turno_hora: @office_hour_detail.turno_hora, viernes: @office_hour_detail.viernes } }
    assert_redirected_to office_hour_detail_url(@office_hour_detail)
  end

  test "should destroy office_hour_detail" do
    assert_difference('OfficeHourDetail.count', -1) do
      delete office_hour_detail_url(@office_hour_detail)
    end

    assert_redirected_to office_hour_details_url
  end
end
