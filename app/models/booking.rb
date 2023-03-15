class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :slot

  scope :ordered, -> { order(booking: :asc) }
end
