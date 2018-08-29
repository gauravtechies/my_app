class WelcomeController < ApplicationController 
    def home
        # redirect_to "youtube.com" if logged_in?
        redirect_to "https://youtube.com"
    end
    
    def about
    end
end