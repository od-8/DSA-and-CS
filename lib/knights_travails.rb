def legal_moves(cords)
  x = cords[0]
  y = cords[1]
  possible_moves = []

  # All the possible moves above where the night is currently
  possible_moves << [x + 1, y + 2] if (x + 1).between?(0, 7) && (y + 2).between?(0, 7)
  possible_moves << [x - 1, y + 2] if (x - 1).between?(0, 7) && (y + 2).between?(0, 7)

  # All the possible moves below where the knight is currently
  possible_moves << [x + 1, y - 2] if (x + 1).between?(0, 7) && (y - 2).between?(0, 7)
  possible_moves << [x - 1, y - 2] if (x - 1).between?(0, 7) && (y - 2).between?(0, 7)

  # All the possible moves to the left of where the knight is currently
  possible_moves << [x - 2, y - 1] if (x - 2).between?(0, 7) && (y - 1).between?(0, 7)
  possible_moves << [x - 2, y + 1] if (x - 2).between?(0, 7) && (y + 1).between?(0, 7)

  # All the possible moves to the right of where the knight is currently
  possible_moves << [x + 2, y - 1] if (x + 2).between?(0, 7) && (y - 1).between?(0, 7)
  possible_moves << [x + 2, y + 1] if (x + 2).between?(0, 7) && (y + 1).between?(0, 7)

  possible_moves.shuffle
end

def knight_moves(start_cords, end_cords)
  # Base case if both inputs are equal
  if start_cords == end_cords
    return start_cords
  end

  queue = [[start_cords]]

  visited = []
  num_moves_to_finish = 0

  # breadth first search
  until queue.empty?
    current_path = queue.shift # The first path in the queue
    current_position = current_path.last # The last array in the first path of the queue

    next if visited.include?(current_position) # If it has been visited skips to next iteration

    visited << current_position

    # End condition, print out all cordinates once night reaches desired position
    if current_position == end_cords
      puts "You made it in #{current_path.length - 1} moves! Here's your path:"
      current_path.each do |arr|
        p arr
        num_moves_to_finish += 1
      end
    end

    # Ddd all legal moves to the queue
    legal_moves(current_position).each do |arr|
      queue << (current_path + [arr])
    end 
  end
end

# Credit to the answer by j_ho from the community solutions section
# I was lost on this one and I used his code to help me solve and understand it

puts knight_moves([3,1],[7,7])
