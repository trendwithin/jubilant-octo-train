class FivePeriodLeader < ApplicationRecord
  validates :positive, presence: true
  validates :negative, presence: true

  scope :date_desc, -> (limit) { order("created_at desc").limit(limit) }
end
