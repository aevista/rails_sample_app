require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

    def setup
        @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", 
                                            password_confirmation: "foobar")
    end

    test "should be valid" do
        assert @user.valid?
    end

    test "should not be valid" do
        @user.name = "    "
        assert_not @user.valid?
    end

     test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

    test "email string should not contain over 50 char" do
        @user.name = "z" * 51
        assert_not @user.valid?
    end

    test "name string should not contain over 50 char" do
        @user.email ="a" * 256
        assert_not @user.valid?
    end

    test "valid email address" do
        valid_emails = %w{bob@email.com  catwoman@gmail.com elija223@yahoo.com birdman@hype.com}
        valid_emails.each do |email|
             @user.email = email 
             assert @user.valid?
         end
    end

    test "invalid email addresses" do
        invalid_emails = %w{bob@email,com foo@email_com bar@baz_bar.com username@example}
        invalid_emails.each do |email|
            @user.email = email
            assert_not @user.valid?
        end
    end

    test "no duplicate emails" do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save
      assert_not duplicate_user.valid?
    end

    test "password should not be blank" do
      @user.password = @user.password_confirmation  = " " * 20
      assert_not @user.valid?
    end

    test "password should be at least 6 characters long" do
      @user.password = @user.password_confirmation = "a" * 5
      assert_not @user.valid?
    end
end
