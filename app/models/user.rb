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
  has_many :meetings, through: :participates
  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'
  has_many :messages, dependent: :destroy
  belongs_to :company
  has_one_attached :photo
  belongs_to :team

  def full_name
    self.full_name + self.last_name
  end
end
