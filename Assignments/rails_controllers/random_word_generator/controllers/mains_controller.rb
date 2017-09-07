class MainsController < ApplicationController
  def index
    session[:rcount] = 0 if !session[:rcount]
  end
  def generate
    session[:rcount] += 1 if session[:rcount]
    session[:str] = (1..14).map{rand(65..90).chr}.join
    redirect_to '/'
  end
end
