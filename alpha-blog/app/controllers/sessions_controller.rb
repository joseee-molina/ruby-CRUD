class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            #rails provide a session object 
            session[:user_id] = user.id
            flash[:notice] = "logged in succesfully"
            redirect_to user
        else
            flash.now[:alert] = "there was something wrong with your login details"
            render 'new'
        end
    end

    def destroy
        #to logout we just have to set the session[userid] to nil
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path

    end


end
