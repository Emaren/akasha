class PostsController < ApplicationController

  before_action :find_post, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_user!

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
    redirect_to @post
    else
    render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update

    if @post.update post_params
      redirect_to root_path
    else
      render 'edit'
    end

  end

  def destroy

    if @post.destroy
      redirect_to root_path, notice: "Deleted!"
    else
      redirect_to root_path, notice: "Error!"
    end
  end


  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find params[:id]
  end

end
