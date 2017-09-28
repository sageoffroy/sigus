require 'test_helper'

class JobFunctionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_function = job_functions(:one)
  end

  test "should get index" do
    get job_functions_url
    assert_response :success
  end

  test "should get new" do
    get new_job_function_url
    assert_response :success
  end

  test "should create job_function" do
    assert_difference('JobFunction.count') do
      post job_functions_url, params: { job_function: { name: @job_function.name, observation: @job_function.observation } }
    end

    assert_redirected_to job_function_url(JobFunction.last)
  end

  test "should show job_function" do
    get job_function_url(@job_function)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_function_url(@job_function)
    assert_response :success
  end

  test "should update job_function" do
    patch job_function_url(@job_function), params: { job_function: { name: @job_function.name, observation: @job_function.observation } }
    assert_redirected_to job_function_url(@job_function)
  end

  test "should destroy job_function" do
    assert_difference('JobFunction.count', -1) do
      delete job_function_url(@job_function)
    end

    assert_redirected_to job_functions_url
  end
end
