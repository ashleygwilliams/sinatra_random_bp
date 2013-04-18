class Random

  WORDS = ["hello","goodbye","poop","what","this","yuck"]

  def self.getRandomNumber()
    nums = [1,2,3,4,5,6,7,8,9,10]
    return nums.sample
  end

  def self.getRandomColor
    return '#' + "%06x" % (rand * 0xffffff)
  end

end