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
      return add_first_element(value) if size.zero?

      @size += 1
      node = Node.new(value, head)
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

      node_at(index).value
    end

    def pop
      return nil if size.zero?

      return remove_last_element if size == 1

      last = tail
      @tail = node_at(size - 2)
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
      case index
      when size then append(value)
      when 0 then prepend(value)
      when (0...size)
        current = node_at(index - 1)
        node = Node.new(value, current.next_node)
        @size += 1
        current.next_node = node
      else raise IndexError
      end
    end

    def remove_at(index)
      return if size.zero?

      case index
      when 0 then @head = head.next_node
                  @size -= 1
      when size - 1 then pop
      when (0...size) then remove_at_index(index)
      else raise IndexError
      end
    end

    private

    def add_first_element(value)
      node = Node.new(value)
      @size += 1
      @head = node
      @tail = node
    end

    def remove_last_element
      last = tail
      @head = nil
      @tail = nil
      @size = 0
      last
    end

    def remove_at_index(index)
      return remove_last_element if size == 1

      current = node_at(index - 1)
      current.next_node = current.next_node.next_node
      @size -= 1
    end

    def node_at(index)
      node = head
      index.times { node = node.next_node }
      node
    end
  end
end
