require "test_helper"

class TodoTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "le todo doit être créé s'il a des attributs valides" do
		todo_env = todos(:env)
		assert todo_env.valid?
	end
end
