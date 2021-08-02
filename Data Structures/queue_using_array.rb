# element should be added from rear and added from front
# For circular array
# current position = i
# next position = (i + 1) % N
# previous position = (i + N - 1) % N
class QueueUsingArray
  def initialize(n)
    @n = n
    @array = Array.new(@n) # defining size to implement circular array
    @front = -1
    @rear = -1
  end

  def enqueue(data)
    if isFull?
      puts 'Queue is full. Cannot insert anymore values.'
    elsif isEmpty?
      @front = 0
      @rear = 0
    else
      @rear = (@rear + 1) % @n
    end
    @array[@rear] = data
  end

  def dequeue
    if isEmpty?
      puts 'No element to remove.'
    elsif @front == @rear
      @front = -1
      @rear = -1
    else
      @front = (@front + 1) % @n
    end
  end

  def front
    return @array[@front] unless isEmpty?

    puts 'No element present in the Queue.'
  end

  # can use array.empty?
  def isEmpty?
    return true if @front == -1 && @rear == -1

    false
  end

  def isFull?
    (@rear + 1) % @n == @front
  end

  def printQueue
    if isEmpty?
      puts 'No element present in the Queue.'
    else
      puts 'Queue is:'
      @array[@front..@rear].each do |val|
        puts val
      end
    end
  end
end

class MainClass
  queue = QueueUsingArray.new(10)

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