class ClusterDocument < ApplicationRecord
  belongs_to :cluster
  belongs_to :document
end
