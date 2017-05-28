class ArticlesController < ApplicationController
	def new

	end
	def create
		@article = Article.new(article_params)
		if @article.save
			render "welcome/index"
		else
		@errors = @article.errors.full_messages
		render "articles/new"
		end
	end

	private 
	def article_params
	params.require(:article).permit(:title, :text)
	end
end
