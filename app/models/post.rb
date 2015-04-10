class Post < ActiveRecord::Base
	belongs_to :user
	validates :body_text, presence: true, length: { maximum: 500 }
	validates :user_id, presence: true
end
