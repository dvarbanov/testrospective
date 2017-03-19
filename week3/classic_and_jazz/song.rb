class Song
  attr_accessor :name, :artist, :genre, :subgenre, :tags
  def initialize(name, artist, genre, subgenre, tags)
    @name = name
    @artist = artist
    @genre = genre
    @subgenre = subgenre
    @tags = tags
  end
end

class Collection
  attr_reader :songs_as_string, :artist_tags
  def initialize(songs_as_string, artist_tags)
    @songs_as_string = songs_as_string
    @artist_tags = artist_tags
  end

  def parse
    @new_arr = @songs_as_string.lines
    @new_arr.map! { |song| song.split('.').map { |x| x.strip }}
    @new_arr.map! do |name, artist, genres_all, tags_all|   #.map(&:strip)

      tags = []
      tags = tags_all.split(",").map { |x| x.strip } unless tags_all.nil?

      genre, subgenre = genres_all.split(",").map { |x| x.strip }
      tags.push(genre)
      subgenre = 'empty' if subgenre.nil?
      tags.push(subgenre) #unless subgenre.nil?

      @artist_tags[artist].each { |tag| tags.push(tag) } unless @artist_tags[artist].nil?

      tags.map! { |tag| tag.downcase }

      Song.new(name, artist, genre, subgenre, tags)
    end
    @new_arr
  end

  def find(criteria)
    parse
    result = []
    result = @new_arr.select { |song| song.name == criteria[:name] } if criteria[:name]
    result = @new_arr.select { |song| song.artist == criteria[:artist] } if criteria[:artist]
    result = @new_arr.select { |song| song.genre == criteria[:genre] } if criteria[:genre]

    result = @new_arr.select { |song| song.tags.include?(criteria[:tags]) } if criteria[:tags].is_a?(String)

    if criteria[:tags].is_a?(Array)
      tags = [criteria[:tags]].flatten
      exclude_tags = tags.select {|tag| tag.end_with? '!'}
      include_tags = tags - exclude_tags
      exclude_tags.map! {|tag| tag.chop}

      result = @new_arr.select { |song| include_tags.all? { |i| song.tags.include?(i)} && exclude_tags.all? { |ex| song.tags.include?(ex) == false}}
    end

    result = @new_arr.select { |song| criteria[:filter].call(song) } if criteria[:filter]

    result
  end

end

songs = "Greensleves.                  John Coltrane.      Jazz, Bebop.        popular, cover
         Alabama.                      Bach.      Jazz, Avantgarde.   melancholic
         Afro Blue.                    John Coltrane.      Jazz.               melancholic"

rechnik = {
            'John Coltrane' => %w[saxophone],
            'Bach' => %w[piano polyphony],
          }

test = Collection.new(songs, rechnik)
test.parse
test.find(name: 'My Favourite Things')
test.find(name: 'Alabama', artist: 'Bach')
test.find(artist: 'John Coltrane')
test.find(tags: 'bebop')
# test.find tags: %w[jazz avantgarde piano]
test.find filter: ->(song) { song.name.start_with?('My') }
test.find tags: %w[jazz piano!]
test.find tags: %w[popular jazz bebop]







# My Funny Valentine.           Miles Davis.        Jazz.               popular
# 'Round Midnight.              John Coltrane.      Jazz
# Tutu.                         Miles Davis.        Jazz, Fusion.       weird, cool
# Miles Runs the Voodoo Down.   Miles Davis.        Jazz, Fusion.       weird
# Boplicity.                    Miles Davis.        Jazz, Bebop
# Autumn Leaves.                Bill Evans.         Jazz.               popular
# Waltz for Debbie.             Bill Evans.         Jazz
# 'Round Midnight.              Thelonious Monk.    Jazz, Bebop
# Ruby, My Dear.                Thelonious Monk.    Jazz.               saxophone
# Fur Elise.                    Beethoven.          Classical.          popular
# Moonlight Sonata.             Beethoven.          Classical.          popular
# Pathetique.                   Beethoven.          Classical
# Toccata e Fuga.               Bach.               Classical, Baroque. popular
# Goldberg Variations.          Bach.               Classical, Baroque
# Eine Kleine Nachtmusik.       Mozart.             Classical.          popular, violin
