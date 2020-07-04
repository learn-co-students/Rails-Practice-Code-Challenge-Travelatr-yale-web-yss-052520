class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: {minimum: 30}

    def total_likes
        self.posts.reduce(0){|total, post| total + post.likes}
    end

    def most_liked_post
        self.posts.max_by {|p| p.likes}
    end

    def top_five_destinations
        a = self.destinations.group(:name).count.sort_by{|k,v| 
            -v
        }.map{|v| 
            v[0]
            }[0..4]
    end
end
