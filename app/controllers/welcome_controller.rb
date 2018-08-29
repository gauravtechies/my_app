class WelcomeController < ApplicationController 
    def home
        redirect_to articles_path if logged_in?
    end
    
    def about
        redirect_to "https://youtube.com" 
    end
end