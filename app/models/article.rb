class Article < ApplicationRecord
  has_many :read_laters
  validates :title, presence: true
  validates :url, presence: true
  validates :source_name, presence: true
end
