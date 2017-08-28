#HISTOGRAM
def histogram(text) #either this or the gets below
  #puts "Write your text that needs histograming"
  #text = gets.chomp

  words = text.downcase.split(" ")
  freq = Hash.new(0)
  words.each { |word| freq[word] += 1 }
  freq = freq.sort_by { |a, b| b}
  freq.reverse!
  #print freq.each { |word, count| puts word + " " + count.to_s}
  return freq
end

#print histogram
