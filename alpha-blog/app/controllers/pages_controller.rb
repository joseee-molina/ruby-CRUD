class PagesController < ApplicationController
    #empty functions work
    def home
        redirect_to articles_path if logged_in?
    end
    def about
    end
end
