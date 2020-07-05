class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def average_writer_age(destination_name)
        posts = Post.all.select{ |post| post.destination.name == destination_name }
        authors = posts.map(&:author).unique
        ages = authors.map(&:age)

    end

    def destination_featured_post
        self.posts.sort_by{|post| post.rating}.reverse.first
    end  

    def five_recent
        self.posts(-5..-1)
    end
end
