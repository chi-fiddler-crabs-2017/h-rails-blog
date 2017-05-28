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

	def edit
		@article = Article.find(params[:id])
	end
	def update
		@article = Article.find(params[:id])
		if @article.update(params[:article].permit(:title, :text))
			redirect_to @article
		else
			render 'edit'
		end
	end

	private 
	def article_params
	params.require(:article).permit(:title, :text)
	end
end
