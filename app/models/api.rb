class Api < ApplicationRecord
        

    def self.load_data
        load_posts
    end

    def self.load_posts
        url = "https://api.nasa.gov/planetary/apod?api_key=ZmxYRdhmQnPZJNnc1VE9hrkyljpVdRUJ59BKVyx4&count=30"
        response = Excon.get(url)
        data = JSON.parse(response.body)
        
        data.each do |post|
            Post.create(post)
        end
    end

end