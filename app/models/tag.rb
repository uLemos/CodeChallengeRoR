class Tag < ApplicationRecord
  belongs_to :user
  has_many :read_laters
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }
end
