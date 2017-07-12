class Algorithm < ApplicationRecord
  has_many :preprocessings, dependent: :destroy
  has_many :classifications, dependent: :destroy
  has_many :parameters, dependent: :destroy
end
