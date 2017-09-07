require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  before do
    @user = create_user
    @secret = @user.secrets.create(content: "secret")
    @like = Like.create(user: @user, secret: @secret)
  end
  describe 'When not logged in' do
    before do
      session[:id] = nil
    end

    it "can't like a secret" do
      post :create
      expect(response).to redirect_to('/sessions/new')
    end
    it "cannot access destroy" do
      delete :destroy, id: @like
      expect(response).to redirect_to('/sessions/new')
    end

  end

  describe 'when logged in as the wrong user' do
    before do
      @wrong_user = create_user 'julius', 'julius@lakers.com'
      session[:id] = @wrong_user.id
      secret = @user.secrets.create(content: 'Ooops')
    end
    it "can't create" do
      post :create, u_id: @user
      expect(response).to redirect_to("/users/#{@wrong_user.id}")
    end
    it "can't destroy" do
      delete :destroy, id: @secret, u_id: @user
      expect(response).to redirect_to("/users/#{@wrong_user.id}")
    end
  end



end
