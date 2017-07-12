class Cluster < ApplicationRecord
  belongs_to :classification
  has_many :cluster_documents
  has_many :words
  belongs_to :parent, class_name: "Cluster", optional: true
  has_many :children, class_name: "Cluster", foreign_key: :parent_id
end
