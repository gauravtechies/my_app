class CategoriesController < ApplicationController
    before_action :access_by_admin, only: [:create, :new]
    def index
        @categories=Category.paginate(page: params[:page], per_page: 6)
    end
    
    def new
        @category=Category.new
    end

    def create
        @category=Category.new(posted_params)
        if @category.save
            flash[:success] = "Successfully created category"
            redirect_to categories_path(@article)
        else
            flash[:danger] = "Something went wrong"
            render 'new'
        end
    end
    
    def show
        @category=Category.find(params[:id]) 
    end
    private 
    def posted_params
        params.require(:category).permit(:name)
    end
    def access_by_admin
        if !logged_in? || (logged_in? && !current_user.admin?) 
            flash[:danger] = "Only admin have permission to create new article"
            redirect_to categories_path
        end
    end
    
end