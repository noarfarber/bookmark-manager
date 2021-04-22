require 'pg'

class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test', user: 'postgres', password: 'postgres')
    else
      connection = PG.connect(dbname: 'bookmark_manager', user: 'postgres', password: 'postgres')
    end

    result = connection.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| bookmark['url'] }
  end
end
