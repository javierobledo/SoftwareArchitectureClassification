require 'test_helper'

class ValuedPreParametersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valued_pre_parameter = valued_pre_parameters(:one)
  end

  test "should get index" do
    get valued_pre_parameters_url
    assert_response :success
  end

  test "should get new" do
    get new_valued_pre_parameter_url
    assert_response :success
  end

  test "should create valued_pre_parameter" do
    assert_difference('ValuedPreParameter.count') do
      post valued_pre_parameters_url, params: { valued_pre_parameter: { parameter_id: @valued_pre_parameter.parameter_id, preprocessing_id: @valued_pre_parameter.preprocessing_id, value: @valued_pre_parameter.value } }
    end

    assert_redirected_to valued_pre_parameter_url(ValuedPreParameter.last)
  end

  test "should show valued_pre_parameter" do
    get valued_pre_parameter_url(@valued_pre_parameter)
    assert_response :success
  end

  test "should get edit" do
    get edit_valued_pre_parameter_url(@valued_pre_parameter)
    assert_response :success
  end

  test "should update valued_pre_parameter" do
    patch valued_pre_parameter_url(@valued_pre_parameter), params: { valued_pre_parameter: { parameter_id: @valued_pre_parameter.parameter_id, preprocessing_id: @valued_pre_parameter.preprocessing_id, value: @valued_pre_parameter.value } }
    assert_redirected_to valued_pre_parameter_url(@valued_pre_parameter)
  end

  test "should destroy valued_pre_parameter" do
    assert_difference('ValuedPreParameter.count', -1) do
      delete valued_pre_parameter_url(@valued_pre_parameter)
    end

    assert_redirected_to valued_pre_parameters_url
  end
end
