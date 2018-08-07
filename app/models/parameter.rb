class Parameter < ApplicationRecord
  belongs_to :algorithm
  has_many :valued_cla_parameters, dependent: :destroy
  accepts_nested_attributes_for :valued_cla_parameters, reject_if: proc { |attributes| attributes[:value].blank? }
  has_many :valued_pre_parameters, dependent: :destroy
end
