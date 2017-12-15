require 'test_helper'

class NoveltyDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @novelty_detail = novelty_details(:one)
  end

  test "should get index" do
    get novelty_details_url
    assert_response :success
  end

  test "should get new" do
    get new_novelty_detail_url
    assert_response :success
  end

  test "should create novelty_detail" do
    assert_difference('NoveltyDetail.count') do
      post novelty_details_url, params: { novelty_detail: { ,year_ref: @novelty_detail.,year_ref, agent_id: @novelty_detail.agent_id, associated_concept: @novelty_detail.associated_concept, description: @novelty_detail.description, hours_to: @novelty_detail.hours_to, hours_to_add: @novelty_detail.hours_to_add, is_habitual: @novelty_detail.is_habitual, is_umu: @novelty_detail.is_umu, month_ref: @novelty_detail.month_ref, novelty_id: @novelty_detail.novelty_id, novelty_type_id: @novelty_detail.novelty_type_id, remove: @novelty_detail.remove, report_type: @novelty_detail.report_type } }
    end

    assert_redirected_to novelty_detail_url(NoveltyDetail.last)
  end

  test "should show novelty_detail" do
    get novelty_detail_url(@novelty_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_novelty_detail_url(@novelty_detail)
    assert_response :success
  end

  test "should update novelty_detail" do
    patch novelty_detail_url(@novelty_detail), params: { novelty_detail: { ,year_ref: @novelty_detail.,year_ref, agent_id: @novelty_detail.agent_id, associated_concept: @novelty_detail.associated_concept, description: @novelty_detail.description, hours_to: @novelty_detail.hours_to, hours_to_add: @novelty_detail.hours_to_add, is_habitual: @novelty_detail.is_habitual, is_umu: @novelty_detail.is_umu, month_ref: @novelty_detail.month_ref, novelty_id: @novelty_detail.novelty_id, novelty_type_id: @novelty_detail.novelty_type_id, remove: @novelty_detail.remove, report_type: @novelty_detail.report_type } }
    assert_redirected_to novelty_detail_url(@novelty_detail)
  end

  test "should destroy novelty_detail" do
    assert_difference('NoveltyDetail.count', -1) do
      delete novelty_detail_url(@novelty_detail)
    end

    assert_redirected_to novelty_details_url
  end
end
