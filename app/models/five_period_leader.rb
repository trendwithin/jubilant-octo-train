class FivePeriodLeader < ApplicationRecord
  validates :positive, presence: true
  validates :negative, presence: true

  scope :date_desc, -> (limit) { order("created_at desc").limit(limit) }

  def self.to_csv
    attributes = %w{ id positive negative created_at updated_at }

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |universe|
        csv << attributes.map { |attr| universe.send(attr) }
      end
    end
  end
end
