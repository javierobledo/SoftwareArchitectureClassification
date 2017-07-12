require 'test_helper'

class CorporaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @corpus = corpora(:one)
  end

  test "should get index" do
    get corpora_url
    assert_response :success
  end

  test "should get new" do
    get new_corpus_url
    assert_response :success
  end

  test "should create corpus" do
    assert_difference('Corpus.count') do
      post corpora_url, params: { corpus: { description: @corpus.description, language: @corpus.language, name: @corpus.name } }
    end

    assert_redirected_to corpus_url(Corpus.last)
  end

  test "should show corpus" do
    get corpus_url(@corpus)
    assert_response :success
  end

  test "should get edit" do
    get edit_corpus_url(@corpus)
    assert_response :success
  end

  test "should update corpus" do
    patch corpus_url(@corpus), params: { corpus: { description: @corpus.description, language: @corpus.language, name: @corpus.name } }
    assert_redirected_to corpus_url(@corpus)
  end

  test "should destroy corpus" do
    assert_difference('Corpus.count', -1) do
      delete corpus_url(@corpus)
    end

    assert_redirected_to corpora_url
  end
end
