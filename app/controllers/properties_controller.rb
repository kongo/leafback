class PropertiesController < ApplicationController

  respond_to :html, :json

  def index
    @properties = Property.page params[:page]
    respond_to do |format|
      format.html
      format.json { respond_with @properties }
    end
  end

  def show
    @property = Property.find params[:id]
    respond_to do |format|
      format.html
      format.json { respond_with @property }
    end
  end

  def update
    @property = Property.find params[:id]
    @property.update_attributes params[:property]
    respond_to do |format|
      format.html
      format.json { respond_with @property }
    end
  end

end
