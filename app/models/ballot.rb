class Ballot < ApplicationRecord
  belongs_to :option, inverse_of: :ballot
  belongs_to :participant, inverse_of: :ballot
end
