class Meeting < ApplicationRecord
  validates :date_in, :date_out, :title, :description, presence: true
end
