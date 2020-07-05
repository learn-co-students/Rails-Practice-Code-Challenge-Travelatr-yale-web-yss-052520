class BloggersController < ApplicationController
    
    def index
        @bloggers = Blogger.all
        @age = Blogger.average_blogger_age
    end
    
    def new 
        @blogger = Blogger.new
    end

    def create 
        blogger = Blogger.new(blogger_params)
        # @blogger.save
        if blogger.valid?
            blogger.save
            redirect_to "/bloggers/#{blogger.id}"
        else 
            flash[:errors] = blogger.errors.full_messages
            redirect_to "/bloggers/new"
        end        
    end

    def show
        @blogger = Blogger.find(params[:id])
        @likes = @blogger.total_likes
        @featured_post = @blogger.blogger_featured_post
    end

    

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end    
end