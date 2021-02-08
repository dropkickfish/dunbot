class Participant < ApplicationRecord
  has_many :ballots
  belongs_to :vote, inverse_of: :participants
  belongs_to :user, inverse_of: :participants, optional:true
end
