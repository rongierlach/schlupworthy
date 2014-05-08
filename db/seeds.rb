# SCRAPER
  # require 'nokogiri'
  # require 'open-uri'

  # File.open('db/headlines.txt', 'w') do |file| 
  #   1.upto(317) do |i|
  #     url = "http://www.upworthy.com/page/#{i}"
  #     puts("--"+url)
  #     doc = Nokogiri::HTML.parse(open(url, "User-Agent"=>"Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.16 Safari/534.24"))
  #     doc.css('h3 a').each do |e| 
  #       file.puts()
  #       file.write(e.text) 
  #     end
  #   end 
  # end

  