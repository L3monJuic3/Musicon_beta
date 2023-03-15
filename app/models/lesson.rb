class Lesson < ApplicationRecord
  has_many :slots, dependent: :destroy

  belongs_to :user
end
