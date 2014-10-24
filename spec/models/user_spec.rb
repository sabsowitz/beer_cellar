require 'spec_helper'

describe User do

  before do
     @user = User.new(name: "Stephen", email: "sabsowitz@yahoo.com") 
   end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }

  # Name Validations
  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before {@user.email = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end

  # Email Validations

  describe "email" do
    context "not present" do
    before { @user.email = " " }
      it { should_not be_valid }
    end
  end

  context "too long" do
    before { @user.email = "a" * 201 }
    it { should_not be_valid }
  end

  describe "correct format" do
    it "is valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  describe "incorrect format " do
    it "is invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                  foo@bar_baz.com foo@bar+baz.com foo@bar..com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).to_not be_valid
      end
    end
  end

  describe "mixed case" do
    it "is saved as lowercase" do
      mixed_case_email = "fooBAR@exaMPlE.coM"
      @user.email = mixed_case_email
      @user.save
      expect(@user.reload.email).to eq mixed_case_email.downcase
    end
  end

  describe "when already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
  end

  it { should_not be_valid }

  User.destroy_all
end 