class SurveysController < ApplicationController
  def index
  end

  def middle
    puts "info here!!!!!!!!!!!"
    puts params[:info]
    # See index.html for more info, I sent the form data over as an associative array
    if session[:count] == nil
      session[:count] = 1
    else
      session[:count] += 1
    end
    session[:info] = params[:info]
    # Put the form data, or the paramter key info in this case into a session, so it can be be used in the next view
    flash[:success] = "Thanks for Submitting this Form! You have done so #{session[:count]} time(s) now"
    redirect_to '/result'
  end

  def result
    puts session[:info]
  end

end
