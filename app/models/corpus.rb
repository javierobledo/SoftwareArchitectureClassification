class Corpus < ApplicationRecord
  has_many :preprocessings, dependent: :destroy
end
