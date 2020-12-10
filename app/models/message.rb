class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  validates :content, presence: true, allow_blank: false
end
