class ValuedPreParameter < ApplicationRecord
  belongs_to :parameter
  belongs_to :preprocessing
end
