class ReadLater < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_and_belongs_to_many :tags
  validates :user, presence: true
  validates :article, presence: true
  validates :article_id, uniqueness: { scope: :user_id, message: "You have already saved this article." }
end
