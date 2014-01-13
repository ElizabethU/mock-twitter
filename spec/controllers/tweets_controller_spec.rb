require 'spec_helper'

describe TweetsController do
  let!(:tweet) { Tweet.create(user: "joetwitter", message: "Wow! Fake twitter is so great!")} 

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end
end

describe "POST 'create'" do
  
  it "redirects to a show template" do 
    post :create, tweet: {user: "joetwitter", message: "Wow! Fake twitter is so great!"}
    expect(response).to redirect_to tweet_show_path(assigns(:tweet).id)
  end

  it "assigns @tweet to a valid Tweet" do 
    post :create, tweet: {user: "joetwitter", message: "Wow! Fake twitter is so great!"}
    expect(assigns(:tweet)).to be_valid
  end
  
  context "when invalid" do
    
    it "renders the :new template" do
      post :create, tweet: {author: "Stephanie Meyer"}
      expect(response).to render_template :new
    end
  end
end