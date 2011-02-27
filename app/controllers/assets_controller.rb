class AssetsController < ApplicationController

  def destroy
    if Asset.delete(params[:id])
      render_class = "hide"
      render_msg = "File deleted"
    else
      render_class = ""
      render_msg = "File not deleted"
    end
    
    render :json => {:klass => render_class, :msg => render_msg}
  end

end
