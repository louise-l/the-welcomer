class Library < ApplicationRecord
  belongs_to :company
  has_one_attached :file
  validates :label, presence: true
end
