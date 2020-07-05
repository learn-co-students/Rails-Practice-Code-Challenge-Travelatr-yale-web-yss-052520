class PostsController < ApplicationController
    
    def index
        @posts = Post.all
    end


    def show
        @post = Post.find(params[:id])
    end

    def new 
        @bloggers = Blogger.all
        @destinations = Destination.all
        @post = Post.new
    end


    def create 
        @post = Post.new(post_params)
        # @blogger.save
        if @post.valid?
            @post.save
            redirect_to "/posts/#{@post.id}" 
        else 
            flash[:errors] = @post.errors.full_messages
            redirect_to "/posts/new"
        end        
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        if params[:post] == nil
            @post = Post.find(params[:id])
            @post.update(likes: @post.likes + 1)
            
        else    
            @post.update(post_params)
        end
        
        # redirect_to "/posts/#{post.id}"
        redirect_to @post 
    end    

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end    
end