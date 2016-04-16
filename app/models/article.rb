class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :commentors, :through => :comments,:source => :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true







  
  # Retrieve all comments related to an article
	def discussion
        Comment.where("article_id = ?", id)
    end


    
end



