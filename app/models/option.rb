class Option < ApplicationRecord
  belongs_to :vote, inverse_of: :options
end
