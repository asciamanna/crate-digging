require 'sinatra'
require './album_search'
require 'dm-core'

get '/' do
	@album_searches = AlbumSearch.all(:order => [:id.desc])
	@title = 'All Album Searches'
	erb :home
end

delete '/:id' do
	s = AlbumSearch.get params[:id]
	s.destroy
	redirect '/'
end

post '/' do
 search =	AlbumSearch.new
 search.album_name = params[:album_name]
 search.artist_name = params[:artist_name]
 search.created_at = Time.now
 search.updated_at = Time.now
 search.save
 redirect '/'
end

get '/:id' do
	@search = AlbumSearch.get params[:id]
	@title = "Edit Search for #{@search.artist_name}" 
	erb :edit
end

put '/:id' do
	search = AlbumSearch.get params[:id]
	search.album_name = params[:album_name]
	search.artist_name = params[:artist_name]
	search.save
	redirect '/'
end

get '/:id/delete' do
	@search = AlbumSearch.get params[:id]
	@title = "Confirm deletion of note"
	erb :delete
end
