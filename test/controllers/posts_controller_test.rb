require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'get list of posts' do
    get '/api/posts'

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type
  end
end
