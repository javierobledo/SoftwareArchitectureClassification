class Parameter < ApplicationRecord
  belongs_to :algorithm
  has_many :valued_cla_parameters
  has_many :valued_pre_parameters
end
