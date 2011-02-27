class CommentsController < ApplicationController
  def destroy
    if Comment.delete(params[:id])
      render_class = "hide"
      render_msg = "Comment deleted"
    else
      render_class = ""
      render_msg = "Comment not deleted"
    end
    
    render :json => {:klass => render_class, :msg => render_msg}
  end

end
