class User < ApplicationRecord
    before_save { self.email = email.downcase }
    #self is refering to each object of the user class
    #this is to change the state of the email before saving it
    #so that it is downcase

    has_many :articles
    
    validates :username, uniqueness: true, 
                        presence: true, 
                        length: {minimum: 3, maximum: 25}

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email, uniqueness: {case_sensitive: false}, 
                        presence: true, 
                        length: {minimum: 3, maximum: 105},
                        format: { with: VALID_EMAIL_REGEX }


end