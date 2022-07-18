require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do
    it "is valid with valid attributes" do
      user = User.create(first_name: "Manuel", last_name: "Casanova", email: "manucasanova@hotmail.com", password: "password", password_confirmation: "password")
      expect(user).to be_valid
      expect(user.errors.full_messages).to be_empty
    end

    it "is not valid when password and password_confirmation don't match" do
      user = User.create(first_name: "Manuel", last_name: "Casanova", email: "manucasanova@hotmail.com", password: "something", password_confirmation: "something else")
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include ("Password confirmation doesn't match Password")
    end

    it "is not valid when email isn't unique (case insensitive)" do
      user = User.create(first_name: "Manuel", last_name: "Casanova", email: "manucasanova@hotmail.com", password: "password", password_confirmation: "password")
      same_user = User.create(first_name: "Manuel", last_name: "Casanova", email: "MANUCASANOVA@hotmail.com", password: "password", password_confirmation: "password")

      expect(same_user).to_not be_valid
      expect(same_user.errors.full_messages).to include ("Email has already been taken")
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include ("Email can't be blank")
    end

    it "is not valid without first name" do
      user = User.create( 
        last_name: "Casanova", 
        email: "manucasanova@hotmail.com", 
        password: "password", 
        password_confirmation: "password"
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include ("First name can't be blank")
    end

    it "is not valid without last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include ("Last name can't be blank")
    end

    it "is not valid without pasword" do
      subject.password = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include ("Password can't be blank")
    end

    it "is not valid without pasword confirmation" do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include ("Password confirmation can't be blank")
    end

    it "is not valid when password is shorter than 7 characters" do
      subject.password = "12345"
      subject.password_confirmation = "12345"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include ("Password is too short (minimum is 7 characters)")
    end

    it "is valid when password is exactly 7 characters" do
      subject.password = "1234567"
      subject.password_confirmation = "1234567"
      expect(subject.errors.full_messages).to be_empty
    end

  end
end