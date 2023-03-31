class Lesson < ApplicationRecord
  has_many :slots, dependent: :destroy
  has_one_attached :photo

  belongs_to :user
end
