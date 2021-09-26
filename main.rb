class Node
	attr_accessor :value, :next_node

	def initialize(value = nil)
		@value = value
		@next_node = nil
	end
end

class LinkedList
	def initialize
		@head = nil
		@tail = nil
	end

	def append(value)
		node = Node.new(value)
		if @head == nil
			@head = node
		elsif @head != nil && @head.next_node == nil
			@head.next_node = node
			@tail = node
		else
			@tail.next_node = node
			@tail = node
		end
	end
	
	def prepend(value)
		node = Node.new(value)
		if @head == nil
			@head = node
		else
			node.next_node = @head
			@head = node
			if @tail == nil
			starting_point = @head
			until starting_point.next_node == nil
			starting_point = starting_point.next_node
			end
			@tail = starting_point
			end
		end
	end

	def head
		return nil if @head == nil
		return @head
	end
	
	def tail
		return nil if @tail == nil
		return @tail
	end
	
	def size
		if @head == nil
			return 0
		else
			list_size = 1
			start_point = @head
			until start_point.next_node == nil
				list_size += 1
				start_point = start_point.next_node
			end
		return list_size
		end
	end
	
	def at(index)
		if index == 0
			return @head
		else
		starting_point = @head
		index.times do
			if starting_point.next_node != nil
			starting_point = starting_point.next_node
			else
				return nil
			end
			end
		return starting_point
		end
	end
	
	def pop
		if @head == nil
			return nil
		elsif @head.next_node == nil
			popped = @head
			@head = nil
			@tail = nil
			return popped
		else
			start_point = @head
			ending = @head.next_node
			until ending.next_node == nil
				start_point = start_point.next_node
				ending = ending.next_node
			end
			popped = ending
			@tail = start_point
			@tail.next_node = nil
			return popped
			
		end
	end
	
	def contains?(value)
		start_point = @head
		if @head.value == value
			return true
		end
		until start_point == nil
			if start_point.value == value
				return true
			else
				start_point = start_point.next_node
			end
		end
		return false
	end

	def find(value)
		starting_point = @head.next_node
		index = 0
		if @head.value == value
			return index
		end
		until starting_point == nil
			index += 1
			if starting_point.value == value
				return index
			else
				starting_point = starting_point.next_node
			end
		end
		return nil
	end

	def to_s
		output_str = ""
		starting_point = @head
		until starting_point == nil
			value = starting_point.value
			temp_str = "( #{value} ) -> "
			output_str = output_str + temp_str
			starting_point = starting_point.next_node
		end
		return output_str + "nil\n"
	end

end	

list = LinkedList.new

list.prepend("milka")
list.prepend("toblerone")
list.append("willy wonka")
p list.head
p list.tail
print list.to_s
p list.at(2)
p list.find("milka")
p list.contains?("shogetten")
