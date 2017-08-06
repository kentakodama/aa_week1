require 'byebug'

class Array

  def my_join(str = "")
    results = ''
    self.each_with_index do |el, i|
      results += el
      results += str unless i == self.length-1
    end
    results
  end

end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)

  return false if num <= 1
  return true if num == 2

  i = 2
  while i < num
    return false if num % i == 0
    i += 1
  end

  true

end

def primes(num)

  #create results
  results = []
  # have a counter that increments
  i = 2
  # check if that num is a prime
  until results.length == num
    results << i if is_prime?(i)
    i += 1
  end

  results
  # add to the results until there enough nums filled

end

class Array

  def my_bsearch(target)
    return nil if self.empty?
    middle = self.length/2
    return middle if self[middle] == target

    if self[middle] > target
       #lower half
       self[0...middle].my_bsearch(target)
    else
      # this part is tricky
      #since the length gets cut in half its doesnt reflect the original length of the array anymore
      #there has to be a way to return the index
      search_res = self[middle+1..-1].my_bsearch(target)
      search_res.nil? ? nil : middle + 1 + search_res
    end

  end

end

# Write a method that returns the median of elements in an array
# If the length is even, return the average of the middle two elements
class Array
  def median
    return nil if self.empty?
    #sort the array in order
    sorted = self.sort
    length = sorted.length
    if length.odd?
      # if the length is odd return the index of length/2
      sort[length/2]
    else
      # else get the length/2-1 index and length/2 index and get average with fdiv
      #debugger
      first = (length/2)-1
      second = length/2
      (sorted[first] + sorted[second]).fdiv(2)
    end
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)

  factors = []
  # iterate through all nums from 1 to num
  # add to factors if evenly divisible
  # return factors

  i = 1
  while i <= num
    factors << i if num % i == 0
    i += 1
  end

  factors

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
    # have nested loops
    # get all combinations of i and j
    # if those elements add to 0 then push onto results
    #
    i = 0
    while i < self.length
      j = i + 1
      while j < self.length
        results << [i, j] if self[i] + self[j] == 0
        j += 1
      end
      i += 1
    end

    results
  end
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    #make sure to get DUPLICATES! not unique
    results = Hash.new {|h, k| h[k] = []}

    duplicates = self.select {|el| self.count(el) > 1}

    self.each_with_index do |el, i|
      results[el] << i if duplicates.include?(el)
    end
    results
  end



end

[1, 3, 4, 3, 0, 3, 0].dups


class Array

  def my_rotate(num=1)
    # if positive rotate
    copy = self.dup
    if num > 0
      num.times do
        first = copy.shift
        copy << first
      end
    else
      num.abs.times do
        last = copy.pop
        copy.unshift(last)
      end
    end
    #num times rotate once at a time
    #if negative rotate reverse
    copy
  end

end

class Array

  def my_reverse
    results = []
    self.each do |el|
      results.unshift(el)
    end
    results
  end

end

class Array

  # Takes a multi-dimentional array and returns a single array of all the elements
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
  def my_flatten

    results = []
    self.each do |el|
      if el.class == Array
        results += el.my_flatten
      else
        results << el
      end
    end

    results


  end

  # Write a version of flatten that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,[5]]
  def my_controlled_flatten(n=1)
    #here
    return self if n < 1

    results = []
    self.each do |el|
      if el.class == Array
        #here
        results += el.my_controlled_flatten(n-1)
      else
        results << el
      end
    end

    results

  end


end

class Hash

  # Write a version of merge. This should NOT modify the original hash
  def my_merge(hash2, &prc)

    #create a duplicate of self
    #create default proc that repalces old with new
    #iterate thru second hash and if it doesnt exist in the original add the key and value
    #otherwise if it does exist have the output hash keys value be the results of calling the proc on the existing and elements

    duplicate = self.dup
    prc ||= Proc.new {|k, old_val, new_val| new_val}

    hash2.each do |k, v|
      if duplicate.key?(k) == nil
        duplicate[k] = v
      else
        duplicate[k] = prc.call(k, duplicate[k], hash2[k])
      end
    end

    duplicate
  end

end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    results = []
    #get all the subwords
    subwords = []
    i = 0
    while i < self.length
      j = i
      while j < self.length
        subwords << self[i..j]
        j += 1
      end
      i += 1
    end

    subwords.uniq.each do |word|
      results << word if dictionary.include?(word)
    end

    #only get uniq versions of subwords
    results
    #add word to results if they are included in dictioanry

    #return the results
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings

    results = []
    #get all the subwords
    substrings = []
    i = 0
    while i < self.length
      j = i
      while j < self.length
        substrings << self[i..j]
        j += 1
      end
      i += 1
    end

    substrings.each do |str|
      results << str if str.palindrome? && str.length > 1
    end

    results

  end

  def palindrome?
    self.split('') == self.split('').reverse
  end

