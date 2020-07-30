require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should have matching password and password_confirmation fields' do
      user = User.new
      user.firstname = "Brandon"
      user.lastname = "Macleod"
      user.email = "BrandonMacleod8@gmail.com"
      user.password = "password"
      user.password_confirmation = "password"
      user.save!
      expect(user.password).to eq(user.password_confirmation)
    end
    it 'should not have the same email' do
      user = User.new
      user.firstname = "Brandon"
      user.lastname = "Macleod"
      user.email = "BrandonMacleod8@gmail.com"
      user.password = "password"
      user.password_confirmation = "password"
      user.save!
      expect(user).to be_present
      user2 = User.new
      user2.firstname = "Brandon"
      user2.lastname = "Macleod"
      user2.email = "BrandonMacleod8@gmail.com"
      user2.password = "password"
      user2.password_confirmation = "password"
      user2.valid?
      expect(user2).to_not be_valid
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end
    it 'should have a first name' do
      user = User.new
      user.firstname = "Brandon"
      user.lastname = "Macleod"
      user.email = "BrandonMacleod8@gmail.com"
      user.password = "password"
      user.password_confirmation = "password"
      user.save!
      expect(user.firstname).to be_present
    end
    it 'should have a last name' do
      user = User.new
      user.firstname = "Brandon"
      user.lastname = "Macleod"
      user.email = "BrandonMacleod8@gmail.com"
      user.password = "password"
      user.password_confirmation = "password"
      user.save!
      expect(user.lastname).to be_present
    end
    it 'should have an email' do
      user = User.new
      user.firstname = "Brandon"
      user.lastname = "Macleod"
      user.email = "BrandonMacleod8@gmail.com"
      user.password = "password"
      user.password_confirmation = "password"
      user.save!
      expect(user.email).to be_present
    end
    it 'should have a minimum password length' do
      user = User.new
      user.firstname = "Brandon"
      user.lastname = "Macleod"
      user.email = "BrandonMacleod8@gmail.com"
      user.password = "yes"
      user.password_confirmation = "yes"
      user.valid?
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should return a valid user' do
      user = User.new
      user.firstname = "Brandon"
      user.lastname = "Macleod"
      user.email = "BrandonMacleod8@gmail.com"
      user.password = "password"
      user.password_confirmation = "password"
      user.save!
      newUser = User.authenticate_with_credentials(user.email, user.password)
      expect(newUser).to_not be_nil
    end
    it 'should return a valid user if the email case is wrong' do
      user = User.new
      user.firstname = "Brandon"
      user.lastname = "Macleod"
      user.email = "BrandonMacleod8@gmail.com"
      user.password = "password"
      user.password_confirmation = "password"
      user.save!
      newUser = User.authenticate_with_credentials("brAndOnmAcLeoD8@gmail.com", user.password)
      expect(newUser).to_not be_nil
    end
    it 'should return a valid user if the email contains spaces' do
      user = User.new
      user.firstname = "Brandon"
      user.lastname = "Macleod"
      user.email = "BrandonMacleod8@gmail.com"
      user.password = "password"
      user.password_confirmation = "password"
      user.save!
      newUser = User.authenticate_with_credentials(" BrandonMacleod8@gmail.com ", user.password)
      expect(newUser).to_not be_nil
    end
    it 'should return a valid user if the email contains spaces and is in the wrong case' do
      user = User.new
      user.firstname = "Brandon"
      user.lastname = "Macleod"
      user.email = "BrandonMacleod8@gmail.com"
      user.password = "password"
      user.password_confirmation = "password"
      user.save!
      newUser = User.authenticate_with_credentials(" brAndOnmAcLEOd8@gmAil.com ", user.password)
      expect(newUser).to_not be_nil
    end
  end
end
