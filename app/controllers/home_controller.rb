class HomeController < ApplicationController
  def index
    if params[:search].present?
      redirect_to questions_path(:search => params[:search], :commit => "search")
    end
  end

  def about
    if params[:search].present?
      redirect_to questions_path(:search => params[:search], :commit => "search")
    end
  end

  def team
    if params[:search].present?
      redirect_to questions_path(:search => params[:search], :commit => "search")
    end
  end
  
end
