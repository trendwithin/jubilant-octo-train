require 'csv'
class TradeableUniverse < ApplicationRecord
  validates :three_month, presence: true, numericality: true
  validates :six_month, presence: true, numericality: true

  scope :date_desc, -> (limit) { order("created_at desc").limit(limit) }

  def self.to_csv
    attributes = %w{ id three_month six_month created_at updated_at }

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |universe|
        csv << attributes.map { |attr| universe.send(attr) }
      end
    end
  end
end
