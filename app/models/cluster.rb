class Cluster < ApplicationRecord
  belongs_to :classification
  has_many :cluster_documents, dependent: :destroy
  has_many :words, dependent: :destroy
  has_many :word_frequencies, dependent: :destroy
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
    self.attributes.merge({:words => self.most_frequent_word,:children => self.children.map { |c| c.to_node3 }})
  end

  def most_frequent_word
    @ordered_frequencies = self.word_frequencies.order(:frequency).reverse
    max = @ordered_frequencies[0]["frequency"]
    words = Array.new
    i = 1
    @ordered_frequencies.each do |ordered_frequency|
      if max == ordered_frequency["frequency"]
        words.push(ordered_frequency["content"])
        i += 1
      end
      if max < ordered_frequency["frequency"] or i >= 3
        break
      end
    end
    words.join("-")
  end
end
