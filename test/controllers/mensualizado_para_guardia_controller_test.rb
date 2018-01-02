require 'test_helper'

class MensualizadoParaGuardiaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mensualizado_para_guardia_index_url
    assert_response :success
  end

end
