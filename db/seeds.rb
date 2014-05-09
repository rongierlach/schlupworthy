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

Word.delete_all
Relationship.delete_all
tgr = EngTagger.new

# sample_sentence = "All Girls Aren’t Clumsy. They’re Just Written That Way By Lazy, Lazy Hollywood."
file = File.open('db/headlines.txt')

file.each do |line|

  prev_word = nil
  words = line.chomp.split(' ')
  words.remove(' ')
  words.each_with_index do |word_str, index|
    word = Word.find_or_create_by(text: word_str)

    # assign alpha / omega occurences
    word.update(alpha: word.alpha + 1) if index == 0
    word.update(omega: word.omega + 1) if index == words.length - 1

    # assign part of speech
    tgr.add_tags(word_str).scan(/<([^\/].{2,6})>/)
    pos = $1.to_s
    word.update(pos: pos)

    # assign prefix / suffix relationships
    if prev_word && relationship = Relationship.find_by(suffix_id: word.id, prefix_id: prev_word.id)
      relationship.update(count: relationship.count + 1)
    else
      prev_word.suffixes << word if prev_word
    end
    prev_word = word
  end

end
