class Node # Node object
  attr_accessor :value, :next

  def initialize(value) # initialize with a value
    @value = value
  end
end

class LinkedList
  def self.print_forward(node) # This method prints out node object
    while node != nil # while node exists
      puts node.value # puts node's value
      node = node.next # node is set to be node.next to go forward
    end
  end

  def self.reverse(node) # This method reverses the flow
    current = node # current is node
    first = nil
    second = nil
    # until we have 'fallen off' the end of the list
    while current != nil
      # copy a pointer to the next element
      # before we overwrite current.next
      second = current.next
      # reverse the 'next' pointer
      current.next = first
      # step forward in the list
      first = current
      current = second
    end
    first
  end

  def self.delete_node(node_to_delete)
    node = node_to_delete
    # This is not really deleting a node. It sets the current node to the next node
    if node.next # if the current node has a next node attached to it
      node_to_delete.value = node.next.value # set current node's value to the next node's value
      node_to_delete.next = node.next.next # set current node's pointer to the next node's pointer
    else
      raise Exception("Cannot delete the last node with this method!") # if the current node does not have a next node, it raises exception.
    end
  end

  def self.print_reverse(node) # This method prints out reversed node
    print_forward(reverse(node)) # using print_forward method with a paramenter of reversed node
  end
end

a = Node.new('a')
b = Node.new('b')
c = Node.new('c')

a.next = b
b.next = c

LinkedList.print_forward(a)
p "*" * 50
LinkedList.print_reverse(a)
p "*" * 50
LinkedList.print_forward(c)
p "*" * 50
LinkedList.delete_node(b)
LinkedList.print_reverse(c)