end

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
  results = []
  #get all chars
  chars = str.split('')
  # if its a char included in alpha then get index num of low case
  alphabet = ('a'..'z').to_a
  chars.each do |char|
    if alphabet.include?(char.downcase)
      index = alphabet.index(char.downcase)
      results << alphabet[(index+shift)%26]
    else
      results << char
    end
  end
  # add the shift to index and get the modulo and get the letter indexd there
  # else pass the char to results because not a letter

  results.join('')

end

# Write a method that capitalizes each word in a string like a book title
# Do not capitalize words like 'a', 'and', 'of', 'over' or 'the'
def titleize(title)
  results = []
  #get all the words
  bad_words = ['a', 'and', 'or', 'of', 'over', 'the']
  words = title.split(' ')
  # iterate over words with INDEX
  words.each_with_index do |word, i|
    word.downcase!
    if i == 0
      results << word.capitalize
    elsif bad_words.include?(word)
      results << word
    else
      results << word.capitalize
    end
  end
  #capitalize if first word
  #capitalize unless the included in the bad list
  results.join(' ')
end

# Write a method that translates a sentence into pig latin. You may want a helper method.
# 'apple' => 'appleay'
# 'pearl' => 'earlpay'
# 'quick' => 'ickquay'
def pig_latinify(sentence)
  results = []
  sentence.split(' ').each do |word|
    results << pig_word(word)
  end
  results.join(' ')
end

def pig_word(word)
  vowels = ('aeiou').split('')
  #if vowel start then just add ay
  idx_vowel = first_vowel(word)

  if vowels.include?(word[0])
    word + 'ay'
  elsif word.include?('qu')
    qu_finish = word.index('qu') + 1
    word[(qu_finish+1)..-1] + word[0..qu_finish] + 'ay'
  else
    word[idx_vowel..-1] + word[0...idx_vowel] + 'ay'
  end
end

def first_vowel(word)

  vowels = ('aeiou').split('')
  word.split('').each_with_index do |letter, i|
    return i if vowels.include?(letter)
  end
  -1
end


class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &prc)
    copy = self.dup
    accumulator ||= copy.shift
    copy.each do |el|
      accumulator = prc.call(accumulator, el)
    end
    accumulator
  end
end

# Write a method that doubles each element in an array
def doubler(array)
  array.map do |num|
    num *= 2
  end

end

class Array

  def my_all?(&prc)

    self.each do |el|
      return false unless prc.call(el)
    #run thru all el and false if prc if false at the end true
    end
    true
  end

end

class Array

  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index(&prc)
    i = 0
    while i < self.length
      prc.call(self[i], i)
      i += 1
    end
    self

  end

end

class Array

  def my_any?(&prc)
    self.each do |el|
      return true if prc.call(el)
    end
    false
  end

end

class Array

  def my_zip(*arrs)
    result = []
    (0...self.length).each do |i|
      result << [self[i]]
      arrs.each do |arr|
        result[i] << arr[i]
      end
    end

    result
  end

end


class Array

  def my_reject(&prc)
    results = []
    self.each do |el|
      results << el unless prc.call(el)
    end
    results
  end

end

class Array

  def my_select(&prc)
    results = []
    self.each do |el|
      results << el if prc.call(el)
    end
    results

  end

end

class Hash

  # Write a version of my each that calls a proc on each key, value pair
  def my_each(&prc)
    self.keys.each do |key|
      prc.call(key, self[key])
    end
    self
  end

end

class Array

  #Write a monkey patch of quick sort that accepts a block

  def my_quick_sort(&prc)
    prc ||= Proc.new {|a, b| a <=> b}
    return self if self.length <= 1

    pivot = self[0]
    #must start with num when calling proc
    left = self[1..-1].select { |num| prc.call(num, pivot) == -1 }
    right = self[1..-1].select { |num| prc.call(num, pivot) != -1 }

    #must call recurisive with &
    left.my_quick_sort(&prc) + [pivot] + right.my_quick_sort(&prc)

  end


end

class Array

  def merge_sort(&prc)
    prc ||= Proc.new {|a, b| a <=> b}

    return self if self.length <= 1
    middle = self.length/2

    left = self[0...middle].merge_sort(&prc)
    right = self[middle..-1].merge_sort(&prc)

    Array.merge(left, right, &prc)
  end


  def self.merge(left, right, &prc)

    results = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first, &prc)
      when -1
        results << left.shift
      when 0
        results << right.shift
      when 1
        results << right.shift
      end
    end

    results += left
    results += right

  end


end


class Array
  def bubble_sort!
    self.bubble_sort!
  end

  def bubble_sort!(&prc) #have all defaults here
    prc ||= Proc.new { |a, b| a <=> b}
    i = 0
    while i < self.length
      j = i + 1
      while j < self.length
        if prc.call(self[i], self[j]) == 1
          self[i], self[j] = self[j], self[i]
        end
        j += 1
      end
      i += 1
    end
    self
  end

  def bubble_sort(&prc)
    duplicate = self.dup
    duplicate.bubble_sort!(&prc)
  end
end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  alphabet ||= ('a'..'z').to_a
  #access each letter
  #call both letters and switch if the letters if the index of first is higher than the index of the second

  letters = str.split('')
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
