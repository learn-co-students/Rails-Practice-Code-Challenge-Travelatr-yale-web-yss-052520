class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :likes]

  def show
  end

  def new
    @post = Post.new
    @bloggers = Blogger.all
    @destinations = Destination.all
  end

  def create
    @post = Post.new(post_params)
    validate(new_post_path)
  end

  def edit
    @bloggers = Blogger.all
    @destinations = Destination.all
  end

  def update
    @post.update(post_params)
    validate(edit_post_path(@post))
  end

  def likes
    @post.update(likes: @post.likes + 1)
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def validate(error_path)
    if @post.valid? 
      @post.save
      redirect_to post_path(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to error_path
    end
  end

end
