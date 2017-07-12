require 'test_helper'

class ValuedClaParametersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valued_cla_parameter = valued_cla_parameters(:one)
  end

  test "should get index" do
    get valued_cla_parameters_url
    assert_response :success
  end

  test "should get new" do
    get new_valued_cla_parameter_url
    assert_response :success
  end

  test "should create valued_cla_parameter" do
    assert_difference('ValuedClaParameter.count') do
      post valued_cla_parameters_url, params: { valued_cla_parameter: { classification_id: @valued_cla_parameter.classification_id, parameter_id: @valued_cla_parameter.parameter_id, value: @valued_cla_parameter.value } }
    end

    assert_redirected_to valued_cla_parameter_url(ValuedClaParameter.last)
  end

  test "should show valued_cla_parameter" do
    get valued_cla_parameter_url(@valued_cla_parameter)
    assert_response :success
  end

  test "should get edit" do
    get edit_valued_cla_parameter_url(@valued_cla_parameter)
    assert_response :success
  end

  test "should update valued_cla_parameter" do
    patch valued_cla_parameter_url(@valued_cla_parameter), params: { valued_cla_parameter: { classification_id: @valued_cla_parameter.classification_id, parameter_id: @valued_cla_parameter.parameter_id, value: @valued_cla_parameter.value } }
    assert_redirected_to valued_cla_parameter_url(@valued_cla_parameter)
  end

  test "should destroy valued_cla_parameter" do
    assert_difference('ValuedClaParameter.count', -1) do
      delete valued_cla_parameter_url(@valued_cla_parameter)
    end

    assert_redirected_to valued_cla_parameters_url
  end
end
