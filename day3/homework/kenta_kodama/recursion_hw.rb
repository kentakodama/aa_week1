def sum_to(n)
  return nil if n <= 0
  return 1 if n == 1
  n + sum_to(n-1)
end

def add_numbers(nums)
  return nil if nums.empty?
  return nums[0] if nums.length == 1
  nums[0] + add_numbers(nums[1..-1])
end

def gamma_fnc(num)

  return nil if num < 0
  return 1 if num == 1
  return 1 if num == 0
  (num - 1) * gamma_fnc(num-1)

end



def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return true if flavors[0] == favorite
  ice_cream_shop(flavors[1..-1], favorite)
end


def reverse(str)
  return str if str.length <= 1
  str[-1] + reverse(str[0..-2])
end
