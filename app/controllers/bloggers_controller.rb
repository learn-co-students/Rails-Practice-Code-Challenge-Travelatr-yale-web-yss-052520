class BloggersController < ApplicationController
  def show
    @blogger = Blogger.find(params[:id])
    @favorite_post = @blogger.most_liked_post
  end

  def new
    @blogger = Blogger.new 
  end

  def create
    @blogger = Blogger.new(blogger_params)
    if @blogger.valid?
      @blogger.save
      redirect_to blogger_path(@blogger)
    else 
      flash[:errors] = @blogger.errors.full_messages
      redirect_to new_blog_path
    end
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end
end
