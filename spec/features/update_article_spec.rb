require 'rails_helper'

RSpec.describe 'Updating an article', type: :feature do
  scenario 'correct fields' do
    article = Article.create!(title: 'Old Title', body: 'Article text', status: 'public')
    visit edit_article_path(id: article[:id])

    fill_in 'Title', with: 'New York City'
    click_on 'Update Article'
    expect(page).to have_current_path(article_path(article))

    visit articles_path
    expect(page).to have_content('New York City')

    visit edit_article_path(id: article[:id])
    fill_in 'Title', with: 'New Title'
    fill_in 'Body', with: 'Text about New York City'
    click_on 'Update Article'
    visit articles_path
    expect(page).to have_content('New Title')
    visit article_path(article[:id])
    expect(page).to have_content('New Title')
    expect(page).to have_content('Text about New York City')


    # not edited article
    visit edit_article_path(id: article[:id])
    expect(page).to have_field('Title', with: 'New Title')
    expect(page).to have_field('Body', with: 'Text about New York City')
    expect(page).to have_select('Status', selected: 'public')

    # archived articles should not be seeing
    article = Article.create!(title: 'Old Title', body: 'Article text', status: 'archived')
    visit articles_path
    expect(page).to have_no_content('Old Title')
    expect(page).to have_no_content(article)
  end

  scenario 'not valid inputs' do
    article = Article.create!(title: 'Old Title', body: 'Article text', status: 'public')

    visit edit_article_path(id: article[:id])
    fill_in 'Title', with: ''
    fill_in 'Body', with: ''
    click_on 'Update Article'
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end