class CategoriesController < ApplicationController
    
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
    
end