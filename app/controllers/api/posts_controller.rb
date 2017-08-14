module API
  class PostsController < ApplicationController
    def index
      posts = Post.all
      if filter = params[:filter]
        posts = posts.where('name ILIKE ? or description ILIKE ?', "%#{filter}%", "%#{filter}%")
      end
      render json: posts, status: 200
    end

    def create
      post = Post.new(post_params)

      if post.save
        render json: post, status: 200
      else
        render json: post.errors, status: 422
      end
    end

    private

      def post_params
        params.require(:post).permit(:name, :description)
      end
  end
end
