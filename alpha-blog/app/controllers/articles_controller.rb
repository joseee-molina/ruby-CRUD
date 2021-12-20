class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    #it can find an article automatically for those methods, so that they
    #do not have to find it again
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]



    def show
        #byebug #put this and use it to debug
        # for example, print params
        @articleToShow = Article.find(params[:id])

    end

    def index
        @allArticles = Article.paginate(page: params[:page], per_page: 5 )
        
    end
    
    def new
      #the first time that we load the page, the new method gets called  
        @newArticle = Article.new
    end

    def edit
        @article = Article.find(params[:id])
        #finding article by id in the url
        #params is the url decomposed or sth
    end

    def create
        #render plain: params[:article]
        #this render is going to show the params
        #in a blank page
        @newArticle = Article.new(article_params)
        @newArticle.user = current_user
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
        @article = Article.find(params[:id])
        if @article.update(article_params)
                #filling edited article with the fields of new

            flash[:notice] = "Article was edited succesfully!!"
            redirect_to article_path(@article)
        else
            render 'edit'
            #this is calling new again
        end
    end

    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path

    end

    private 
    def set_article
        @article = Article.find(params[:id])
    end
    #esto es para refactorizar un articulo
    def article_params
        params.require(:article).permit(:title, :description)
    end
    #remember that in ruby the last thing in a function is tha thing
    #that gets returned, which is super important, because here the type
    #doesn't matter too much

    def require_same_user
        if current_user != @article.user
            flash[:alert] = "You can only edit or delete your own article"
            redirect_to @article
        end
        
    end

end