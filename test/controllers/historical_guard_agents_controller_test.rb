require 'test_helper'

class HistoricalGuardAgentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @historical_guard_agent = historical_guard_agents(:one)
  end

  test "should get index" do
    get historical_guard_agents_url
    assert_response :success
  end

  test "should get new" do
    get new_historical_guard_agent_url
    assert_response :success
  end

  test "should create historical_guard_agent" do
    assert_difference('HistoricalGuardAgent.count') do
      post historical_guard_agents_url, params: { historical_guard_agent: { agent_id: @historical_guard_agent.agent_id, concept: @historical_guard_agent.concept, description: @historical_guard_agent.description, hs_total: @historical_guard_agent.hs_total, month: @historical_guard_agent.month, year: @historical_guard_agent.year } }
    end

    assert_redirected_to historical_guard_agent_url(HistoricalGuardAgent.last)
  end

  test "should show historical_guard_agent" do
    get historical_guard_agent_url(@historical_guard_agent)
    assert_response :success
  end

  test "should get edit" do
    get edit_historical_guard_agent_url(@historical_guard_agent)
    assert_response :success
  end

  test "should update historical_guard_agent" do
    patch historical_guard_agent_url(@historical_guard_agent), params: { historical_guard_agent: { agent_id: @historical_guard_agent.agent_id, concept: @historical_guard_agent.concept, description: @historical_guard_agent.description, hs_total: @historical_guard_agent.hs_total, month: @historical_guard_agent.month, year: @historical_guard_agent.year } }
    assert_redirected_to historical_guard_agent_url(@historical_guard_agent)
  end

  test "should destroy historical_guard_agent" do
    assert_difference('HistoricalGuardAgent.count', -1) do
      delete historical_guard_agent_url(@historical_guard_agent)
    end

    assert_redirected_to historical_guard_agents_url
  end
end
