class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :teams, through: :users

  def full_name
    self.users.map { |user| "#{user.first_name} #{user.last_name}"}
  end

end
