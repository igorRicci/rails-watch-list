class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks
  validates :overview, :title, presence: true, allow_blank: false
  validates :title, uniqueness: true
end
