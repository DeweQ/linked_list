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
      node = Node.new(value)
      @size += 1
      if @size == 1
        @head = node
        @tail = node
        return
      end
      @tail.next_node = node
      @tail = node
    end

    def prepend(value)
      if @size.zero?
        append(value)
        return
      end
      @size += 1
      node = Node.new(value, @head)
      @head = node
    end
  end
end
