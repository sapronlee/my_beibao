class HomeController < ApplicationController
  
  before_filter :load_areas
  
  def index
    @focus_topics = Topic.limit(5)
    @recommend_company = Company.limit(1).order("id desc")
  end
  
end