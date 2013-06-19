require 'open-uri'
require 'nokogiri'

class Scraper
  

  def self.getTableData
    download = open("http://www.health.ny.gov/statistics/cancer/registry/appendix/neighborhoods.htm")

    html = Nokogiri::HTML(download)
    tables = html.search("table")
    table = tables[0]
    neighborhoods = []
    zips =[]
    nzips = {}
    table.search('tr').each do |tdd|
      tdd.search('td').each do |td|
        if td["headers"]== "header2"
          neighborhoods.push(td.text.lstrip)
        end
        if td["headers"]== "header3"
          zips.push(td.text.lstrip)
        end
      end
    end
    nzips = Hash[neighborhoods.zip(zips.map {|z| z.split /, /})]
  end

end

# References
# 
# http://talks.thomaslevine.com/news-hack-day-sf/#cheatsheet
# https://scraperwiki.com/scrapers/unionreports/edit/
# https://scraperwiki.com/docs/ruby/
# https://scraperwiki.com/docs/ruby/tutorials/