class ValuedClaParameter < ApplicationRecord
  belongs_to :parameter
  belongs_to :classification
end
