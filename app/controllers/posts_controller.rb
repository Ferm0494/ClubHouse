class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
    @post.user_id = @user.id

    if @post.save
      flash.notice = 'Post saved!'
      redirect_to root_path
    else
      flash.notice = 'Post couldnt be saved'
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
