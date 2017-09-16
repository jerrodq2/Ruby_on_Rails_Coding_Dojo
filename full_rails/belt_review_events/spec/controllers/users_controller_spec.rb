require 'rails_helper'

# Next, go to the new_user_spec file in /spec/features/users a file and folder I created myself

RSpec.describe UsersController, type: :controller do

  describe 'creating user' do
    before do
      State.current_scope = nil
      create_state
      # I use the method from spec_helper to create a state, since the db is blank at the start of each test, I need a state to create a user
    end
    it "should create sessions upon successful registration" do
      post :create, user:{first_name: 'Tony', last_name: 'Stark', email: 'ironman@gmail.com', password: 'Password', password_confirmation: 'Password', state: 1, city: 'Dallas'}
      # As stated in the sessions_controller_spec, this is how I send a post request to the create method of this controller. It's important to remember that it goes through the code in that method just like it would if you hit the submit button from the view. So, I send the user paramater as a hash, and normally, I wouldn't reference a specific if for state, but in the controller, it merges the strong param like so: user_params.merge({state: State.find(user_params[:state])}), so it takes my state: 1 above and finds the actual instance
      user = User.first # only one user in the db since I just created one, db starts out blank in tests
      expect(session[:id]).to eq(user.id)
      expect(session[:name]).to eq(user.first_name)
    end
  end

end
