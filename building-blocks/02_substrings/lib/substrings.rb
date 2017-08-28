#substring method


def substrings(string)
  dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

  ary = string.downcase.split(" ")
  result = Hash.new(0)
  #use .include? = WIN
  dictionary.each do |substring|
    ary.each do |elem|
      if elem.include? substring
        result[substring] += 1
      end
    end
  end
  return result
end

puts substrings("Howdy partner, sit down! How's it going?")

#done
