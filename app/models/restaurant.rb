class Restaurant < ApplicationRecord
    has_many :selections
    has_many :users, through: :selections 


    def self.create_restaurants
        client = SODA::Client.new({:domain => "data.cityofnewyork.us", :app_token => ENV["TOKEN"]})
    
        response = client.get("43nn-pn8j", {"$limit" => 200})

        response.body.each do |restaurant| 
            name = restaurant.dba
            borough = restaurant.boro
            violation = restaurant.violation_description 
            code = restaurant.violation_code 
            cuisine = restaurant.cuisine_description 
            score = restaurant.score 

            restaurant_hash = {name: name, borough: borough, violation: violation, code: code, cuisine: cuisine, score: score}
            self.create(restaurant_hash)
        end
    end

end
