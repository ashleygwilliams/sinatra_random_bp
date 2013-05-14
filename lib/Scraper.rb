require 'open-uri'
require 'nokogiri'

class Scraper
  

  def self.getTableData

    download = open("http://www.dol.gov/olms/regs/compliance/cba/Cba_CaCn.htm")

  html = Nokogiri::HTML(download)
  tables = html.search("table")
  table = tables[1]
    table.search('tr')[1..4].each do |tr|
      tr.search('td').each do |td|
        return td.text
      end
    end
  end

end

# References
# 
# http://talks.thomaslevine.com/news-hack-day-sf/#cheatsheet
# https://scraperwiki.com/scrapers/unionreports/edit/
# https://scraperwiki.com/docs/ruby/
# https://scraperwiki.com/docs/ruby/tutorials/