require 'rails_helper'

RSpec.describe 'Creating an article', type: :feature do
  scenario 'valid inputs' do
    visit new_article_path
    fill_in 'Title', with: 'New Article Title'
    fill_in 'Body', with: 'New Article Body'
    click_on 'Create Article'
    visit articles_path
    expect(page).to have_content('New Article Title')
  end

  scenario 'invalid inputs' do
    visit new_article_path
    fill_in 'Title', with: ''
    fill_in 'Body', with: ''
    click_on 'Create Article'
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")

    visit new_article_path
    fill_in 'Title', with: ''
    fill_in 'Body', with: 'New Article Body'
    click_on 'Create Article'
    expect(page).to have_content("Title can't be blank")

    visit new_article_path
    fill_in 'Title', with: 'New Article Title'
    fill_in 'Body', with: ''
    click_on 'Create Article'
    expect(page).to have_content("Body can't be blank")
  end
end