class Classification < ApplicationRecord
  belongs_to :algorithm
  belongs_to :preprocessing
  has_many :clusters, dependent: :destroy
  has_many :valued_cla_parameters, dependent: :destroy
  def get_clusters_root
    self.clusters.find_by(:classification_id => self.id, :parent_id => nil)
  end
end
