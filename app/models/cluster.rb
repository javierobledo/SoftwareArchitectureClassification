class Cluster < ApplicationRecord
  belongs_to :classification
  has_many :cluster_documents, dependent: :destroy
  has_many :words, dependent: :destroy
  belongs_to :parent, class_name: "Cluster", optional: true
  has_many :children, class_name: "Cluster", foreign_key: :parent_id
  def to_node
    { "attributes" => self.attributes,
      "children"   => self.children.map { |c| c.to_node }
    }
  end
  def to_node2
    @tree = self.attributes.merge({:children => self.children.map { |c| c.to_node2 }})
    @tree.as_json
  end
  def next_cluster
    Cluster.find(parent_id) if parent_id
  end
  def to_node3
    self.attributes.merge({:children => self.children.map { |c| c.to_node3 }})
  end
end
