class Activity < ApplicationRecord
  validates :name, :date, presence: true
end
