require 'test_helper'

class CoveragesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coverage = coverages(:one)
  end

  test "should get index" do
    get coverages_url
    assert_response :success
  end

  test "should get new" do
    get new_coverage_url
    assert_response :success
  end

  test "should create coverage" do
    assert_difference('Coverage.count') do
      post coverages_url, params: { coverage: { hs_domingo: @coverage.hs_domingo, hs_jueves_diurnas: @coverage.hs_jueves_diurnas, hs_jueves_nocturnas: @coverage.hs_jueves_nocturnas, hs_lunes_diurnas: @coverage.hs_lunes_diurnas, hs_lunes_nocturnas: @coverage.hs_lunes_nocturnas, hs_martes_diurnas: @coverage.hs_martes_diurnas, hs_martes_nocturnas: @coverage.hs_martes_nocturnas, hs_miercoles_diurnas: @coverage.hs_miercoles_diurnas, hs_miercoles_nocturnas: @coverage.hs_miercoles_nocturnas, hs_sabado: @coverage.hs_sabado, hs_viernes_diurnas: @coverage.hs_viernes_diurnas, hs_viernes_nocturnas: @coverage.hs_viernes_nocturnas, service_of_dependence_id: @coverage.service_of_dependence_id } }
    end

    assert_redirected_to coverage_url(Coverage.last)
  end

  test "should show coverage" do
    get coverage_url(@coverage)
    assert_response :success
  end

  test "should get edit" do
    get edit_coverage_url(@coverage)
    assert_response :success
  end

  test "should update coverage" do
    patch coverage_url(@coverage), params: { coverage: { hs_domingo: @coverage.hs_domingo, hs_jueves_diurnas: @coverage.hs_jueves_diurnas, hs_jueves_nocturnas: @coverage.hs_jueves_nocturnas, hs_lunes_diurnas: @coverage.hs_lunes_diurnas, hs_lunes_nocturnas: @coverage.hs_lunes_nocturnas, hs_martes_diurnas: @coverage.hs_martes_diurnas, hs_martes_nocturnas: @coverage.hs_martes_nocturnas, hs_miercoles_diurnas: @coverage.hs_miercoles_diurnas, hs_miercoles_nocturnas: @coverage.hs_miercoles_nocturnas, hs_sabado: @coverage.hs_sabado, hs_viernes_diurnas: @coverage.hs_viernes_diurnas, hs_viernes_nocturnas: @coverage.hs_viernes_nocturnas, service_of_dependence_id: @coverage.service_of_dependence_id } }
    assert_redirected_to coverage_url(@coverage)
  end

  test "should destroy coverage" do
    assert_difference('Coverage.count', -1) do
      delete coverage_url(@coverage)
    end

    assert_redirected_to coverages_url
  end
end
