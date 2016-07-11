require 'test_helper'

class TextPostsControllerTest < ActionController::TestCase
  test "get new with new post" do
    user1 = users(:user1)
    get :new, session: {user_id: user1.id}
    text_post = assigns(:text_post)
    assert text_post.new_record?
    assert_response :success
  end

  test "should create post" do
    user = users(:user1)
    params = {
        text_post: {
            title: "Test Title",
            body: "Test Body"
        }
    }
    post :create, params: params, session: {user_id: user.id}
    text_post = assigns(:text_post)
    assert text_post.persisted?
    assert_redirected_to post_url(text_post)
  end

  test "edit a post" do
    user1 = users(:user1)
    text_post = posts(:post1)
    get :edit, params: {id: text_post.id}, session: {user_id: user1.id}
    assert_response :success
  end

  test "should update post" do
    user = users(:user1)
    text_post = posts(:post1)
    params = {
        text_post: {
            title: "Test Title",
            body: "Test Body"
        },
        id: text_post.id
    }
    post :update, params: params, session: {user_id: user.id}
    text_post = assigns(:text_post)
    assert text_post.persisted?
    assert_redirected_to post_url(text_post)
  end

end
