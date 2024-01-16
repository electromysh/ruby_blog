require "rails_helper"

RSpec.describe "Articles", type: :request do
  before(:each) do
    @articles =  [
      Article.create(title: "First article", body: "This is the first article", status: "public"), 
      Article.create(title: "Second article", body: "This is the second article", status: "public"),
      Article.create(title: "Third article", body: "This is the third article", status: "public")
    ]
    @article = @articles.first
  end

  # describe "GET index" do
  #   it "succeeds" do
  #     get root_path # get "/articles/"

  #     expect(response).to be_successful
  #     expect(response).to have_http_status(200)
  #   end
  # end

  # describe "GET show" do
  #   it "succeeds" do 
  #     get articles_path(@article.id) # get "/articles/#{@article.id}"
      
  #     expect(response).to be_successful
  #     expect(response).to have_http_status(200)
  #   end
  # end

  # describe "POST create" do
  #   it 'create article with valid attributes' do
  #     article_params = { article: {
  #       title: 'NEW NEW NEW',
  #       body: 'This is new article!',
  #       status: 'public'
  #     }}
  #     post '/articles/', params: article_params
  #     expect(response).to have_http_status(302)
  #   end

  #   # fill_in "article_title", with: "Ruby on Rails"
  #   # fill_in "article_body", with: "Text about Ruby on Rails"
  #   # fill_in "article_status", with: "public"
  #   # expect { click_button "Save" }.to change(Article, :count).by(1)
  # end

  # describe "PUT edit" do
  #   it "PUT edit" do
  #     new_article_params = { article: {
  #             title: 'Rick and Morty',
  #             body: 'Lets get shifty!',
  #             status: "public"
  #           }}
  #     patch article_path(@article), :params => new_article_params.to_json, :headers => { "Content-Type": "application/json" }

  #     expect(response).to have_http_status(302)

  #   end
  # end

  # describe 'PATCH update' do
  #   it 'should update the title' do
  #     article = Article.create(title: "First article", body: "This is the first article", status: "public")
  #     new_article_params = { article: {
  #       title: 'Rick and Morty',
  #       body: 'Lets get shifty!',
  #       status: "public"
  #     }}
  #     patch article_path(article), :params => new_article_params
  #     expect(response).to be_redirect
  #   end
  #   # expect(@article.reload.title).to eq("another one NEW title")
  #   # expect(response).to be_redirect
  # end

  # describe "DELETE destroy" do
  #   it "succeeds" do
  #     article = Article.create(title: "First article", body: "This is the first article", status: "public")
  #     delete  article_path(article)

  #     expect(response).to have_http_status(:see_other)
  #     expect(response).to be_redirect
  #   end
  # end
end