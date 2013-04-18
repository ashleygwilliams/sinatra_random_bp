class Random

  WORDS = ["hello","goodbye","poop","what","this","yuck"]

  def self.getRandomColor()
    return '#' + "%06x" % (rand * 0xffffff)
  end

end