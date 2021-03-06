class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  validates :user_id, presence: true
  validates :article_id, presence: true
  validates :content, presence: true
end
