feature 'Viewing bookmark list' do
  scenario 'visiting the webpage' do
    visit ('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end