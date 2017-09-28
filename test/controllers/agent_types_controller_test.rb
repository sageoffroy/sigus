require 'test_helper'

class AgentTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agent_type = agent_types(:one)
  end

  test "should get index" do
    get agent_types_url
    assert_response :success
  end

  test "should get new" do
    get new_agent_type_url
    assert_response :success
  end

  test "should create agent_type" do
    assert_difference('AgentType.count') do
      post agent_types_url, params: { agent_type: { code: @agent_type.code, description: @agent_type.description, quant_hours: @agent_type.quant_hours } }
    end

    assert_redirected_to agent_type_url(AgentType.last)
  end

  test "should show agent_type" do
    get agent_type_url(@agent_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_agent_type_url(@agent_type)
    assert_response :success
  end

  test "should update agent_type" do
    patch agent_type_url(@agent_type), params: { agent_type: { code: @agent_type.code, description: @agent_type.description, quant_hours: @agent_type.quant_hours } }
    assert_redirected_to agent_type_url(@agent_type)
  end

  test "should destroy agent_type" do
    assert_difference('AgentType.count', -1) do
      delete agent_type_url(@agent_type)
    end

    assert_redirected_to agent_types_url
  end
end
