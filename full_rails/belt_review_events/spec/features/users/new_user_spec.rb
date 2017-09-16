require 'rails_helper'

# See create_user_spec after this. This file basically makes sure that the new user page, or what takes it's place in this project, has the correct stuff (fields) on the view

# The files in the features folder I created myself, and basically take place of the view files that would have been created if I created the views with the controller. Notice that below, even though this isn't a spec file for a model, controller or view, I sitll need "RSpec. describe", this is necessary in all spec files, but it looks just like a "describe 'something' do" block of code, just add "RSpec." before the describe

RSpec.describe 'new user page' do
  before do
    State.create(state: 'TX')
    State.create(state: 'AL')
    # The datbase is empty when each test starts, so for the select input on this page to have any values, I have to input them into the state model first
    visit new_session_path
    # this is how you tell rspec to visit or go to a route. Notice, how I send it to the new_session_path and not new_user_path, that's because I dont' have a new method or view for the user's controller
  end
  it "should have the proper field" do
    expect(page).to have_field("First name")
    expect(page).to have_field('Last name')
    expect(page).to have_field('Email') # this expect finds the email field in the form helepr
    expect(page).to have_field('email') # this expect finds the email field in the login in form, which is html and not a form helper. I just put it here to show the difference between how have_field see's form helper inputs and how I usually put my own html inputs
    expect(page).to have_select('State', options: ['TX', 'AL']) #For this test, my view pulls everything from the State model and puts them as options/values in this select input. So I had to create two records in the state model in the before do block, so that I could test it properly.
    expect(page).to have_field('City') # Form helpers can be tricky, I originally had the label for this field as location, but the have_field couldn't find that or city, either uppercase or lowercase
    expect(page).to have_field('Password')
    expect(page).to have_field('Password confirmation')
    expect(page).to have_button('Create User')
    # These expects try to find the field with those names, and the button. The view this test is for is using a form helper for the create new user form. The form helper automatically puts every field name as capitalized. However, if I write out the form myself with html, then the "expect(page).to have_field('') " looks for the names of each field. So the second email above actually see's the email input for the logging in form
    # IMPORTANT Note: The expect have_field combination above seems to see or look for the name in an html input, and the label in the form helper. for example, it didn't find 'State', until I added a label in the form helper
  end

end
