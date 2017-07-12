class Classification < ApplicationRecord
  belongs_to :algorithm
  belongs_to :preprocessing
  has_many :clusters, dependent: :destroy
  has_many :valued_cla_parameters, dependent: :destroy
end
