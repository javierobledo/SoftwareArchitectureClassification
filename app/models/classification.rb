class Classification < ApplicationRecord
  belongs_to :algorithm
  belongs_to :preprocessing
  has_many :clusters
  has_many :valued_cla_parameters
end
