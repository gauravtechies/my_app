class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    def index
        @articles=Article.all
    end
    
    def new 
        @article=Article.new
    end
    
    def create 
       # render plain: params[:article].inspect
       debugger
        @article=Article.new(article_params)
        @article.user = User.first
        if @article.save
            flash[:success] = "Article Successfully created..."
            redirect_to article_path(@article)
        else 
            render 'new'
        end
    end 
    def edit 
    end

    def update
        if @article.update(article_params)
            flash[:success]="Articles updated....."
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    
    def show 
    end
    
    def destroy
        # render plain: params[:article].inspect
        @article.destroy
        flash[:danger] = "Article Destroyed ....."
        redirect_to articles_path
    end
    
    private
    def set_article
        @article=Article.find(params[:id]) 
    end
    def article_params
        params.require(:article).permit(:title,:description)
    end
end