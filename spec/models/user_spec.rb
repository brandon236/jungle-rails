require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should have matching password and password_confirmation fields' do
      user = User.new
      user.firstname = "Brandon"
      user.password = "password"
      user.password_confirmation = "password"
      user.save
      expect(user.password).to eq(user.password_confirmation)
    end
    it 'should not have the same email' do
      user = User.new
      user.email = "BrandonMacleod21@gmail.com"
      user.save
      user2 = User.new
      user2.email = "BrandonMacleod21@gmail.com"
      user2.save
      expect(user2).to be_nil
    end
    it 'should have a first name' do
      user = User.new
      user.firstname = "Brandon"
      user.lastname = "Macleod"
      user.save
      expect(user.firstname).to be_present
    end
  end
end
