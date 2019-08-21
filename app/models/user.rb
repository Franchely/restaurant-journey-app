class User < ApplicationRecord
    has_many :selections
    has_many :restaurants, through: :selections
    
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
end
