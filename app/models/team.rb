class Team < ApplicationRecord
  has_many :users
  belongs_to :company
  has_one_attached :photo
end
