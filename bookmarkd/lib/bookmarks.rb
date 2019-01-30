require 'pg'


class Bookmarks
  attr_accessor :con, :rs

  def self.connect 
    if ENV["RACK_ENV"] == "development"
      @@con = PG.connect :dbname => 'bookmark_manager' # connect to db
    else @@con = PG.connect :dbname => 'bookmark_manager_test'
    end
  end

  def self.fetch_all
    self.connect
      @rs = @@con.exec ("SELECT url FROM bookmarks") # run SQL input and assign to var
      @rs.map { |bookmark| bookmark['url'] }
  end

  def self.add_link(link)
    self.connect
    @@con.exec ("INSERT INTO bookmarks (url) VALUES ('#{link}')")
  end
end
