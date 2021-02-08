class Ballot < ApplicationRecord
  belongs_to :option, inverse_of: :ballots
  belongs_to :participant, inverse_of: :ballots
end
