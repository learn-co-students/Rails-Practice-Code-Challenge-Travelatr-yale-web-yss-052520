class PostsController < ApplicationController
    before_action :current_post, only: [:show, :edit, :update, :likes]
  
    def show
    end
  
    def new
      @bloggers = Blogger.all
      @destinations = Destination.all
      @post = Post.new
    end
  
    def create
      @post = Post.new(post_params)
      if @post.valid? 
        @post.save
        redirect_to post_path(@post)
      else
        flash[:errors] = @post.errors.full_messages
        redirect_to new_post_path
      end
    end
  
    def edit
    end
  
    def update
      @post.update(post_params)
      if @post.valid? 
        @post.save
        redirect_to post_path(@post)
      else
        flash[:errors] = @post.errors.full_messages
        redirect_to edit_post_path(@post)
      end
    end
  
    def likes
        @post.update(likes: @post.likes + 1)
        redirect_to post_path(@post)
      end
      
    private
  
    def post_params
      params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
    end
  
    def current_post
      @post = Post.find(params[:id])
    end
  
  end