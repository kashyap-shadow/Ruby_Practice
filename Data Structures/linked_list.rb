class LinkedList
  def initialize
    @head = nil
  end
  
  def insert_end(value)
    temp = Node.new(value)
    if @head
      temp1 = @head
      while(temp1.next != nil)
        temp1 = temp1.next
      end
      temp1.next = temp
    else
      @head = temp
    end
    puts 'Value(s) inserted at the end of the list'
  end

  def insert_start(value)
    temp = Node.new(value)
    if @head
      temp.next = @head
    end
    @head = temp

    puts 'Value(s) inserted at the beginning of the list'
  end

  def insert_position(value, position)
    temp = Node.new(value)

    if position == 1
      temp.next = @head
      @head = temp
      return
    end

    # reaching at n-1 node
    temp1 = @head
    (0...(position-2)).each do
      temp1 = temp1.next
    end
    temp.next = temp1.next
    temp1.next = temp
  end

  def delete_position(position)
    temp = @head
    if position == 1
      @head = temp.next
      return
    end
    # reaching n-1 node
    (0...(position-2)).each do
      temp = temp.next
    end
    temp.next = temp.next.next
  end

  def reverse_list
    current = @head
    prev = nil
    next_node = nil
    # return if temp == nil || temp.next == nil

    while(current != nil)
      next_node = current.next
      current.next = prev
      prev = current
      current = next_node
    end
    @head = prev
  end

  def reverse_list_recursion(node)
    if node.next == nil
      @head = node
      return
    end
    reverse_list_recursion(node.next)
    temp = node.next
    temp.next = node
    node.next = nil
  end

  def list_count
    temp = @head
    count = 0
    while(temp != nil)
      count = count + 1
      temp = temp.next
    end
    count
  end

  def print_list
    temp = @head
    puts 'List is: '
    while(temp != nil)
      puts temp.data
      temp = temp.next
    end
  end

  def reverse_print_list
    current = @head
    prev = nil
    next_node = nil

    puts 'Reverse printed list is:'
    while(current != nil)
      puts current.data

      next_node = current.next
      current.next = prev
      prev = current
      current = next_node
    end
  end

  def print_list_recursion(node)
    return if node == nil

    puts node.data
    print_list_recursion(node.next)      
  end

  def reverse_print_list_recursion(node)
    return if node == nil

    reverse_print_list_recursion(node.next)
    puts node.data
  end
end

class Node
  attr_accessor :next
  attr_reader :data

  def initialize(data)
    @data = data
    @next = nil
  end
end

class MainClass
  def main_func
    # list = LinkedList.new

    # puts 'Insert list values:'
    # while true
    #   if user_input = gets.chomp.to_i
    #     list.insert_end(user_input)
    #   else
    #     break
    #   end
    # end

    list = LinkedList.new
    list.insert_end(10)
    list.insert_end(20)
    list.insert_end(30)
    list.insert_end(40)

    list.print_list
    # puts 'Printing list using recursion:'
    # list.print_list_recursion(list.instance_variable_get(:@head))

    # # list.reverse_print_list
    # puts 'Reverse printing list using recursion:'
    # list.reverse_print_list_recursion(list.instance_variable_get(:@head))

    # list = LinkedList.new
    # list.insert_start(10)
    # list.insert_start(20)
    # list.insert_start(30)
    # list.insert_start(40)

    # list = LinkedList.new
    # list.insert_position(2,1)
    # list.insert_position(3,2)
    # list.insert_position(4,1)
    # list.insert_position(5,2)

    # list.delete_position(2)
    # list.print_list

    # list.reverse_list
    list.reverse_list_recursion(list.instance_variable_get(:@head))
    list.print_list
  end
end