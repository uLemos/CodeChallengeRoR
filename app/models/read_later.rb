class ReadLater < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :user, presence: true
  validates :article, presence: true
  validates :user_id, uniqueness: { scope: :article_id, message: "You have already saved this article." }
end
