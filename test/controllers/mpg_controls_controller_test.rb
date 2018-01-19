require 'test_helper'

class MpgControlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mpg_control = mpg_controls(:one)
  end

  test "should get index" do
    get mpg_controls_url
    assert_response :success
  end

  test "should get new" do
    get new_mpg_control_url
    assert_response :success
  end

  test "should create mpg_control" do
    assert_difference('MpgControl.count') do
      post mpg_controls_url, params: { mpg_control: { month: @mpg_control.month, service_of_dependence_id: @mpg_control.service_of_dependence_id, year: @mpg_control.year } }
    end

    assert_redirected_to mpg_control_url(MpgControl.last)
  end

  test "should show mpg_control" do
    get mpg_control_url(@mpg_control)
    assert_response :success
  end

  test "should get edit" do
    get edit_mpg_control_url(@mpg_control)
    assert_response :success
  end

  test "should update mpg_control" do
    patch mpg_control_url(@mpg_control), params: { mpg_control: { month: @mpg_control.month, service_of_dependence_id: @mpg_control.service_of_dependence_id, year: @mpg_control.year } }
    assert_redirected_to mpg_control_url(@mpg_control)
  end

  test "should destroy mpg_control" do
    assert_difference('MpgControl.count', -1) do
      delete mpg_control_url(@mpg_control)
    end

    assert_redirected_to mpg_controls_url
  end
end
