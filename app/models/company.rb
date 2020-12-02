class Company < ApplicationRecord
  has_many :users, dependent: :destroy
end
