require 'test_helper'

class ObservationDescriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @observation_description = observation_descriptions(:one)
  end

  test "should get index" do
    get observation_descriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_observation_description_url
    assert_response :success
  end

  test "should create observation_description" do
    assert_difference('ObservationDescription.count') do
      post observation_descriptions_url, params: { observation_description: { code: @observation_description.code, description: @observation_description.description } }
    end

    assert_redirected_to observation_description_url(ObservationDescription.last)
  end

  test "should show observation_description" do
    get observation_description_url(@observation_description)
    assert_response :success
  end

  test "should get edit" do
    get edit_observation_description_url(@observation_description)
    assert_response :success
  end

  test "should update observation_description" do
    patch observation_description_url(@observation_description), params: { observation_description: { code: @observation_description.code, description: @observation_description.description } }
    assert_redirected_to observation_description_url(@observation_description)
  end

  test "should destroy observation_description" do
    assert_difference('ObservationDescription.count', -1) do
      delete observation_description_url(@observation_description)
    end

    assert_redirected_to observation_descriptions_url
  end
end
