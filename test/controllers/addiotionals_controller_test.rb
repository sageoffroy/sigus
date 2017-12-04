require 'test_helper'

class AddiotionalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @addiotional = addiotionals(:one)
  end

  test "should get index" do
    get addiotionals_url
    assert_response :success
  end

  test "should get new" do
    get new_addiotional_url
    assert_response :success
  end

  test "should create addiotional" do
    assert_difference('Addiotional.count') do
      post addiotionals_url, params: { addiotional: { agent_id: @addiotional.agent_id, description: @addiotional.description, fm: @addiotional.fm, month: @addiotional.month, rotative_turn_id: @addiotional.rotative_turn_id, tnf: @addiotional.tnf, tt: @addiotional.tt, year: @addiotional.year } }
    end

    assert_redirected_to addiotional_url(Addiotional.last)
  end

  test "should show addiotional" do
    get addiotional_url(@addiotional)
    assert_response :success
  end

  test "should get edit" do
    get edit_addiotional_url(@addiotional)
    assert_response :success
  end

  test "should update addiotional" do
    patch addiotional_url(@addiotional), params: { addiotional: { agent_id: @addiotional.agent_id, description: @addiotional.description, fm: @addiotional.fm, month: @addiotional.month, rotative_turn_id: @addiotional.rotative_turn_id, tnf: @addiotional.tnf, tt: @addiotional.tt, year: @addiotional.year } }
    assert_redirected_to addiotional_url(@addiotional)
  end

  test "should destroy addiotional" do
    assert_difference('Addiotional.count', -1) do
      delete addiotional_url(@addiotional)
    end

    assert_redirected_to addiotionals_url
  end
end
