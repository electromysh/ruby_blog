require "rails_helper"
require 'rspec/expectations'
require "spec_helper"
require 'devise'

RSpec.describe "Articles", type: :request do
  before(:each) do
    # @user = User.create!(email: "example@example.com", password: "000000") # current_user
    # # patch article_path(@article), params: new_article_params
    # user_params  = { user: {
    #   email: "example@example.com",
    #   password: "000000",
    #   remember_me: "0"
    # }}

    # post 'localhost:3000/articles/sign_up'(@user), params: user_params
    # sign_in(:user, @user)  

    @articles =  [
      Article.create(title: "First article", body: "This is the first article", status: "public"), 
      Article.create(title: "Second article", body: "This is the second article", status: "public"),
      Article.create(title: "Third article", body: "This is the third article", status: "public")
    ]
    @article = @articles.first
  end

  describe "GET articles#index" do
    it "should be successful" do
      get root_path

      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end

  describe "GET articles#show" do
    it "should be successful" do 
      get articles_path(@article.id)
      
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end

  describe "POST articles#create" do
    it "should create the article" do
      article_params = { article: {
        title: "Rick and Morty",
        body: "Lets get shifty!",
        status: "public"
      }}
      
      expect{
        post  articles_path, params: article_params     
      }.to change(Article,:count).by(1)
    end

    it "should create the article with correct attributes" do
      article_params  = { article: {
        title: "Rick and Morty",
        body: "Lets get shifty!",
        status: "public"
      }}

      post  articles_path, params: article_params  
      expect(Article.last).to have_attributes article_params[:article]
    end

    it "should redirect to the new article" do
      article_params = { article: {
        title: "NEW NEW NEW",
        body: "This is new article!",
        status: "public"
      }}

      post '/articles/', params: article_params
      expect(response).to have_http_status(302)
      expect(response).to redirect_to Article.last
    end
  end

  describe "PATCH articles#update" do
    it "should redirect to updated article" do 
      new_article_params = { article: {
        title: "Rick and Morty",
        body: "Lets get shifty!",
        status: "public"
      }}

      patch article_path(@article), params: new_article_params
      expect(response).to have_http_status(302)
      expect(response).to redirect_to @article
    end

    it "should update the article with correct attributes" do
      new_article_params = { article: {
        title: "Rick and Morty",
        body: "Lets get shifty!",
        status: "public"
      }}
      
      patch article_path(@article), params: new_article_params
      expect(@article.reload).to have_attributes new_article_params[:article]
    end
  end

  describe "DELETE articles#destroy" do
    it "should redirect to articles list" do
      delete  article_path(@article)

      expect(response).to have_http_status(:see_other)
      expect(response).to redirect_to root_path
    end

    it "should delete the article" do
      expect{
        delete  article_path(@article)     
      }.to change(Article, :count).by(-1)
    end

    it "should delete correct article" do
      delete  article_path(@article)
      expect{
        get  article_path(@article[:id]) 
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end