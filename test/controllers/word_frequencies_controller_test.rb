require 'test_helper'

class WordFrequenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @word_frequency = word_frequencies(:one)
  end

  test "should get index" do
    get word_frequencies_url
    assert_response :success
  end

  test "should get new" do
    get new_word_frequency_url
    assert_response :success
  end

  test "should create word_frequency" do
    assert_difference('WordFrequency.count') do
      post word_frequencies_url, params: { word_frequency: { cluster_id: @word_frequency.cluster_id, content: @word_frequency.content, frequency: @word_frequency.frequency } }
    end

    assert_redirected_to word_frequency_url(WordFrequency.last)
  end

  test "should show word_frequency" do
    get word_frequency_url(@word_frequency)
    assert_response :success
  end

  test "should get edit" do
    get edit_word_frequency_url(@word_frequency)
    assert_response :success
  end

  test "should update word_frequency" do
    patch word_frequency_url(@word_frequency), params: { word_frequency: { cluster_id: @word_frequency.cluster_id, content: @word_frequency.content, frequency: @word_frequency.frequency } }
    assert_redirected_to word_frequency_url(@word_frequency)
  end

  test "should destroy word_frequency" do
    assert_difference('WordFrequency.count', -1) do
      delete word_frequency_url(@word_frequency)
    end

    assert_redirected_to word_frequencies_url
  end
end
