class PropertiesController < ApplicationController

  respond_to :html, :json

  def index
    @properties = Property.page params[:page]
    respond_to do |format|
      format.html
      format.json do
        respond_with models:        @properties,
                     current_page:  @properties.current_page,
                     num_pages:     @properties.num_pages,
                     per_page:      @properties.limit_value
      end
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

  def create
    @property = Property.create params[:property]
    respond_to do |format|
      format.html { redirect_to property_path(@property) }
      format.json { respond_with @property }
    end
  end

end
