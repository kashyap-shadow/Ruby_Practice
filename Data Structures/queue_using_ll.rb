class QueueUsingLL
  def initialize
    @front = nil
    @rear = nil
  end

  def enqueue(data)
    node = Node.new(data)
    if isEmpty?
      @front = @rear = node
    else
      @rear.next = node
      @rear = node
    end
  end

  def dequeue
    if isEmpty?
      puts 'No element to remove.'
    elsif @front == @rear
      @front = @rear = nil
    else
      @front = @front.next
    end
  end

  def isEmpty?
    return true if @front.nil? && @rear.nil?
  end

  def front
    return @front.data unless isEmpty?

    puts 'No element present in the Queue.'
  end

  def printQueue
    temp = @front

    puts 'Queue is:'
    while(!temp.nil?)
      puts temp.data
      temp = temp.next
    end
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
  queue = QueueUsingLL.new

  queue.enqueue(1)
  queue.enqueue(2)
  queue.enqueue(3)
  queue.enqueue(4)
  queue.enqueue(5)
  queue.printQueue

  puts 'Front of the Queue is:'
  puts queue.front

  queue.dequeue
  queue.printQueue

  puts 'Front of the Queue is:'
  puts queue.front
end