require 'test_helper'

class DaysOfReportDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @days_of_report_detail = days_of_report_details(:one)
  end

  test "should get index" do
    get days_of_report_details_url
    assert_response :success
  end

  test "should get new" do
    get new_days_of_report_detail_url
    assert_response :success
  end

  test "should create days_of_report_detail" do
    assert_difference('DaysOfReportDetail.count') do
      post days_of_report_details_url, params: { days_of_report_detail: { cant: @days_of_report_detail.cant, day: @days_of_report_detail.day, report_details_id: @days_of_report_detail.report_details_id } }
    end

    assert_redirected_to days_of_report_detail_url(DaysOfReportDetail.last)
  end

  test "should show days_of_report_detail" do
    get days_of_report_detail_url(@days_of_report_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_days_of_report_detail_url(@days_of_report_detail)
    assert_response :success
  end

  test "should update days_of_report_detail" do
    patch days_of_report_detail_url(@days_of_report_detail), params: { days_of_report_detail: { cant: @days_of_report_detail.cant, day: @days_of_report_detail.day, report_details_id: @days_of_report_detail.report_details_id } }
    assert_redirected_to days_of_report_detail_url(@days_of_report_detail)
  end

  test "should destroy days_of_report_detail" do
    assert_difference('DaysOfReportDetail.count', -1) do
      delete days_of_report_detail_url(@days_of_report_detail)
    end

    assert_redirected_to days_of_report_details_url
  end
end
