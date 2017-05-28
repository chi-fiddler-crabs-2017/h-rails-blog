class ArticlesController < ApplicationController
	def new

	end
	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to @article
		else
		@errors = @article.errors.full_messages
		render "articles/new"
		end
	end
	def show 
		@article = Article.find(params[:id])
	end

	private 
	def article_params
	params.require(:article).permit(:title, :text)
	end
end
