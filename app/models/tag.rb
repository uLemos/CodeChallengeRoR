class Tag < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :read_laters
  validates :name, presence: true, uniqueness: true
end
