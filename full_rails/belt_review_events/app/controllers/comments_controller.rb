class CommentsController < ApplicationController
  def create
    comment = User.find(session[:id]).comments.create(comment_params.merge({event: Event.find(comment_params[:event]) }))
    if !comment.valid?
      flash[:errors] = comment.errors.full_messages
    end
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :event)
  end
end
