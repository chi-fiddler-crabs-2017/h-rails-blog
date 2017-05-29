class PostsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    @post.save

    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end
# Rails 4 secuirty feature called strong params, need to specify what params you want to allow under private method
  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
