class ArticlesController < ApplicationController

    def show
        #byebug put this and use it to debug
        @article = Article.find(params[:id])
    end

end