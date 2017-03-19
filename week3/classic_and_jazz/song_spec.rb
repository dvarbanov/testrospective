require './song.rb'

describe Song do
  let(:my_song) { Song.new('Greensleves', 'John Coltrane', 'Jazz', 'Bebop', 'popular, cover') }

  describe '.new' do
    it 'creates a new song' do
      Song.new('Green', 'John', 'Jazz', 'Bebop', 'popular')
    end
  end

  describe '#name' do
    it "tell us a song's name" do
      expect(my_song.name).to eq('Greensleves')
    end
  end

  describe '#artist' do
    it "tell us a song's artist" do
      expect(my_song.artist).to eq('John Coltrane')
    end
  end

  describe '#genre' do
    it "tell us a song's genre" do
      expect(my_song.genre).to eq('Jazz')
    end
  end

  describe '#subgenre' do
    it "tell us a song's subgenre" do
      expect(my_song.subgenre).to eq('Bebop')
    end
  end

  describe '#tags' do
    it "tell us a song's tags" do
      expect(my_song.tags).to eq('popular, cover')
    end
  end
end

describe Collection do
  let(:my_collection) do
    songs = "Greensleves. John Coltrane. Jazz, Bebop. popular, cover
             Alabama. Bach. Jazz, Avantgarde. melancholic
             Afro Blue. John Coltrane. Jazz. melancholic"

    rechnik = {
      'John Coltrane' => %w(saxophone),
      'Bach' => %w(piano polyphony)
    }
    Collection.new(songs, rechnik)
  end

  describe '.new' do
    it 'creates a new collection' do
      Collection.new('songs_string', 'dictionary_string')
    end
  end

  describe '#find' do
    it 'finds song by name' do
      result = my_collection.find name: 'Alabama'

      expect(result.to_s).to include('Alabama', 'Bach')
      expect(result.to_s).not_to include('Greensleves', 'Afro Blue')
    end

    it 'finds songs by artist' do
      result = my_collection.find artist: 'Bach'

      expect(result.to_s).to include('Alabama')
      expect(result.to_s).not_to include('Greensleves', 'Afro Blue')
    end

    it 'finds songs by tags' do
      result = my_collection.find tags: %w(popular jazz bebop)

      expect(result.to_s).to include('Greensleves')
      expect(result.to_s).not_to include('Alabama', 'Afro Blue')
    end

    it 'finds songs using exclamation mark' do
      result = my_collection.find tags: %w(jazz piano!)

      expect(result.to_s).to include('Greensleves', 'Afro Blue')
      expect(result.to_s).not_to include('Alabama')
    end

    it 'finds songs by genre' do
      result = my_collection.find genre: 'Jazz'

      expect(result.to_s).to include('Greensleves', 'Alabama', 'Afro Blue')
    end

    it 'finds songs by artist and tag'  do
      result = my_collection.find tags: 'popular', artist: 'John Coltrane'

      expect(result.to_s).to include('Greensleves')
      expect(result.to_s).not_to include('Alabama', 'Afro Blue')
    end

    it 'finds songs by filter' do
      result = my_collection.find filter: ->(song) { song.name.start_with?('Green') }

      expect(result.to_s).to include('Greensleves')
      expect(result.to_s).not_to include('Alabama', 'Afro Blue')
    end
  end
end
