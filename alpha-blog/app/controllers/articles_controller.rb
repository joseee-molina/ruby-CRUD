class ArticlesController < ApplicationController

    def show
        #byebug put this and use it to debug
        @article = Article.find(params[:id])
    end

    def index
        @allArticles = Article.all
    end
    
    def new

    end

    def create
        render plain: params[:article]
    end

end