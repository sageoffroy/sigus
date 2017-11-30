require 'test_helper'

class NoveltyTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @novelty_type = novelty_types(:one)
  end

  test "should get index" do
    get novelty_types_url
    assert_response :success
  end

  test "should get new" do
    get new_novelty_type_url
    assert_response :success
  end

  test "should create novelty_type" do
    assert_difference('NoveltyType.count') do
      post novelty_types_url, params: { novelty_type: { description: @novelty_type.description } }
    end

    assert_redirected_to novelty_type_url(NoveltyType.last)
  end

  test "should show novelty_type" do
    get novelty_type_url(@novelty_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_novelty_type_url(@novelty_type)
    assert_response :success
  end

  test "should update novelty_type" do
    patch novelty_type_url(@novelty_type), params: { novelty_type: { description: @novelty_type.description } }
    assert_redirected_to novelty_type_url(@novelty_type)
  end

  test "should destroy novelty_type" do
    assert_difference('NoveltyType.count', -1) do
      delete novelty_type_url(@novelty_type)
    end

    assert_redirected_to novelty_types_url
  end
end
