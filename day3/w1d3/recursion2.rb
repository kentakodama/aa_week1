
#[1] =>[[],[1]]



def subsets(arr)

  return [[]] if arr.empty?
  subs = subsets(arr[1..-1])
  subs + subs.map { |sub_arr| sub_arr + [arr[0]] }
end
#
# nextsubsets = (arr[0..-2]).map {|el| el + [arr[-1]]}
# subsets([arr[-1]]) + nextsubsets






def bsearch(arr, target)
  # return nil unless arr.include?(target)
  # return nil if arr.empty?
  anchor = arr.length / 2
  if arr[anchor] == target
    return anchor
  elsif arr[anchor] > target
    bsearch(arr[(anchor + 1)..-1], target)
  else
    bsearch(arr[0...anchor], target)
  end
end
