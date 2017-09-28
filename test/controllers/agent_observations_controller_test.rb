require 'test_helper'

class AgentObservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agent_observation = agent_observations(:one)
  end

  test "should get index" do
    get agent_observations_url
    assert_response :success
  end

  test "should get new" do
    get new_agent_observation_url
    assert_response :success
  end

  test "should create agent_observation" do
    assert_difference('AgentObservation.count') do
      post agent_observations_url, params: { agent_observation: { observation_id: @agent_observation.observation_id, quant: @agent_observation.quant } }
    end

    assert_redirected_to agent_observation_url(AgentObservation.last)
  end

  test "should show agent_observation" do
    get agent_observation_url(@agent_observation)
    assert_response :success
  end

  test "should get edit" do
    get edit_agent_observation_url(@agent_observation)
    assert_response :success
  end

  test "should update agent_observation" do
    patch agent_observation_url(@agent_observation), params: { agent_observation: { observation_id: @agent_observation.observation_id, quant: @agent_observation.quant } }
    assert_redirected_to agent_observation_url(@agent_observation)
  end

  test "should destroy agent_observation" do
    assert_difference('AgentObservation.count', -1) do
      delete agent_observation_url(@agent_observation)
    end

    assert_redirected_to agent_observations_url
  end
end
