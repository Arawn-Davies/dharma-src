class CommentsController < ApplicationController
  def create
    @literature = Literature.find_by!(slug: params[:literature_slug])
    @comment = @literature.comments.build(comment_params.merge(user: Current.user))

    if @comment.save
      redirect_to literature_path(@literature), notice: "Your question or reflection was added."
    else
      @comments = @literature.comments.includes(:user).order(created_at: :asc)
      render "literatures/show", status: :unprocessable_content
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
