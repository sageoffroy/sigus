require 'test_helper'

class AdditionalDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @additional_detail = additional_details(:one)
  end

  test "should get index" do
    get additional_details_url
    assert_response :success
  end

  test "should get new" do
    get new_additional_detail_url
    assert_response :success
  end

  test "should create additional_detail" do
    assert_difference('AdditionalDetail.count') do
      post additional_details_url, params: { additional_detail: { agent_id: @additional_detail.agent_id, franco_movil: @additional_detail.franco_movil, rotative_turn_id: @additional_detail.rotative_turn_id, tarea_en_terreno: @additional_detail.tarea_en_terreno, turno_nocturno_fijo: @additional_detail.turno_nocturno_fijo } }
    end

    assert_redirected_to additional_detail_url(AdditionalDetail.last)
  end

  test "should show additional_detail" do
    get additional_detail_url(@additional_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_additional_detail_url(@additional_detail)
    assert_response :success
  end

  test "should update additional_detail" do
    patch additional_detail_url(@additional_detail), params: { additional_detail: { agent_id: @additional_detail.agent_id, franco_movil: @additional_detail.franco_movil, rotative_turn_id: @additional_detail.rotative_turn_id, tarea_en_terreno: @additional_detail.tarea_en_terreno, turno_nocturno_fijo: @additional_detail.turno_nocturno_fijo } }
    assert_redirected_to additional_detail_url(@additional_detail)
  end

  test "should destroy additional_detail" do
    assert_difference('AdditionalDetail.count', -1) do
      delete additional_detail_url(@additional_detail)
    end

    assert_redirected_to additional_details_url
  end
end
