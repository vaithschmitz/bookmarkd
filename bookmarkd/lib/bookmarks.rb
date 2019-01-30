require 'pg'

# end

class Bookmarks
  attr_accessor :con, :rs

  def self.all 
    fetch_bookmark
    @rs.map { |bookmark| bookmark['url'] } # maps over nested hash and returns url
  end

    def self.fetch_bookmark
    begin
      if ENV["RACK_ENV"] == "development"
        @con = PG.connect :dbname => 'bookmark_manager' # connect to db
      else @con = PG.connect :dbname => 'bookmark_manager_test'
      end
        @rs = @con.exec ("SELECT url FROM bookmarks") # run SQL input and assign to var
    end
  end
    
end



