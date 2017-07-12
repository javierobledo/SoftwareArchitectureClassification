class Cluster < ApplicationRecord
  belongs_to :classification
  has_many :cluster_documents, dependent: :destroy
  has_many :words, dependent: :destroy
  belongs_to :parent, class_name: "Cluster", optional: true
  has_many :children, class_name: "Cluster", foreign_key: :parent_id
end
