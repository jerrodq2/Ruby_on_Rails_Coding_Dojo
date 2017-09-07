class MainsController < ApplicationController
  def index
    session[:num] = rand(10..100) if !session[:num]
    puts session[:num]
  end
  def guess
    if params[:number].to_f == session[:num]
      flash[:success] = "You guessed right! the number is #{session[:num]}"
      session.clear
    elsif params[:number].to_f > session[:num]
      flash[:error] = 'Too High!'
    else
      flash[:error] = 'Too Low'
    end
    redirect_to '/'
  end
  def reset
    session[:num] = rand(10..100)
    redirect_to '/'
  end
end
