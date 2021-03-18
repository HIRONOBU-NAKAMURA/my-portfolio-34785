require 'test_helper'

class AllPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get all_posts_index_url
    assert_response :success
  end

end
