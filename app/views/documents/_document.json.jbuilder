json.extract! document, :id, :title, :year, :category, :content, :preprocessing_id, :created_at, :updated_at
json.url document_url(document, format: :json)
