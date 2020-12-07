class PersonalLibrary < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  validates :label, presence: true
end
