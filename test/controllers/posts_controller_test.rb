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

  test 'create post' do
    post_params = {
      post: {
        name: 'Aliquam augue quam',
        description: 'Vestibulum quam sapien, varius ut, interdum in, ante.'
      }
    }

    post '/api/posts', params: post_params

    post_response = json(response.body)

    assert_equal 200, response.status
    assert_equal post_params[:post][:name], post_response[:name]
    assert_equal post_params[:post][:description], post_response[:description]
    assert_equal Mime[:json], response.content_type
  end

  test 'create post with invalid name' do
    post_params = {
      post: {
        name: '',
        description: 'Vestibulum quam sapien, varius ut, interdum in, ante.'
      }
    }

    post '/api/posts', params: post_params

    assert_equal 422, response.status
    assert_equal Mime[:json], response.content_type
  end
end
