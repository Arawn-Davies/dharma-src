require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "creates account and signs in" do
    assert_difference -> { User.count }, 1 do
      post registration_url, params: {
        user: {
          email_address: "new@example.com",
          password: "password123",
          password_confirmation: "password123"
        }
      }
    end

    assert_redirected_to root_url
    assert cookies["session_id"].present?
  end
end
