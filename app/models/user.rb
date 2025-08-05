class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :tags
  has_many :read_laters, dependent: :destroy
  has_many :articles, through: :read_laters
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
