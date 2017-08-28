def caesar_cipher(string, factor)

  words_array = string.split(" ")
  result = Array.new

  words_array.map do |word|
    coded = "" #blank result, gets updated on every cycle
    word.chars.map do |char|
      letter = char.ord
      #ghetto wrap and interpunction control
      if letter < 65 || letter > 122
        letter
      else
        letter += factor
        if char == char.downcase
          if letter > 122
            letter -= 26
          end
        elsif char == char.upcase
          if letter > 90
            letter -= 26
          end
        end
      end
      letter = letter.chr

      coded += letter
    end
    result.push(coded)
  end
  return result.join(" ")
end

caesar_cipher("Sample test}", 3)
caesar_cipher("What a string!", 5)

#Z + 5 = E (90 + 5 - 26 = 69) A=65 Z=90
#z + 5 = e (122 + 5 - 26 = 101) a=97 z=122

#done
