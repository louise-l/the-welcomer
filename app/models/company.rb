class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :teams, through: :users
end
