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

    private

    def add_first_element(value)
      node = Node.new(value)
      @size += 1
      @head = node
      @tail = node
    end
  end
end
