class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :job, presence: true
  validates :role, presence: true
  has_many :missions, dependent: :destroy
  has_many :habits, dependent: :destroy
  has_many :participates, dependent: :destroy
  belongs_to :company
  has_one_attached :photo
  belongs_to :team
end
