class Activity < ApplicationRecord
  has_one_attached :file
  validates :name, :date, presence: true
end
