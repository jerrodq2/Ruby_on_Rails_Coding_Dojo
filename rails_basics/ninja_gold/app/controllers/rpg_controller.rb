class RpgController < ApplicationController
  # rand(10..100)
  def index
    session[:gold] = 0 if !session[:gold]
    session[:activites] = [] if !session[:activites]
  end

  def farm
    num = rand(10..20)
    session[:gold] += num
    session[:activites].push("Earned #{num} golds from the farm!")
    redirect_to '/'
  end

  def cave
    num = rand(5..10)
    session[:gold] += num
    session[:activites].push("Earned #{num} golds from the cave!")
    redirect_to '/'
  end

  def house
    num = rand(2..5)
    session[:gold] += num
    session[:activites].push("Earned #{num} golds from the house!")
    redirect_to '/'
  end

  def casino
    change = rand(1..2)
    num = rand(0..50)
    if change == 1
      session[:gold] += num
      session[:activites].push("Earned #{num} golds from the casino! Great Job!")
    else
      session[:gold] -= num
      session[:activites].push("lost #{num} golds from the casino! Better luck next time!")
    end
    redirect_to '/'
  end

  def reset
    session.clear
    redirect_to '/'
  end

end
