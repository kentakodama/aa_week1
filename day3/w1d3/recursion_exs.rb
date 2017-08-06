def range(start, finish)
  return nil if start > finish
  return [] if start == finish
  [start] + range((start+1), finish)
end

# puts range(1, 5)

def recursive_sum(arr)
  return nil if arr.empty?
  return arr[0] if arr.length == 1
  arr[0] + recursive_sum(arr[1..-1])
end

# puts recursive_sum([4, 6, 2])

def iterative_sum(arr)
  total = 0
  arr.each {|num| total += num}
  return total
end

# puts iterative_sum([9, 4, 7])

def exp(base, power)
  return 1 if power == 0
  return base if power == 1
  base * exp(base, (power-1))
end


puts exp(3, 4)



def deep_dup(arr)
  new_arr = []

  arr.each do |el|
    if el.is_a? Array
      new_arr += [deep_dup(el)]
    else
      new_arr << el
    end
  end

  new_arr

end

# arr = [1, 2, 3, [4], [[6, 6], 7]]
# copy = deep_dup(arr)
# p copy.pop
# p copy
# p arr
#
# # input is 3
#output [1, 1, 2]



# p "HERE"
# p fib(6)

#input 3
#output [1, 1, 2]

def fib_test(num)

  return 1 if num == 1
  return 1 if num == 2
  arr = [1, 1]
  (3..num).map {|n| arr << fib_num(n-1) + fib_num(n-2) }
  # next_num = fib_num(num-1) + fib_num(num-2)
  # fib_test(num-1) + [next_num]
end

# p fib_test(5)

def fib_num(num)

  return 1 if num == 1
  return 1 if num == 2
  fib_num(num-1) + fib_num(num-2)

end


def fib_array(num)

  return [0, 1].take(num) if num <= 2
  prev_nums = fib(num - 1)
  next_num = prev_nums[-1] + prev_nums[-2]
  prev_nums << next_num
end

# p fib_num(5)

#wrapping version
def fib_cheat(num)
  results = []
  (1..num).each {|num| results << fib_num(num)}
  results
end

#p fib_cheat(6)

def subsets(arr)

end
