require 'spec_helper'

describe User do

  before do
    User.destroy_all
    @user = User.new(name: "Example user", email: "example@user.com",
                      password: "foobar", password_confirmation: "foobar") 
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:admin) }

  it { should be_valid }
  it { should_not be_admin }

  # Admin Validations
  describe "with admin attributes set to true" do
    before do
      @user.save!
      @user.toggle!(:admin)
    end

    it { should be_admin }
  end


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
      User.destroy_all
      mixed_case_email = "fooBAR@exaMPlE.coM"
      @user.email = mixed_case_email
      @user.save
      expect(@user.reload.email).to eq mixed_case_email.downcase
    end
  end

  describe "when already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
      it { should_not be_valid }
      User.destroy_all
    end
  end

  # Password Validations
  describe "when password is not present" do
    before do
      @user = User.new(name: "Example user", email: "user@example.com",
                       password: " ", password_confirmation: " ")
    end
    it { should_not be_valid}
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "a password that is too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_falsey }
    end
  end

  describe "remember token" do
    before { @user.save }
    it(:remember_token) { should_not be_blank }
  end
end 