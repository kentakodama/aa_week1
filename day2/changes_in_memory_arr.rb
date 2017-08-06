#for immutable objects like numbers

x = 4
y = x

x += 2
y #this will REAMAIN 4 always



#for mutable objects like strings and arrays, depending on what method you use the change values, it can have strange effects

#y value changes!
x = "donatello"
y = x
x << "teenage mutant ninja turtle"
y

#y value doesnt change
x = "donatello"
y = x
x += "teenage mutant ninja turtle"

y

#the trickiest is when dealing with matrices

#watch out!
x = Array.new(3, [])
x[0] << 'hello'
# x = [['hello'], ['hello'], ['hello']]

#these are the proper ways to only change the first of the subarrays
#method 1, with syntatic sugar
y = Array.new(3) {[]} # this is the same as a = Array.new() {Array.new}
y[0] << 'hello'

#y = [['hello'], [], []]

#method 2, with nested new array declarations
z = Array.new(3){Array.new(3, nil)
z[0][0] = "Hello"
#z is now [["Hello", nil, nil], [nil, nil, nil], [nil, nil, nil]]
