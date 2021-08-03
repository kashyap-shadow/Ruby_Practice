class LinkedList
  def initialize
    @head = nil
  end
  
  def insert_end(value)
    temp = Node.new(value)
    if @head
      temp1 = @head
      while(!temp1.next.nil?)
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

    while(!current.nil?)
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

  def get_node(positionFromTail)
    if @head == nil || positionFromTail < 0
        return
    end
    count = get_count
    if positionFromTail > count
       return
    end
    temp = @head
    (0...(count - positionFromTail - 1)).each do
        temp = temp.next
    end
    temp.data
  end

  def get_count
    count = 0
    temp = @head
    while(!temp.nil?)
        count = count + 1
        temp = temp.next
    end
    count
  end

  def remove_duplicate
    return if @head.nil?

    temp = @head
    while(!temp.next.nil?)
      if temp.data == temp.next.data
        temp.next = temp.next.next
      else
        temp = temp.next
      end
    end
  end

  def print_list
    temp = @head
    puts 'List is: '
    while(!temp.nil?)
      puts temp.data
      temp = temp.next
    end
  end

  def reverse_print_list
    current = @head
    prev = nil
    next_node = nil

    puts 'Reverse printed list is:'
    while(!current.nil?)
      puts current.data

      next_node = current.next
      current.next = prev
      prev = current
      current = next_node
    end
  end

  def print_list_recursion(node)
    return if node.nil?

    puts node.data
    print_list_recursion(node.next)      
  end

  def reverse_print_list_recursion(node)
    return if node.nil?

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

class CompareClass
  def compare_list(head1, head2)
    return true if head1.nil? && !head2.nil?

    return false if ((head1.nil? && !head2.nil?) || (!head1.nil? && head2.nil?))

    while(!head1.nil? && !head2.nil? && head1.data == head2.data)
      head1 = head1.next
      head2 = head2.next
    end

    head1 == head2
  end
end

class MergeLinkedList
  def merge(head1, head2)
    if head1.nil? && head2.nil?
      puts 'No list to merge.'
      return head1
    end

    return head2 if head1.nil? && !head2.nil?

    return head1 if !head1.nil? && head2.nil?

    new_node = Node.new(0)
    head3 = new_node

    while(!head1.nil? && !head2.nil?)
      if(head1.data < head2.data)
        head3.next = head1
        head1 = head1.next
      else
        head3.next = head2
        head2 = head2.next
      end
      head3 = head3.next
    end

    while(!head1.nil?)
      head3.next = head1
      head1 = head1.next
      head3 = head3.next
    end

    while(!head2.nil?)
      head3.next = head2
      head2 = head2.next
      head3 = head3.next
    end

    new_node.next
  end

  def print_list_with_node(node)
    temp = node
    puts 'List is: '
    while(temp != nil)
      puts temp.data
      temp = temp.next
    end
  end
end

class MainClass
  # list = LinkedList.new
  # list.insert_end(10)
  # list.insert_end(20)
  # list.insert_end(30)
  # list.insert_end(40)
  # list.print_list

  list = LinkedList.new
  list.insert_end(10)
  list.insert_end(20)
  list.insert_end(20)
  list.insert_end(30)
  list.insert_end(40)
  list.print_list

  list.remove_duplicate
  list.print_list

  # list1 = LinkedList.new
  # list1.insert_end(15)
  # list1.insert_end(25)
  # list1.insert_end(35)
  # list1.insert_end(45)
  # list1.print_list

  # merge_list = MergeLinkedList.new
  # new_list = merge_list.merge(list.instance_variable_get(:@head), list1.instance_variable_get(:@head))
  # puts 'List after merging is:'
  # merge_list.print_list_with_node(new_list)

  # list1 = LinkedList.new
  # list1.insert_end(10)
  # list1.insert_end(20)
  # list1.insert_end(30)
  # list1.insert_end(40)
  # list1.print_list

  # compare_class = CompareClass.new
  # isSame = compare_class.compare_list(list.instance_variable_get(:@head), list1.instance_variable_get(:@head))

  # if isSame
  #   puts 'Both the list are same.'
  # else
  #   puts 'Both the list are not same.'
  # end

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
  # list.reverse_list_recursion(list.instance_variable_get(:@head))
  # list.print_list

  # position = 2
  # puts "Value for position #{position} from the tail is:"
  # puts list.get_node(position)
end
