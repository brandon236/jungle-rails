class User < ActiveRecord::Base

    has_secure_password

    validates :email, :uniqueness => {:case_sensitive => false}

    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :password_confirmation, presence: true
    
end
