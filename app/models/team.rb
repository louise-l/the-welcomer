class Team < ApplicationRecord
  has_many :teams_members
  has_one_attached :photo
end
