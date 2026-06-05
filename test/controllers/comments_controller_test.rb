require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @literature = literatures(:one)
    @user = users(:one)
  end

  test "requires authentication" do
    post literature_comments_url(@literature), params: { comment: { body: "How should I work with sleepiness?" } }

    assert_redirected_to new_session_url
  end

  test "signed in user can comment" do
    sign_in_as @user

    assert_difference -> { @literature.comments.count }, 1 do
      post literature_comments_url(@literature), params: { comment: { body: "How should I work with sleepiness?" } }
    end

    assert_redirected_to literature_url(@literature)
  end
end
