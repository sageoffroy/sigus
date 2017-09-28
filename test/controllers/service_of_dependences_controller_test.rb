require 'test_helper'

class ServiceOfDependencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service_of_dependence = service_of_dependences(:one)
  end

  test "should get index" do
    get service_of_dependences_url
    assert_response :success
  end

  test "should get new" do
    get new_service_of_dependence_url
    assert_response :success
  end

  test "should create service_of_dependence" do
    assert_difference('ServiceOfDependence.count') do
      post service_of_dependences_url, params: { service_of_dependence: { dependence_id: @service_of_dependence.dependence_id, description: @service_of_dependence.description, service_id: @service_of_dependence.service_id } }
    end

    assert_redirected_to service_of_dependence_url(ServiceOfDependence.last)
  end

  test "should show service_of_dependence" do
    get service_of_dependence_url(@service_of_dependence)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_of_dependence_url(@service_of_dependence)
    assert_response :success
  end

  test "should update service_of_dependence" do
    patch service_of_dependence_url(@service_of_dependence), params: { service_of_dependence: { dependence_id: @service_of_dependence.dependence_id, description: @service_of_dependence.description, service_id: @service_of_dependence.service_id } }
    assert_redirected_to service_of_dependence_url(@service_of_dependence)
  end

  test "should destroy service_of_dependence" do
    assert_difference('ServiceOfDependence.count', -1) do
      delete service_of_dependence_url(@service_of_dependence)
    end

    assert_redirected_to service_of_dependences_url
  end
end
