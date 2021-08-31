class StackUsingArray
  def initialize
    @array = Array.new
    @top = -1
  end

  def push(data)
    @top = @top + 1
    @array[@top] = data
  end

  def pop
    if isEmpty?
      puts 'No element to pop in the Stack.'
      return
    end
    @top = @top - 1
  end

  def top
    @top
  end

  def isEmpty?
    return true if @top == -1

    false
  end

  def print
    if isEmpty?
      puts 'No element to be displayed in the Stack.'
      return
    end

    puts 'Current stack is:'
    @array.each { |element| puts element }
  end

  def checkWithTop(top, char)
    if (char == ']' && top == '[') ||
       (char == ')' && top == '(') ||
       (char == '}' && top == '{')
          true
    end
  end

  def is_balanced?(string)
    return true if string.empty?

    array = string.split('')
    array.each do |char|
      if char == '(' || char == '{' || char == '['
        push(char)
      elsif char == ')' || char == '}' || char == ']'
        if st.isEmpty? && checkWithTop(@array[@top], char)
          pop
        else
          return false
        end
    end

    isEmpty?
  end
end

class MainClass
  stack = StackUsingArray.new

  # stack.push(2)
  # stack.push(10)
  # stack.push(5)
  # stack.print

  # stack.pop
  # stack.push(7)
  # stack.print

  string = '()['
  if stack.is_balanced?(string)
    puts 'Parentheses are balanced.'
  else
    puts 'Parentheses are not balanced.'
  end
end