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
  belongs_to :company
  has_one_attached :photo
  belongs_to :team
  has_many :libraries, dependent: :destroy

    def arrives_in
      days_until_arrival = (arrival_date - Date.today).to_i
      if days_until_arrival.positive?
        "Arrives in #{days_until_arrival} days"
      else
        "Arrived since #{- days_until_arrival} days"
      end
   end

  def progression
  @sum_mastered = self.missions.where(status: "Mastered").count + self.habits.where(status: "Mastered").count
  @sum_missions = self.missions.count + self.habits.count
    if @sum_mastered == 0
      @average = 0
    else
      @average = ((@sum_mastered.to_f / @sum_missions.to_f) * 100).round
    end
  end
end
