module PostsHelper

	def user_name(user_id)
		user = User.find_by(user_id)
		user.name
	end
end
