require 'test_helper'

class RotativeTurnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rotative_turn = rotative_turns(:one)
  end

  test "should get index" do
    get rotative_turns_url
    assert_response :success
  end

  test "should get new" do
    get new_rotative_turn_url
    assert_response :success
  end

  test "should create rotative_turn" do
    assert_difference('RotativeTurn.count') do
      post rotative_turns_url, params: { rotative_turn: { days: @rotative_turn.days, is_complete: @rotative_turn.is_complete } }
    end

    assert_redirected_to rotative_turn_url(RotativeTurn.last)
  end

  test "should show rotative_turn" do
    get rotative_turn_url(@rotative_turn)
    assert_response :success
  end

  test "should get edit" do
    get edit_rotative_turn_url(@rotative_turn)
    assert_response :success
  end

  test "should update rotative_turn" do
    patch rotative_turn_url(@rotative_turn), params: { rotative_turn: { days: @rotative_turn.days, is_complete: @rotative_turn.is_complete } }
    assert_redirected_to rotative_turn_url(@rotative_turn)
  end

  test "should destroy rotative_turn" do
    assert_difference('RotativeTurn.count', -1) do
      delete rotative_turn_url(@rotative_turn)
    end

    assert_redirected_to rotative_turns_url
  end
end
