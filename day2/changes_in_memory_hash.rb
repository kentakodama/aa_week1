#like array, hash default has its own quirks

#step 1
cats = Hash.new(0)
#cats will be {}
cats['Kenta'] #return zero, but cats is still {} empty because no value is set
#a value is only set if it is changed from its initial value
#"Providing an argument to Hash.new merely changes what is returned when we look up a key that isn't present in the hash."

#BUT
cats['Andres'] = 26
#cats is now {'Andres' => 26}
# this works like this because the default value doesnt doe anything as long as it remains unchanged, i


#step 2

cats = Hash.new

cats['group1'] = ['Kenta', 'Andres']
cats['group1'] += ['Katrina'] #this will make cats['group1'] = ['kenta', 'Andres', 'Katrina']

#problem when pushing values into arrays that are values

cats = Hash.new([]) #NOTICE!!!
#cats is empty
cats['kenta'] << 'kodama'

#cats will be {}

#BUT
cats['Andres'] #will return "kodama"
#this is because the default value was changed when shoveling 'kodama' into  the default value [] of a non-existent key

#THIS Changed the default value permanently for all potential keys

#to avoid this do the following

cats2 = Hash.new() {[]}
#this makes each default value the same, but makes them indepdent from one another
cats2['kenta'] << 'kodama'
cats2['Andres'] #this is still equal to an empty array
cats2 #prints {}
p "THIS IS THE MOST IMPORTANT"
# in order to actually store values and keys that can be concatted and shoveled the following is necesary

cats3 = Hash.new {|h, k| h[k] = []}

cats3 #{}
cats3['kenta'] # []
cats3 #{'kenta' => []}
cats3['kenta'] << 'kodama'
cats3 # is now {'kenta' => ['kodama']}
cats3['andres']
cats3 # is now {'kenta' => ['kodama'], 'andres' => []}
