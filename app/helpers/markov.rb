# def markov
#   sentence = []
#   first_word = Word.alphas.sample()
#   word = first_word
#   until word.is_omega? do
#     sentence << word.text
#     word = word.next_word
#   end
#   p sentence.join(' ')
# end

def markov
  sentence = []
  first_word = Word.alphas.sample()
  word = first_word
  sentence << word.text
  until word.is_omega? && word.suffixes.count == 0 || word.is_omega? && sentence.length > 16 do
    word = word.next_word
    sentence << word.text
  end
  sent = sentence.join(' ')
  if sent.match(/\.\z/)
    sent.gsub!(/\.\z/, "!")
  else
    sent = sent + "!"
  end
  sent
end
