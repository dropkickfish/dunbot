class Participant < ApplicationRecord
  belongs_to :vote, inverse_of: :participant
end
