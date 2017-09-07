class MainsController < ApplicationController
  def index
    session[:num] = rand(10..100) if !session[:num]
    # Example of a session the session was created here, but it doesn't have to be before the if statement, in ruby a single line if statement is formatted this way, with the if after block of code that occus if the statement passes.
    puts session[:num]
  end
  def guess
    # In the if statement below, we see an example of a paramter being used, params[:number] in this case. All data is sent over as an associative array, and from the form on the index page, we are passed the number field. So 'number' or it's value is sent over as a key in the params associative array, we access it using this format array[:key]

    # This is an example of what the params or paramters that are sent over look like, in this case, the number key is 23:
    # {"authenticity_token"=>"YjTNsTsktmm/rdcfWcaQQryPmPDbjW6cJslUef1Kz+M=", "number"=>"23", "controller"=>"mains", "action"=>"guess"}

    puts params #this is just so I can see the paramters sent over
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
