def upcase(str)

  return str.upcase if str.length == 1

  str[0].upcase + upcase(str[1..-1])
end

p upcase('hello world')

def reverse(str)
  return str if str.length == 1
  str[-1] + reverse(str[0..-2])
end

p reverse('hello world')


def quick_sort(arr)
  return arr if arr.length <= 1
  pivot = [arr.first]
  left = arr[1..-1].select {|num| num < pivot.first}
  right = arr[1..-1].select {|num| num >= pivot.first}
  quick_sort(left) + pivot + quick_sort(right)
end


array = [1, 2, 3, 33523, 523, 32, 9, 3, 1, 3, 5, 7, 4, 3, 6, 4, 3]
p quick_sort(array)
