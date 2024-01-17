require 'rails_helper'

RSpec.describe 'Updating an article', type: :feature do
  scenario 'valid inputs' do
    articles = [
      Article.create!(title: 'Brasil', body: 'Article text', status: 'public'),
      Article.create!(title: 'Norway', body: 'Article text', status: 'public'),
      Article.create!(title: 'Hetherlands', body: 'Article text', status: 'public')
  ]
    visit root_path
    expect(page).to have_content('Brasil') # expect(page).to have_content(articles[0][:title])
    expect(page).to have_content('Norway') # expect(page).to have_content(articles[1][:title])
    expect(page).to have_content('Hetherlands') # expect(page).to have_content(articles[0][:title])
  end
end