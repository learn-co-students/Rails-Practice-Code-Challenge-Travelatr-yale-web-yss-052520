class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def five_most_recent_posts
        self.posts.sort_by(&:id)[0..4]
    end

    def most_liked_post
        self.posts.max_by(&:likes)
    end

    def average_age 
        self.bloggers.empty? ? 0 : self.bloggers.average(:age)
    end
end
