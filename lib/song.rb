require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end



  def self.create 
  song = self.new
  song.save
  return song

  end

  def self.new_by_name(name1)
      song = self.new
      song.name = name1
      song 

      
  end

  def self.create_by_name(name1)
     song = self.new_by_name(name1)
     song.save
     song 
  end 

  def self.find_by_name(name)
      if self.all.find {|songs| songs.name ==name }
      self.all.find {|songs| songs.name ==name } 
  else 
    return nil
  end
end


  def self.find_or_create_by_name(name)
        if self.find_by_name(name)
          self.find_by_name(name) 
        else
          self.create_by_name(name)
       
        end

  end


  def self.alphabetical 
      @@all.sort_by {|instan| instan.name }
  end 

  def self.new_from_filename(mp3_file)
    array= mp3_file.split(/[-.]/).map {|song| song.strip}
    
    song = self.new
    song.name = array[1]
    song.artist_name = array[0]
    song

 end 

  def self.create_from_filename(mp3_file)
      new_from_filename(mp3_file).save 

  end 

  def self.destroy_all
      @@all = []
  end


    
end
