class PropertiesController < ApplicationController

  respond_to :html, :json

  def index
    @properties = Property.page params[:page]
    respond_to do |format|
      format.html
      format.json { respond_with @properties }
    end
  end

end
