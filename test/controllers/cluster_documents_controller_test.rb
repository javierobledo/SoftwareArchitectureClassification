require 'test_helper'

class ClusterDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cluster_document = cluster_documents(:one)
  end

  test "should get index" do
    get cluster_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_cluster_document_url
    assert_response :success
  end

  test "should create cluster_document" do
    assert_difference('ClusterDocument.count') do
      post cluster_documents_url, params: { cluster_document: { cluster_id: @cluster_document.cluster_id, document_id: @cluster_document.document_id } }
    end

    assert_redirected_to cluster_document_url(ClusterDocument.last)
  end

  test "should show cluster_document" do
    get cluster_document_url(@cluster_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_cluster_document_url(@cluster_document)
    assert_response :success
  end

  test "should update cluster_document" do
    patch cluster_document_url(@cluster_document), params: { cluster_document: { cluster_id: @cluster_document.cluster_id, document_id: @cluster_document.document_id } }
    assert_redirected_to cluster_document_url(@cluster_document)
  end

  test "should destroy cluster_document" do
    assert_difference('ClusterDocument.count', -1) do
      delete cluster_document_url(@cluster_document)
    end

    assert_redirected_to cluster_documents_url
  end
end
