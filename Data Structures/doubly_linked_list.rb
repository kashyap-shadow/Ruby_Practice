class DoublyLinkedList
  def initialize
    @head = nil
  end

  def insert_start(data)
    temp = Node.new(data)

    if @head
      temp1 = @head
      temp1.prev = temp
      temp.next = temp1
    end
    @head = temp
  end

  def insert_end(data)
    temp = Node.new(data)

    if @head
      temp1 = @head
      while(!temp1.next.nil?)
        temp1 = temp1.next
      end
      temp1.next = temp
      temp.prev = temp1
    else
      @head = temp
    end
    puts 'Value(s) inserted at the end of the list'
  end

  def sorted_insert(data)
    node = Node.new(data)
    if @head
      temp = @head
      if data > temp.data
        while(data > temp.data && !temp.next.nil?)
          temp = temp.next
        end
        if temp.next == nil
          node.prev = temp
          temp.next = node
          return
        end
        temp.prev.next = node
        node.prev = temp.prev
        temp.prev = node
        node.next = temp
      else
        temp.prev = node
        node.next = temp
        @head = node
      end
    else
      @head = node
    end
  end

  def reverse_list
    current = @head
    prev_node = nil
    next_node = nil

    while(!current.nil?)
      next_node = current.next
      current.next = prev_node
      prev_node = current
      prev_node.prev = next_node
      current = next_node
    end
    @head = prev_node
  end

  def print_list
    return unless @head

    temp = @head
    puts 'List is:'

    while(!temp.nil?)
      puts temp.data
      temp = temp.next
    end
  end

  def reverse_print_list
    return unless @head

    temp = @head

    while(!temp.next.nil?)
      temp = temp.next
    end

    puts 'Reverse printing list:'
    while(!temp.nil?)
      puts temp.data
      temp = temp.prev
    end
  end
end

class Node
  attr_accessor :next, :prev
  attr_reader :data

  def initialize(data)
    @data = data
    @next = nil
    @prev = nil
  end
end

class MainClass
  list = DoublyLinkedList.new
  list.insert_end(10)
  list.insert_end(20)
  list.insert_end(40)
  list.print_list

  # list.sorted_insert(30)
  # list.print_list

  # list.sorted_insert(50)
  # list.print_list

  # list.sorted_insert(5)
  # list.print_list

  # list.reverse_print_list
  # list = DoublyLinkedList.new
  # list.insert_start(10)
  # list.insert_start(20)
  # list.insert_start(30)
  # list.insert_start(40)
  # list.print_list
  # list.reverse_print_list

  list.reverse_list
  list.print_list
end