class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction ), message: "not a valid category" }
    validate :clickbait

    def clickbait
        return false if title == nil
        unless ["Won't Believe", "Secret", "Top [number]", "Guess"].any?{|el| title.match(el) }
          errors.add(title, "title is not clickbait-y")  
        end
    end
end
