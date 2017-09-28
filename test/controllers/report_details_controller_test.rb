require 'test_helper'

class ReportDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @report_detail = report_details(:one)
  end

  test "should get index" do
    get report_details_url
    assert_response :success
  end

  test "should get new" do
    get new_report_detail_url
    assert_response :success
  end

  test "should create report_detail" do
    assert_difference('ReportDetail.count') do
      post report_details_url, params: { report_detail: { belong_service: @report_detail.belong_service, fm: @report_detail.fm, hours_to_add: @report_detail.hours_to_add, hours_to_remove: @report_detail.hours_to_remove, observation_id: @report_detail.observation_id, report_id: @report_detail.report_id, tnf: @report_detail.tnf, total_hours: @report_detail.total_hours, total_office_hours: @report_detail.total_office_hours, tr: @report_detail.tr, tt: @report_detail.tt } }
    end

    assert_redirected_to report_detail_url(ReportDetail.last)
  end

  test "should show report_detail" do
    get report_detail_url(@report_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_report_detail_url(@report_detail)
    assert_response :success
  end

  test "should update report_detail" do
    patch report_detail_url(@report_detail), params: { report_detail: { belong_service: @report_detail.belong_service, fm: @report_detail.fm, hours_to_add: @report_detail.hours_to_add, hours_to_remove: @report_detail.hours_to_remove, observation_id: @report_detail.observation_id, report_id: @report_detail.report_id, tnf: @report_detail.tnf, total_hours: @report_detail.total_hours, total_office_hours: @report_detail.total_office_hours, tr: @report_detail.tr, tt: @report_detail.tt } }
    assert_redirected_to report_detail_url(@report_detail)
  end

  test "should destroy report_detail" do
    assert_difference('ReportDetail.count', -1) do
      delete report_detail_url(@report_detail)
    end

    assert_redirected_to report_details_url
  end
end
