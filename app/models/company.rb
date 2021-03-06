class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :teams, dependent: :destroy
  has_many :libraries, dependent: :destroy
  has_one_attached :logo


  def full_name
    self.users.map { |user| "#{user.first_name} #{user.last_name}"}
  end

end
