class Meeting < ApplicationRecord
  validates :start_time, :end_time, :title, :description, presence: true
  has_many :participates, dependent: :destroy
  has_many :users, through: :participates
  has_many :notifications, as: :notifiable, dependent: :destroy
  validate :start_time_after_end_time
  validate :time_not_blank


private

  def time_not_blank
    if start_time.blank?
      errors.add(:start_time, "cannot be blank")
    elsif end_time.blank?
      errors.add(:end_time, "cannot be blank")
    end
  end


  def start_time_after_end_time
    if end_time < start_time
      errors.add(:end_time, "must be after the date in")
    end
  end
end
