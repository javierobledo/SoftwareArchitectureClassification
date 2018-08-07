# json.extract! cluster, :id, :name, :classification_id, :parent_id, :created_at, :updated_at
# json.url cluster_url(cluster, format: :json)
json.array! cluster.word_frequencies.order(:frequency).reverse, partial: 'word_frequencies/word_frequency', as: :word_frequency