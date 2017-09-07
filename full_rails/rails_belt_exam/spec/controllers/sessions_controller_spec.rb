require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before do
    @user = create_user
  end
  describe "sessions id and first_name" do
    before do
      post :create, email:@user.email, password:@user.password
    end
    it "should be created upon login" do
      expect(session[:id]).to eq(@user.id)
      expect(session[:name]).to eq(@user.first_name)
    end
    it "should be destroyed upon logout" do
      delete :destroy, id: 1
      expect(session[:id]).to eq(nil)
      expect(session[:name]).to eq(nil)
    end

  end
end
