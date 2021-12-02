require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "un user a des champs obligatoires" do
		user = User.new

		assert user.invalid?
    # puts user.errors.full_messages
    assert_equal ["can't be blank", "is too short (minimum is 4 characters)"], user.errors[:username]
	end

	test "le user doit être créé s'il a des attributs valides" do
		user_regis = users(:regis)
		assert user_regis.valid?
	end
end
