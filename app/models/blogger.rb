class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def self.average_blogger_age
        self.all.map(&:age).sum/self.all.length
    end

    def total_likes
        likes_sum = 0
        self.posts.each do |post|
            likes_sum += post.likes
        end
        likes_sum
    end

    def blogger_featured_post
        self.posts.sort_by{|post| post.likes}.reverse.first
    end    

end
