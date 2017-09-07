class FirstControllersController < ApplicationController
  def index
    render plain: "hello"
  end
  def second
    render plain: 'Saying Hello'
  end
  def third
    render plain: 'Saying Hello Joe!'
  end
  def fourth
    redirect_to '/say/hello/joe'
  end
  def say
    render plain: 'What do you want me to say'
  end
  def sixth
    if session[:number] == nil
      session[:number] = 1
    else
      session[:number] += 1
    end
    render plain: "You've visited this url %s time(s)" %[session[:number]]
  end
  def seventh
    session[:number] = nil
    render plain: "session destroyed"
  end
end
