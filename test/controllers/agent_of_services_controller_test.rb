require 'test_helper'

class AgentOfServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agent_of_service = agent_of_services(:one)
  end

  test "should get index" do
    get agent_of_services_url
    assert_response :success
  end

  test "should get new" do
    get new_agent_of_service_url
    assert_response :success
  end

  test "should create agent_of_service" do
    assert_difference('AgentOfService.count') do
      post agent_of_services_url, params: { agent_of_service: { agent_id: @agent_of_service.agent_id, description: @agent_of_service.description, service_id: @agent_of_service.service_id } }
    end

    assert_redirected_to agent_of_service_url(AgentOfService.last)
  end

  test "should show agent_of_service" do
    get agent_of_service_url(@agent_of_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_agent_of_service_url(@agent_of_service)
    assert_response :success
  end

  test "should update agent_of_service" do
    patch agent_of_service_url(@agent_of_service), params: { agent_of_service: { agent_id: @agent_of_service.agent_id, description: @agent_of_service.description, service_id: @agent_of_service.service_id } }
    assert_redirected_to agent_of_service_url(@agent_of_service)
  end

  test "should destroy agent_of_service" do
    assert_difference('AgentOfService.count', -1) do
      delete agent_of_service_url(@agent_of_service)
    end

    assert_redirected_to agent_of_services_url
  end
end
