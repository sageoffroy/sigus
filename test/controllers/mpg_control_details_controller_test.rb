require 'test_helper'

class MpgControlDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mpg_control_detail = mpg_control_details(:one)
  end

  test "should get index" do
    get mpg_control_details_url
    assert_response :success
  end

  test "should get new" do
    get new_mpg_control_detail_url
    assert_response :success
  end

  test "should create mpg_control_detail" do
    assert_difference('MpgControlDetail.count') do
      post mpg_control_details_url, params: { mpg_control_detail: { agent_id: @mpg_control_detail.agent_id, description: @mpg_control_detail.description, hs_guard: @mpg_control_detail.hs_guard, hs_umu: @mpg_control_detail.hs_umu, mpg_control_id: @mpg_control_detail.mpg_control_id } }
    end

    assert_redirected_to mpg_control_detail_url(MpgControlDetail.last)
  end

  test "should show mpg_control_detail" do
    get mpg_control_detail_url(@mpg_control_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_mpg_control_detail_url(@mpg_control_detail)
    assert_response :success
  end

  test "should update mpg_control_detail" do
    patch mpg_control_detail_url(@mpg_control_detail), params: { mpg_control_detail: { agent_id: @mpg_control_detail.agent_id, description: @mpg_control_detail.description, hs_guard: @mpg_control_detail.hs_guard, hs_umu: @mpg_control_detail.hs_umu, mpg_control_id: @mpg_control_detail.mpg_control_id } }
    assert_redirected_to mpg_control_detail_url(@mpg_control_detail)
  end

  test "should destroy mpg_control_detail" do
    assert_difference('MpgControlDetail.count', -1) do
      delete mpg_control_detail_url(@mpg_control_detail)
    end

    assert_redirected_to mpg_control_details_url
  end
end
