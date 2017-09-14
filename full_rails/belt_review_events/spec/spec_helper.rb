RSpec.configure do |config|
# I've taken all of the default comments out of the files in the spec folder, what's left should just be my comments
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups


  # The above code comes with spec_helper.rb by default, the code below is what I added



  def create_user (first_name='david', last_name='samson', email='ds@yahoo.com', password='password', password_confirmation='password')
    User.create(first_name: first_name, last_name: last_name, email: email, password: password, password_confirmation: password_confirmation)
  end

  def log_in(user, password='password', email='email')
    visit new_session_path
    if email == 'email'
      fill_in 'email', with: user.email
    else
      fill_in 'email', with: email
    end
    fill_in 'password', with: password
    click_button 'Log In'
  end



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
