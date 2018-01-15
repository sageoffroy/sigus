require 'test_helper'

class MonthlyForGuardHoursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monthly_for_guard_hour = monthly_for_guard_hours(:one)
  end

  test "should get index" do
    get monthly_for_guard_hours_url
    assert_response :success
  end

  test "should get new" do
    get new_monthly_for_guard_hour_url
    assert_response :success
  end

  test "should create monthly_for_guard_hour" do
    assert_difference('MonthlyForGuardHour.count') do
      post monthly_for_guard_hours_url, params: { monthly_for_guard_hour: { agent_id: @monthly_for_guard_hour.agent_id, concept_1_id: @monthly_for_guard_hour.concept_1_id, concept_2_id: @monthly_for_guard_hour.concept_2_id, gs_semana: @monthly_for_guard_hour.gs_semana, hs_domingo: @monthly_for_guard_hour.hs_domingo, hs_sabado: @monthly_for_guard_hour.hs_sabado, hs_semana: @monthly_for_guard_hour.hs_semana, hs_total_1: @monthly_for_guard_hour.hs_total_1, hs_total_2: @monthly_for_guard_hour.hs_total_2 } }
    end

    assert_redirected_to monthly_for_guard_hour_url(MonthlyForGuardHour.last)
  end

  test "should show monthly_for_guard_hour" do
    get monthly_for_guard_hour_url(@monthly_for_guard_hour)
    assert_response :success
  end

  test "should get edit" do
    get edit_monthly_for_guard_hour_url(@monthly_for_guard_hour)
    assert_response :success
  end

  test "should update monthly_for_guard_hour" do
    patch monthly_for_guard_hour_url(@monthly_for_guard_hour), params: { monthly_for_guard_hour: { agent_id: @monthly_for_guard_hour.agent_id, concept_1_id: @monthly_for_guard_hour.concept_1_id, concept_2_id: @monthly_for_guard_hour.concept_2_id, gs_semana: @monthly_for_guard_hour.gs_semana, hs_domingo: @monthly_for_guard_hour.hs_domingo, hs_sabado: @monthly_for_guard_hour.hs_sabado, hs_semana: @monthly_for_guard_hour.hs_semana, hs_total_1: @monthly_for_guard_hour.hs_total_1, hs_total_2: @monthly_for_guard_hour.hs_total_2 } }
    assert_redirected_to monthly_for_guard_hour_url(@monthly_for_guard_hour)
  end

  test "should destroy monthly_for_guard_hour" do
    assert_difference('MonthlyForGuardHour.count', -1) do
      delete monthly_for_guard_hour_url(@monthly_for_guard_hour)
    end

    assert_redirected_to monthly_for_guard_hours_url
  end
end
