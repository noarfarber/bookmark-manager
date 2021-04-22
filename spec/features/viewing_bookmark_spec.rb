require 'pg'

feature 'Viewing bookmarks' do
  scenario 'visiting the index webpage' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end

  scenario 'The user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test', user: 'postgres', password: 'postgres')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")
    
    visit '/bookmarks'
    
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
  end
end
