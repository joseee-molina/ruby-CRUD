class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    #it can find an article automatically for those methods, so that they
    #do not have to find it again

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
        #finding article by id in the url
        #params is the url decomposed or sth
    end

    def create
        #render plain: params[:article]
        #this render is going to show the params
        #in a blank page
        @newArticle = Article.new(article_params)
        #article_params is a function returning the params
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
        if @articleToEdit.update(article_params)
                #filling edited article with the fields of new

            flash[:notice] = "Article was edited succesfully!!"
            redirect_to article_path(@articleToEdit)
        else
            render 'edit'
            #this is calling new again
        end
    end

    
    def destroy
        @articleToDelete = Article.find(params[:id])
        @articleToDelete.destroy
        redirect_to articles_path

    end

    private 
    def set_article
        @someArticle = Article.find(params[:id])
    end
    #esto es para refactorizar un articulo
    def article_params
        params.require(:article).permit(:title, :description)
    end
    #remember that in ruby the last thing in a function is tha thing
    #that gets returned, which is super important, because here the type
    #doesn't matter too much

end