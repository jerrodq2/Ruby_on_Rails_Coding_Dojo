require 'rails_helper'

# Next, go to the user_controller_spec file

# Below I run a "before do" block of code. As it sounds, before any of the other "it 'should' do " blocks are run, it runs the before do first. this only applies to blocks of code within it's scope. For example, below, the before do is run before the describe block. Therefore, it affects the describe and everything within it. If it was within the describe block of code, then anything outside of the describe would be unaffected by the "before do" code

#I also use a "describe 'something' do " block of code below. Think in terms of scope. For example, the RSpec.describe could be thought of as a method in the sense that anything that happens within it, doesn't affect any code outside of it. A regular "describe do" is the same way, it contains a group of code. So, if I run a before do block inside the describe do, it would only affect the code within the describe do, or within it's scope. any code after the "end" of the describe do wouldn't be affected.

RSpec.describe SessionsController, type: :controller do

  describe "sessions id and first_name" do
    before do
      @user = create_user
      post :create, email:@user.email, password:@user.password
    end
    # In the "before do" block above, I hit one of the methods in the sessions_controller. Basically, you act like the routes.rb file. So it goes like this: "action(post,get, etc.) :controller_method, params". So in the above code, I tell it to post to the create method, and pass it the params email and password, which looks like: {"email"=>"ds@yahoo.com", "password"=>"password", "controller"=>"sessions", "action"=>"create"}. Since we are in the spec file for the sessions controller, it will look in that controller for these methods

    it "should be created upon login" do
      expect(session[:id]).to eq(@user.id)
      expect(session[:name]).to eq(@user.first_name)
    end


    it "should be destroyed upon logout" do
      delete :destroy, id: 1
      # and example of hitting the destroy method, with a delete action and param id of 1
      expect(session[:id]).to eq(nil)
      expect(session[:name]).to eq(nil)
    end

  end
end
