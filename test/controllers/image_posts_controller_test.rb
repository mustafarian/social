require 'test_helper'

class ImagePostsControllerTest < ActionController::TestCase

  test "get new with new post" do
    user1 = users(:user1)
    get :new, session: {user_id: user1.id}
    image_post = assigns(:image_post)
    assert image_post.new_record?
    assert_response :success
  end

  test "should create post" do
    user = users(:user1)
    params = {
        image_post: {
            title: "Test Title",
            url: "http://i.imgur.com/Y7syDEa.jpg"
        }
    }
    post :create, params: params, session: {user_id: user.id}
    image_post = assigns(:image_post)
    assert image_post.persisted?
    assert_redirected_to post_url(image_post)
  end

  test "edit a image post" do
    user1 = users(:user1)
    image_post = posts(:post2)
    get :edit, params: {id: image_post.id}, session: {user_id: user1.id}
    assert_response :success
  end

  test "should update image post" do
    user = users(:user1)
    image_post = posts(:post2)
    params = {
        image_post: {
            title: "Test Title",
            url: "http://i.imgur.com/Y7syDEa.jpg"
        },
        id: image_post.id
    }
    post :update, params: params, session: {user_id: user.id}
    image_post = assigns(:image_post)
    assert image_post.persisted?
    assert_redirected_to post_url(image_post)
  end

end
