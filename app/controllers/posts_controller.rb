class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]
  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
    @post.user_id = current_user.id
  	if @post.save
  		flash[:success] = "Post created"
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end



  private

  def post_params
  	params.require(:post).permit(:body_text)
  end

  def require_login
    unless logged_in?
      flash[:danger] = "You must be logged in to access this page"
      redirect_to login_path
    end
  end
end
