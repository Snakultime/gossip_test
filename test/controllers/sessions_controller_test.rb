require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
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

    test "valid signup information" do
      get signup_path
      assert_difference 'User.count' do
        post users_path, params: { user: {
          first_name:  "firstUser",
          last_name:  "lastUser",
          email: "kkchose@valid.youknow",
          password:              "password",
          password_confirmation: "password" } }
      end
      assert_template 'users/show'
    end

end
