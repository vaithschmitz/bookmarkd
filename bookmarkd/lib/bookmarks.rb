require 'pg'

# end

class Bookmarks

  def self.all 
    begin
      con = PG.connect :dbname => 'bookmark_manager' # connect to db
      rs = con.exec "SELECT * FROM bookmarks" # run SQL input and assign to var
    end
  end
end

