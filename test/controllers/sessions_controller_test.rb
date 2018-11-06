require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = User.create(last_name: 'foo1', first_name: 'foo1', email: 'foo@foo.foo', password: 'foo1', password_confirmation: 'foo1')
  end

  test "should get new" do
    get login_path
    assert_response :success
  end

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: {
        first_name:  "",
        last_name: "",
        email: "user@invalid",
        password:              "foo",
        password_confirmation: "bar" } }
      end
      assert_template 'users/new'
    end
end
