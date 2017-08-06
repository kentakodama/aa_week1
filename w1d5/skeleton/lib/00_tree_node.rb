class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def parent=(new_parent)
    
    unless @parent == nil
      old_parent = @parent
      old_parent.children.delete(self)
    end
    @parent = new_parent
    new_parent.children << self unless new_parent.nil?

  end

  def children
    @children
  end

  def add_child(child)
    child.parent=(self)
  end

  def remove_child(child)
    raise 'error' unless @children.include?(child)
    child.parent=(nil)
  end

  def value
    @value
  end

  def bfs(jesus)
    # start w/ the first person into the family tree
    queue = [self]

    # is the first person jesus?
    until queue.empty?
    # if yes return the person's name
      person = queue.shift
      if person.value == jesus
        return person
      else
        queue += person.children
      end
      # if not, get a collection of the person's children if they have any and add at the end
    # of the list
    # and go through the list in order and check if they're Jesus
    end
    nil
  end

end
