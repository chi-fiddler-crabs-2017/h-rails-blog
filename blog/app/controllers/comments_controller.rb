class CommentsController < ApplicationController
	def create
		@article = Article.find(params[:id])
		@comment = @article.comments.create(params[:comment].permit(:name, :body))
		redirect_too article_path(@article)
	end
end
