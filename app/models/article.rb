class Article < ApplicationRecord
  has_many :read_laters
  has_many :users, through: :read_laters
  validates :title, presence: true
  validates :url, presence: true
  validates :source_name, presence: true
end
