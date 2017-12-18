require 'test_helper'

class ObservationDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @observation_detail = observation_details(:one)
  end

  test "should get index" do
    get observation_details_url
    assert_response :success
  end

  test "should get new" do
    get new_observation_detail_url
    assert_response :success
  end

  test "should create observation_detail" do
    assert_difference('ObservationDetail.count') do
      post observation_details_url, params: { observation_detail: { agent_id: @observation_detail.agent_id, date_from: @observation_detail.date_from, description: @observation_detail.description, observation_description_id: @observation_detail.observation_description_id, observation_id: @observation_detail.observation_id, total_days: @observation_detail.total_days } }
    end

    assert_redirected_to observation_detail_url(ObservationDetail.last)
  end

  test "should show observation_detail" do
    get observation_detail_url(@observation_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_observation_detail_url(@observation_detail)
    assert_response :success
  end

  test "should update observation_detail" do
    patch observation_detail_url(@observation_detail), params: { observation_detail: { agent_id: @observation_detail.agent_id, date_from: @observation_detail.date_from, description: @observation_detail.description, observation_description_id: @observation_detail.observation_description_id, observation_id: @observation_detail.observation_id, total_days: @observation_detail.total_days } }
    assert_redirected_to observation_detail_url(@observation_detail)
  end

  test "should destroy observation_detail" do
    assert_difference('ObservationDetail.count', -1) do
      delete observation_detail_url(@observation_detail)
    end

    assert_redirected_to observation_details_url
  end
end
