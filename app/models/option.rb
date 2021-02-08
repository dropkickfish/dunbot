class Option < ApplicationRecord
  has_many :ballots
  belongs_to :vote, inverse_of: :options
end
