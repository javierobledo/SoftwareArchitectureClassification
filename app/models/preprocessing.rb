class Preprocessing < ApplicationRecord
  belongs_to :corpus
  belongs_to :algorithm
  belongs_to :parent, class_name: "Preprocessing", optional: true
  has_many :children, class_name: "Preprocessing", foreign_key: :parent_id
  has_many :documents, dependent: :destroy
end
