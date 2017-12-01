require 'test_helper'

class PercentageMonthsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @percentage_month = percentage_months(:one)
  end

  test "should get index" do
    get percentage_months_url
    assert_response :success
  end

  test "should get new" do
    get new_percentage_month_url
    assert_response :success
  end

  test "should create percentage_month" do
    assert_difference('PercentageMonth.count') do
      post percentage_months_url, params: { percentage_month: { mes: @percentage_month.mes, valor: @percentage_month.valor } }
    end

    assert_redirected_to percentage_month_url(PercentageMonth.last)
  end

  test "should show percentage_month" do
    get percentage_month_url(@percentage_month)
    assert_response :success
  end

  test "should get edit" do
    get edit_percentage_month_url(@percentage_month)
    assert_response :success
  end

  test "should update percentage_month" do
    patch percentage_month_url(@percentage_month), params: { percentage_month: { mes: @percentage_month.mes, valor: @percentage_month.valor } }
    assert_redirected_to percentage_month_url(@percentage_month)
  end

  test "should destroy percentage_month" do
    assert_difference('PercentageMonth.count', -1) do
      delete percentage_month_url(@percentage_month)
    end

    assert_redirected_to percentage_months_url
  end
end
