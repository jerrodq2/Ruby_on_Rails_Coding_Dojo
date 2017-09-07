class SurveysController < ApplicationController
  def index
  end

  def middle
    if session[:count] == nil
      session[:count] = 1
    else
      session[:count] += 1
    end
    session[:info] = params[:info]
    flash[:success] = "Thanks for Submitting this Form! You have done so #{session[:count]} time(s) now"
    redirect_to '/result'
  end

  def result
  end

end
