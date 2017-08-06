# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)

  alphabet = ('a'..'z').to_a
  chars = str.split('')

  results = []
  chars.each do |char|
    if alphabet.include?(char)
      index = alphabet.index(char)
      new_index = (index + shift) % 26
      results << alphabet[new_index]
    else
      results <<  char
    end
  end

  results.join('')
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)

  until num < 10
    num = get_digits(num).reduce(:+)
  end

  num
end


def get_digits(num)

  digits = []
  until num == 0
    digit = num % 10
    digits.unshift(digit)
    num = (num - digit)/10
  end

  digits

end

p get_digits(29)

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

def jumble_sort(str, alphabet = nil)

  return str.split('').sort.join('') if alphabet == nil

  letters = str.split("")

  i = 0
  while i < letters.length
    j = i + 1
    while j < letters.length
      if alphabet.index(letters[i]) > alphabet.index(letters[j])
        letters[i], letters[j] = letters[j], letters[i]
      end
      j += 1
    end
    i += 1
  end

  letters.join('')
end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum

    results = []
    i = 0
    while i < self.length
      j = i + 1
      while j < self.length
        if self[i] + self[j] == 0
          results << [i, j]
        end
        j += 1
      end
      i += 1
    end

    results
  end
end

# Determine if a string is symmetrical. 'racecar' and 'too hot to hoot' are
# examples of symmetrical strings.
#
# Do NOT use any built-in `reverse` methods.

class String

  def symmetrical?

    letters = self.split(' ').join('')
    reversed = []
    letters.split('').each do |char|
      reversed.unshift(char)
    end

    reversed.join == letters

  end

end

# Write a method that returns the factors of a number in ascending order.

def factors(num)

  factors = []

  i = 1
  while i <= num
    factors << i if num % i == 0
    i += 1
  end

  factors

end
