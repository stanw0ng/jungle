require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'should be created with password and password_confirmation fields' do
      @user = User.new(first_name:"Bobby", last_name:"Tree", email: "test@test.com", password: "password", password_confirmation: "password")
      expect(@user.valid?).to be true
    end

    it 'should not be created if password and password_confirmation fields do not match' do
      @user = User.new(first_name:"Bobby", last_name:"Tree", email: "test@test.com", password: "password", password_confirmation: "anoterpassword")
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should require password and password_confirmation fields' do
      @user = User.new(first_name:"Bobby", last_name:"Tree", email: "test@test.com")
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password digest can't be blank")
    end

    it 'should validate uniqueness of email (not case sensitive)' do
      @user1 = User.create(first_name:"Bobby", last_name:"Tree", email: "test@test.com", password: "password", password_confirmation: "password")
      @user2 = User.new(first_name:"Cindy", last_name:"Leaf", email: "TEST@test.com", password: "password", password_confirmation: "password")
      expect(@user2.valid?).to be false
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should require email, name fields' do
      @user = User.new(password: "password", password_confirmation: "password")
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("First name can't be blank", "Last name can't be blank", "Email can't be blank")
    end

    it 'should have a password with minimum length of 6 characters' do
      @user = User.new(first_name:"Bobby", last_name:"Tree", email: "test@test.com", password: "pass", password_confirmation: "pass")
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      @user = User.create(first_name: "Bobby", last_name: "Tree", email: "example@domain.com", password: "password", password_confirmation: "password")
    end
    
    it 'should authenticate a user with valid credentials' do
      expect(User.authenticate_with_credentials("example@domain.com", "password")).to eq(@user)
    end
    
    it 'should authenticate a user with extra spaces in the email address' do
      expect(User.authenticate_with_credentials(" example@domain.com ", "password")).to eq(@user)
    end
    
    it 'should authenticate a user with different casing in the email address' do
      expect(User.authenticate_with_credentials("eXample@domain.COM", "password")).to eq(@user)
    end
    
    it 'should not authenticate a user with invalid credentials' do
      expect(User.authenticate_with_credentials("example@domain.com", "wrongpassword")).to be nil
    end
    
    it 'should not authenticate a user with a non-existent email' do
      expect(User.authenticate_with_credentials("nonexistent@example.com", "password")).to be nil
    end

  end

  
end
