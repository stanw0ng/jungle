require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be created with password and password_confirmation fields' do
      @user = User.new(name:"Bobby Tree", email: "test@test.com", password: "password", password_confirmation: "password")
      expect(@user.valid?).to be true
    end

    it 'should not be created if password and password_confirmation fields do not match' do
      @user = User.new(name:"Bobby Tree", email: "test@test.com", password: "password", password_confirmation: "anoterpassword")
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should require password and password_confirmation fields' do
      @user = User.new(name:"Bobby Tree", email: "test@test.com")
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password digest can't be blank")
    end

    it 'should validate uniqueness of email (not case sensitive)' do
      @user1 = User.create(name:"Bobby Tree", email: "test@test.com", password: "password", password_confirmation: "password")
      @user2 = User.new(name:"Cindy Tree", email: "TEST@test.com", password: "password", password_confirmation: "password")
      expect(@user2.valid?).to be false
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should require email, name fields' do
      @user = User.new(password: "password", password_confirmation: "password")
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
  end
end
