class Document < ApplicationRecord
  belongs_to :preprocessing
  has_many :cluster_documents, dependent: :destroy
end
