class CommentsController < ApplicationController
    before_action :set_article
    respond_to :html, :js
    def create
        unless current_user
            flash[:alert] = "Please signup first"
            redirect_to new_user_path
        else

            @comment= @article.comments.build(comment_params)
            @comment.user=current_user
            if @comment.save
                flash[:notice] = "Successfully created..."
            else
                flash[:alert] = "Something went wrong..."
            end
            redirect_to article_path(@article)
        end
    end

    private 
    def comment_params
        params.require(:comment).permit(:body)
    end

    def set_article
        @article=Article.find(params[:article_id])
    end
end
