class FivePeriodLeader < ApplicationRecord
  validates :positive, presence: true
  validates :negative, presence: true
end
