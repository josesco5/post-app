require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'get list of posts' do
    get '/api/posts'

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type
  end

  test 'get list of posts filtered by name' do
    got = posts(:got)
    hunger = posts(:hunger_games)

    get '/api/posts?filter=game'
    assert_equal 200, response.status

    received_posts = json(response.body)
    names = received_posts.collect { |p| p[:name] }
    assert_includes names, got.name
    assert_includes names, hunger.name
  end
end
