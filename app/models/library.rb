class Library < ApplicationRecord
  belongs_to :company
  has_many_attached :files
end
