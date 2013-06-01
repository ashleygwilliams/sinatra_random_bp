class JSON_parse
  attr_accessor :json_obj, :map_obj

  def self.load
    JSON_parse.new()
  end

  def initialize
    json_txt = JSON_parse.load_file
    @json_obj = MultiJson.decode(json_txt)
    @map_obj = json_txt
  end


  private

  def self.load_file
    filename = File.join('data/map', "neighborhoods.json")
    File.open(filename, 'r').read
  end

end