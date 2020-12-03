class Meeting < ApplicationRecord
  validates :start_time, :end_time, :title, :description, presence: true
  has_many :participates, dependent: :destroy
  has_many :users, through: :participates
end
