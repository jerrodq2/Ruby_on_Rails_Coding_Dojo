# This file is for specs or specifications that don't depend on rails. This is the first file that is read in any test, all spec files require rails_helper, and that file requires this file. So, ideally keep this file light, if it's heavy, it will slow down every test.

# You can test all files with "rspec spec" or specific ones with "rspec file_path", ex: rspec spec/models/user_spec.rb

# Spec folder structure: rails_helper and spec_helper are created automatically with "rails g rspec:install". The folder controllers and models, and the files inside are created anytime you create them with "rails g model/controller ...", also, a view folder and files are created if you include them when creating a controller, for exampel: "rails g controller Users index", which would create the view "index.html.erb_spec.rb" inside the users folder inside the views folder.

# Also, I usually create a folder called "features", just what I like to do. You can see it in this project as an example, it takes place of the view files basically, that's where I usually put things that are outside of my controllers and models

# Not all of this project is finished for rspec, I just tested somethings out, and removed several files that didn't have rspec in them (other model and controller files for example. The files that you can look at as an example are: user_spec in models, see this file first. sessions_controller and users controller in controllers. And 4 files in the features folder: logging_in, logging_out, create_user, new_user.

RSpec.configure do |config|
# I've taken all of the default comments out of the files in the spec folder, what's left should just be my comments
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups



  # config.around(:each) do |example|
  #   ActiveRecord::Base.transaction do
  #     example.run
  #     raise ActiveRecord::Rollback
  #   end
  # end

  # The above code comes with spec_helper.rb by default, the code below is what I added



# the blow code is 3 methods,the first creates a state, the second creates a user, and the third one logs in a user. Putting them here means that I can access them anywhere in my spec files.

# IMPORTANT Note************** When testing with rspec, at the start of every test, unless specified with a "before do" block, all models are empty. Even if my actual applicaiton has all 50 states in the db, I had to create the first method below, create_state, so that I could even create a user, since you need to have a state_id to create a user
  def create_state
    State.create(state:'TX')
  end

  def create_user (first_name='david', last_name='samson', email='ds@yahoo.com', password='password', password_confirmation='password', city='Dallas', state=1)
    create_state
    User.create(first_name: first_name, last_name: last_name, email: email, password: password, password_confirmation: password_confirmation, city: city, state: State.first)
  end
  # this creates a user, I just put it here so I can have a basic example to work with. For example, in sessions_controller_spec.rb, at the top I have:
  # before do
  #   @user = create_user
  # end


  def log_in(user, password='password', email='email')
    visit new_session_path #tells rspec which link to go to, can also specify the link, ex: visit '/session/new'
    if email == 'email'
      fill_in 'email', with: user.email # this just checks if I didn't input the email paramter. If I did, then it wouldn't be 'email' since that wouldn't work as a valid email. If I did input an email paramter, it woudln't equal 'email'
    else
      fill_in 'email', with: email
    end
    fill_in 'password', with: password # I use 'password' both in the create_user method above and the file where I actually called this method, so I don't need an if statement for it
    click_button 'Log In'
  end
  # A method I use to log a user in, takes a user as a parameter though, and I give the other parameters default values, incase I don't input them when I call them



# I already had the code below in the file, but it doesn't apprear necessary and is almost exactly like the code at the beginning of the file


#
#   RSpec.configure do |config|
#   config.expect_with :rspec do |expectations|
#     expectations.include_chain_clauses_in_custom_matcher_descriptions = true
#   end
#   config.mock_with :rspec do |mocks|
#     mocks.verify_partial_doubles = true
#   end
# end


end
