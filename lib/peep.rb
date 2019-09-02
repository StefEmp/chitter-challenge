require 'pg'
class Peep
	def self.all
		if ENV['ENVIRONMENT'] == 'test'
		  con = PG.connect :dbname => 'chitter_test'	
      rs = con.exec "SELECT * FROM peep
      ORDER BY id DESC;"
		else
			con = PG.connect :dbname => 'chitter'	
      rs = con.exec "SELECT * FROM peep
      ORDER BY id DESC;"
		end
		# @bookmarks = []
		# rs.each{ |row| @bookmarks.push row['url'] }
		# @bookmarks
		rs.map{ |row| row['post'] }
	end

  def self.create(post:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  connection.exec("INSERT INTO peep (post) VALUES('#{post}')")
  end
end