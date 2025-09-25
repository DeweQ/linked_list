require_relative "node"

module DataStructure
  # Linked list structure
  class LinkedList
    attr_reader :head, :tail, :size

    def initialize
      @head = nil
      @tail = nil
      @size = 0
    end

    def append(value)
      return add_first_element(value) if size.zero?

      @size += 1
      node = Node.new(value)
      @tail.next_node = node
      @tail = node
    end

    def prepend(value)
      return add_first_element(value) if @size.zero?

      @size += 1
      node = Node.new(value, @head)
      @head = node
    end

    def to_s
      result = ""
      node = head
      loop do
        result << (node.nil? ? "nil" : node.to_s).to_s
        break if node.nil?

        result << " -> "
        node = node.next_node
      end
      result
    end

    def at(index)
      return nil unless index.between?(0, size - 1)

      current = @head
      (0...index).each do
        current = current.next_node
      end
      current
    end

    def pop
      return nil if @size.zero?

      return remove_last_element if size == 1

      last = @tail
      new_tail = at(@size - 2)
      @tail = new_tail
      @tail.next_node = nil
      @size -= 1
      last
    end

    def contains?(value)
      current = @head
      until current.nil?
        return true if current.value == value

        current = current.next_node
      end
      false
    end

    def find(value)
      return nil unless contains?(value)

      current = @head
      (0...@size).each do |i|
        return i if current.value == value

        current = current.next_node
      end
    end

    def insert_at(value, index)
      raise IndexError unless index.between?(0, size - 1)

      return prepend(value) if index.zero?

      return append(value) if index == size

      current = head
      (index - 1).times { current = current.next_node }
      node = Node.new(value, current.next_node)
      @size += 1
      current.next_node = node
    end

    private

    def add_first_element(value)
      node = Node.new(value)
      @size += 1
      @head = node
      @tail = node
    end

    def remove_last_element
      last = @tail
      @head = nil
      @tail = nil
      @size = 0
      last
    end
  end
end
