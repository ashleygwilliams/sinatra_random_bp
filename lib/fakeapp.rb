class FakeApp 
  @@current_app = nil

  attr_accessor :name, :dataset, :font, :server, :zooms, :boilerplate, :tile_set, :navbar, :jquerytheme, :colors, :bootstraptheme

  PREFIXES = ["responsive", "game", "beta", "tech", "digital", "social", "my", "our", "the", "all", "in", "on"]
  SUFFIXES = ["box", "grid", "share", "wise", "hop", "works", "bit", "book", "list", "square", "rock", ".ly", "sy", "er", ".it", "ie", ".io", ".am", "ia", "ora", "ero", "ist", "ism", "ium", "ble", "ify", "ous", "ing"]
  TILE_LAYERS = ["'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {attribution: 'OpenStreetMap'}",
                  "'http://otile{s}.mqcdn.com/tiles/1.0.0/{type}/{z}/{x}/{y}.png', {subdomains: '1234', type: 'osm', attribution: 'MapQuestOpen'}",
                  "'http://otile{s}.mqcdn.com/tiles/1.0.0/{type}/{z}/{x}/{y}.png', {subdomains: '1234', type: 'sat', attribution: 'MapQuestOpen'}",
                  '"http://{s}.tile.opencyclemap.org/cycle/{z}/{x}/{y}.png", {attribution: "OpenCycleMap"}'
  ]
  SERVERS = [
    "Server:Apache/2.2.14 (Unix) mod_ssl/2.2.14 OpenSSL/0.9.8e-fips-rhel5 DAV/2 mod_auth_passthrough/2.1 mod_bwlimited/1.4 FrontPage/5.0.2.2635",
    "Apache/2.2",
    "GitHub.com",
    "Apache",
    "nginx/1.0.0",
    "Microsoft-IIS/7.5",
    "Apache/2.4.4 (Unix) OpenSSL/1.0.0g",
  ]
  ZOOMS=(3..21).to_a
  BOILERPLATES = ["bootstrap", "jquerymobile"]
  FONTS = ["Lobster", "Raleway","Lato","Oleo Script","Special Elite","Fredoka One"]
  PATTERNS = ["img/bg_stripe.png", "img/bg_square.png"]
  NAV = ["navbar-fixed", "navbar-fixed navbar-inverse", "navbar-inverse", ""]
  JQUERYTHEME = ["a", "b", "c", "d", "e"]
  BOOTSTRAPTHEME = ["amelia", "bootstrap", "cerulean", "cosmo", "cyborg", "journal", "readable", "simplex", "slate", "spacelab", "spruce", "superhero", "united"]

  def initialize
    @boilerplate = BOILERPLATES.sample
    @dataset = Dataset.load_random
    @subjects = self.dataset.json_obj["tags"]
    @name = self.getRandomName
    @tile_set = TILE_LAYERS.sample
    @@current_app = self
    @server = SERVERS.sample
    @zooms = (ZOOMS.sample 2).sort
    @font = FONTS.sample
    @navbar = "navbar " + NAV.sample
    @jquerytheme = JQUERYTHEME.sample
    @colors = getRandomColor
    @bootstraptheme = BOOTSTRAPTHEME.sample
  end 

  def self.current_app
    @@current_app
  end

  def getRandomName
    if rand > 0.7
      PREFIXES.sample + @subjects.sample
    else
      @subjects.sample + SUFFIXES.sample
    end
  end

  def getRandomColor
    color1 = "#" + "%06x" % (rand * 0xffffff)
    color2 = "#" + "%06x" % (rand * 0xffffff)
    color3 = "#" + "%06x" % (rand * 0xffffff)
    [color1, color2, color3]
  end

end
