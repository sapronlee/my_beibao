class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  def load_areas
    @areas = Area.sort  
  end
  
end
