class Mission < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  has_many :notifications, as: :notifiable, dependent: :destroy
end
