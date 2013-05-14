class JSON_parse
  attr_accessor :json_obj

  def self.load
    JSON_parse.new()
  end

  def initialize
    json_txt = JSON_parse.load_file
    @json_obj = MultiJson.decode(json_txt)
  end


  private

  def self.load_file
    filename = File.join('data', "elevator.json")
    File.open(filename, 'r').read
  end

end