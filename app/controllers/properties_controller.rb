class PropertiesController < ApplicationController

  def index
    @properties = Property.page params[:page]
  end

end
