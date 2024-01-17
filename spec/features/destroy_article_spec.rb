require 'rails_helper'

RSpec.describe 'Updating an article', type: :feature do
  scenario 'successful deleted' do
    article = Article.create!(title: 'Title', body: 'Article text', status: 'public')
    visit article_path(article[:id])

    click_on 'Destroy'
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_current_path(root_path)
    expect(page).to have_no_content('Title')
  end

  scenario 'not deleted' do
    article = Article.create!(title: 'Title', body: 'Article text', status: 'public')
    visit article_path(article[:id])

    click_on 'Destroy'
    page.driver.browser.switch_to.alert.dismiss
    expect(page).to have_current_path(article_path(id: article[:id]))
    visit articles_path
    expect(page).to have_no_content(article)
  end
end