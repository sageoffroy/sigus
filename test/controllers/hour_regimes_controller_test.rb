require 'test_helper'

class HourRegimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hour_regime = hour_regimes(:one)
  end

  test "should get index" do
    get hour_regimes_url
    assert_response :success
  end

  test "should get new" do
    get new_hour_regime_url
    assert_response :success
  end

  test "should create hour_regime" do
    assert_difference('HourRegime.count') do
      post hour_regimes_url, params: { hour_regime: { description: @hour_regime.description, hours: @hour_regime.hours, with_guard: @hour_regime.with_guard } }
    end

    assert_redirected_to hour_regime_url(HourRegime.last)
  end

  test "should show hour_regime" do
    get hour_regime_url(@hour_regime)
    assert_response :success
  end

  test "should get edit" do
    get edit_hour_regime_url(@hour_regime)
    assert_response :success
  end

  test "should update hour_regime" do
    patch hour_regime_url(@hour_regime), params: { hour_regime: { description: @hour_regime.description, hours: @hour_regime.hours, with_guard: @hour_regime.with_guard } }
    assert_redirected_to hour_regime_url(@hour_regime)
  end

  test "should destroy hour_regime" do
    assert_difference('HourRegime.count', -1) do
      delete hour_regime_url(@hour_regime)
    end

    assert_redirected_to hour_regimes_url
  end
end
