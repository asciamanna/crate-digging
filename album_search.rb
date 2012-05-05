require 'dm-core'
require 'dm-migrations'
require 'dm-validations'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/cratedigging.db")

class AlbumSearch 
	include DataMapper::Resource
	property :id, Serial
	property :artist_name, Text, :required => true
	property :album_name, Text, :required => true
	property :created_at, DateTime
	property :updated_at, DateTime

	validates_presence_of :artist_name, :album_name
end

DataMapper.finalize.auto_upgrade!
