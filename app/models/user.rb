class User < ActiveRecord::Base

    has_secure_password
    before_validation :downcase_email
    before_save :downcase_email

    def self.authenticate_with_credentials(email, password)
        modifiedEmail = email.strip
        user = User.find_by_email(modifiedEmail.downcase)
        if (user && user.authenticate(password))
          user
        else
          nil
        end
    end


    validates :email, :uniqueness => {:case_sensitive => false}

    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :email, presence: true
    validates :password, presence: true, :length => { :minimum => 5 }
    validates :password_confirmation, presence: true, :length => { :minimum => 5 }

    private
      def downcase_email
        self.email.downcase!
      end
end
