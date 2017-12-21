require 'test_helper'

class AdditionalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @additional = additionals(:one)
  end

  test "should get index" do
    get additionals_url
    assert_response :success
  end

  test "should get new" do
    get new_additional_url
    assert_response :success
  end

  test "should create additional" do
    assert_difference('Additional.count') do
      post additionals_url, params: { additional: { month: @additional.month, service_of_dependence_id: @additional.service_of_dependence_id, year: @additional.year } }
    end

    assert_redirected_to additional_url(Additional.last)
  end

  test "should show additional" do
    get additional_url(@additional)
    assert_response :success
  end

  test "should get edit" do
    get edit_additional_url(@additional)
    assert_response :success
  end

  test "should update additional" do
    patch additional_url(@additional), params: { additional: { month: @additional.month, service_of_dependence_id: @additional.service_of_dependence_id, year: @additional.year } }
    assert_redirected_to additional_url(@additional)
  end

  test "should destroy additional" do
    assert_difference('Additional.count', -1) do
      delete additional_url(@additional)
    end

    assert_redirected_to additionals_url
  end
end
