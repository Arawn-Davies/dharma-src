class LiteraturesController < ApplicationController
  allow_unauthenticated_access only: %i[index show]

  def index
    @literatures = Literature.ordered
  end

  def show
    @literature = Literature.find_by!(slug: params[:slug])
    @comments = @literature.comments.includes(:user).order(created_at: :asc)
    @comment = Comment.new
  end
end
