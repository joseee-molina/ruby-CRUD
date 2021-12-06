class ArticlesController < ApplicationController

    def show
        #byebug #put this and use it to debug
        # for example, print params
        @articleToShow = Article.find(params[:id])
    end

    def index
        @allArticles = Article.all
    end
    
    def new

    end

    def create
        #render plain: params[:article]
        #this render is going to show the params
        #in a blank page
        @newArticle = Article.new(params.require(:article).permit(:title,:description))
        @newArticle.save
        redirect_to article_path(@newArticle)
    end

end