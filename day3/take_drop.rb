
class String

  def first_part?(str)
      self[0...str.length] == str
  end

end

arr = [1, 2, 3, 4]

arr.take(2) #=> [1, 2]
arr.drop(2) #=>[3, 4]
