class Team < ApplicationRecord
  has_many :team_members
  has_many :users, through: :team_members
  has_one_attached :photo
end
