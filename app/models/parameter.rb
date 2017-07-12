class Parameter < ApplicationRecord
  belongs_to :algorithm
  has_many :valued_cla_parameters, dependent: :destroy
  has_many :valued_pre_parameters, dependent: :destroy
end
