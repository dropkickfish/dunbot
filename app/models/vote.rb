class Vote < ApplicationRecord
  has_many :options
  has_many :participants
end
