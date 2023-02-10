class Matrix
  attr_reader :rows, :columns

  def initialize(matrix_string)
    @rows = matrix_string.lines(chomp: true).map { |row| row.split.map(&:to_i) }

    first, *rest = @rows
    @columns = first.zip(*rest)
  end

  def saddle_points
    possible_saddle_coordinates = @rows.map.with_index { |row, i| find_possible_saddle_coordinates(row, i) }.flatten(1)
    possible_saddle_coordinates.select { |coordinates| saddle_point?(coordinates) }
  end

  private

  def find_possible_saddle_coordinates(row, row_index)
    max = row.max
    row.map.with_index { |integer, column_index| integer == max ? [row_index, column_index] : nil }.compact
  end

  def saddle_point?(coordinates)
    @columns[coordinates[1]].min == @rows[coordinates[0]][coordinates[1]]
  end
end
