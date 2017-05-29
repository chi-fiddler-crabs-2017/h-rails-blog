class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new' # redirect does complete refresh (so loss of content in form occurs), render keeps content in place if error occurs
    end
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
