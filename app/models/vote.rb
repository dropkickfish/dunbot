class Vote < ApplicationRecord
  has_many :options
  has_many :participants

  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :participants, reject_if: :all_blank, allow_destroy: true
end
