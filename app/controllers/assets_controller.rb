class AssetsController < ApplicationController

  def destroy
    asset = Asset.find(params[:id])
    asset_deleted = false

    asset.transaction do 
      asset.attachings.clear
      asset.destroy
      asset_deleted = true
    end

    if asset_deleted
      render_class = "hide"
      render_msg = "File deleted"
    else
      render_class = ""
      render_msg = "File not deleted"
    end
    
    render :json => {:klass => render_class, :msg => render_msg}
  end

end
