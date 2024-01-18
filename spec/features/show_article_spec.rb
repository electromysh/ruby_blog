require 'rails_helper'

RSpec.describe 'Show an article', type: :feature do
  before do
    @user = User.create!(email: 'example@example.com', password: '000000')
    visit root_path
    click_button "Sign in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
  end
  
  scenario 'correct content' do
    article = Article.create!(title: 'Old Title', body: 'Article text', status: 'public')
    visit article_path(id: article[:id])
    expect(page).to have_content('Old Title')
    expect(page).to have_content('Article text')

    expect(page).to have_link("Edit")
    expect(page).to have_link("Destroy")
    expect(page).to have_content('Comments')
    expect(page).to have_content('Add a comment:')
    expect(page).to have_field('Commenter')
    expect(page).to have_field('Body')
    expect(page).to have_button('Create Comment')
  end
end