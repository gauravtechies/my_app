class UsersController < ApplicationController
    before_action :find_user, only: [:edit, :update, :show, :destroy]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    before_action :require_admin, only: [:destroy]

    def index
        @user=User.paginate(page: params[:page], per_page: 4)
    end

    def new
        @user=User.new
    end

    def create
        @user=User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Welcome to Alpha blog #{@user.username}"
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def edit
       
    end
    
    def update
        if @user.update(user_params)
            flash[:success]="User edited successfully"
            redirect_to articles_path
        else
            render 'edit'
        end
    end

    def show 
        @user=User.find(params[:id]) 
        @user_show_paginate=@user.articles.paginate(page: params[:page], per_page: 2)
    end

    def destroy
        if current_user!=@user && current_user.admin?
            flash[:danger] = "Deleted successfully"
            @user.destroy
        end
      
        redirect_to users_path
    end
    
    private
    def find_user
        @user=User.find(params[:id])
    end
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
    def require_same_user
        
        if current_user != @user and !current_user.admin?
            flash[:danger]= "You are not allowed to edit this User"
            redirect_to root_path
        end
    end
    def require_admin
        if !logged_in? and !current_user.admin?
            flash[:danger]= "You are not allowed to perform this action"
            redirect_to root_path
        end 
    end
end
