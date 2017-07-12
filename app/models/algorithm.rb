class Algorithm < ApplicationRecord
  has_many :preprocessings
  has_many :classifications
  has_many :parameters
end
