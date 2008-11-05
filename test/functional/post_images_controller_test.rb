require 'test_helper'

class PostImagesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:post_images)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_post_image
    assert_difference('PostImage.count') do
      post :create, :post_image => { }
    end

    assert_redirected_to post_image_path(assigns(:post_image))
  end

  def test_should_show_post_image
    get :show, :id => post_images(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => post_images(:one).id
    assert_response :success
  end

  def test_should_update_post_image
    put :update, :id => post_images(:one).id, :post_image => { }
    assert_redirected_to post_image_path(assigns(:post_image))
  end

  def test_should_destroy_post_image
    assert_difference('PostImage.count', -1) do
      delete :destroy, :id => post_images(:one).id
    end

    assert_redirected_to post_images_path
  end
end
