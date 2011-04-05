require 'rubygems'
require 'sqlite3'
require 'net/http'

require 'xml_doc'

begin
  database = SQLite3::Database.new( "rss.db" )
  database.execute("CREATE TABLE IF NOT EXISTS channel (id INTEGER PRIMARY KEY, title TEXT, link TEXT, description TEXT);")
  database.execute("CREATE TABLE IF NOT EXISTS post (id INTEGER PRIMARY KEY, channel_ID INTEGER,  title TEXT, link TEXT,description TEXT , author TEXT, category TEXT, comments TEXT, enclosure, TEXT, guid TEXT, pupDate DATETIME, source TEXT ); ")

  database.execute("DELETE FROM channel")

  database.execute("INSERT INTO channel (link) VALUES('http://rss.cbc.ca/lineup/topstories.xml');")
  database.execute("INSERT INTO channel (link) VALUES('http://rss.cbc.ca/lineup/world.xml');")
rescue Exception=>ex
  puts ex
  exit(-1)
end
begin

  database.execute("SELECT id, link FROM channel") do |site|
    puts site[1]
    xml_data = Net::HTTP.get_response(URI.parse(site[1])).body

    xml = XML_Parser.Parse(xml_data)
  end

rescue Exception=>ex
  puts ex
end