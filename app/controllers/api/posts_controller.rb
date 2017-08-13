module API
  class PostsController < ApplicationController
    def index
      posts = Post.all
      if filter = params[:filter]
        posts = posts.where('name ILIKE ? or description ILIKE ?', "%#{filter}%", "%#{filter}%")
      end
      render json: posts, status: 200
    end
  end
end
