
#info 1

a, b = [1, 2, 3] # a = 1, b = 2, 3 wont do be assigned to anything
a, *b = [1, 2, 3] # a = 1, b = [2, 3]

#info 2



class Rememberacci

  def initialize
    @fibs_catalog = Hash.new
  end
  #be careful! the hash must be a instance variable or this whole motherfucker wont work!!
  def retrieve_from(idx)

    @fibs_catalog[idx] ||= generate_new(idx)
    #this means that if the 'index' value in the hash exists, get its key for the correct fib number
    #otherwise, generate the fib number through recursion below, while storing every iteration in the catalog
  end

  def generate_new(index)
    if index == 0
      return 0
    elsif index == 1
      return 1
    else
      retrieve_from(index-1) + retrieve_from(index - 2)
    #notice that not only is this recursion, it also stores each result in the
    #catalog hash
    end
  end

end
