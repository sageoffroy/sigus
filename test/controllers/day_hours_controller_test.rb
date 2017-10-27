require 'test_helper'

class DayHoursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @day_hour = day_hours(:one)
  end

  test "should get index" do
    get day_hours_url
    assert_response :success
  end

  test "should get new" do
    get new_day_hour_url
    assert_response :success
  end

  test "should create day_hour" do
    assert_difference('DayHour.count') do
      post day_hours_url, params: { day_hour: { day: @day_hour.day, hours: @day_hour.hours, is_umu: @day_hour.is_umu } }
    end

    assert_redirected_to day_hour_url(DayHour.last)
  end

  test "should show day_hour" do
    get day_hour_url(@day_hour)
    assert_response :success
  end

  test "should get edit" do
    get edit_day_hour_url(@day_hour)
    assert_response :success
  end

  test "should update day_hour" do
    patch day_hour_url(@day_hour), params: { day_hour: { day: @day_hour.day, hours: @day_hour.hours, is_umu: @day_hour.is_umu } }
    assert_redirected_to day_hour_url(@day_hour)
  end

  test "should destroy day_hour" do
    assert_difference('DayHour.count', -1) do
      delete day_hour_url(@day_hour)
    end

    assert_redirected_to day_hours_url
  end
end
