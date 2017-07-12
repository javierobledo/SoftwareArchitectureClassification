class Classification < ApplicationRecord
  belongs_to :algorithm
  belongs_to :preprocessing
end
