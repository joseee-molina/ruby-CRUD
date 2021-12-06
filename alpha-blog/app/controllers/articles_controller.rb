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
      #the first time that we load the page, the new method gets called  
        @newArticle = Article.new
    end

    def edit
        @articleToEdit = Article.find(params[:id])
    end

    def create
        #render plain: params[:article]
        #this render is going to show the params
        #in a blank page
        @newArticle = Article.new(params.require(:article).permit(:title,:description))
        #filling new article with the fields of new
        if @newArticle.save
            flash[:notice] = "Article was created succesfully!!"
            redirect_to article_path(@newArticle)
        else
            render 'new'
            #this is calling new again
        end
    end

    def update
        @articleToEdit = Article.find(params[:id])
        if @articleToEdit.update(params.require(:article).permit(:title, :description))
                #filling edited article with the fields of new

            flash[:notice] = "Article was edited succesfully!!"
            redirect_to article_path(@articleToEdit)
        else
            render 'edit'
            #this is calling new again
        end
    end

end