class ArticlesController < ApplicationController
    before_action :article_get, only: [:edit, :update, :show,:destroy]
    def index
        @articles=Article.all
    end
    
    def new 
        @article=Article.new
    end
    
    def create 
       # render plain: params[:article].inspect
        @article=Article.new(article_params)
        if @article.save
            flash[:notice] = "Article Successfully created..."
            redirect_to article_path(@article)
        else 
            render 'new'
        end
    end 
    def edit 
    end

    def update
        if @article.update(article_params)
            flash[:notice]="Articles updated....."
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    def destroy
        @article.destroy
        flash[:notice] = "Article Destroyed ....."
        redirect_to articles_path
    end
    def show 
    end
    private
    def article_get
        @article=Article.find(params[:id]) 
    end
    def article_params
        params.require(:article).permit(:title,:description)
    end
end