class Search
	def initialize(album_search)
		@album_search = album_search
	end

	def execute
		"Search results for #{@album_search.artist_name} - #{@album_search.album_name}"
	end
end
