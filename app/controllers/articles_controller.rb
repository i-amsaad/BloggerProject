class ArticlesController < ApplicationController
include ArticlesHelper
def index
  @articles = Article.all
end

def show
  @article=Article.find(params[:id])
  @comment = Comment.new
  @comment.article_id = @article.id
end
def new
  if logged_in?
  	@article=Article.new
  else
        flash.notice = "Please, Login to Create an Article!"
  	redirect_to login_path
  end
end
def create
  @article = Article.new(article_params)
  @article.save
  flash.notice = "Article '#{@article.title}' has been Created!"
  redirect_to article_path(@article)
end
def destroy
  a=Article.find(params[:id])
  flash.notice = "Article '#{a.title}' has been Destroyed!"
  a.destroy
  redirect_to articles_path
  
end

def edit
  @article = Article.find(params[:id])
end

def update
  @article = Article.find(params[:id])
  @article.update(article_params)
  flash.notice = "Article '#{@article.title}' has been Updated!"
  redirect_to article_path(@article)
end
end
