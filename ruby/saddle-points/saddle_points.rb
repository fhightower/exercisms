class Matrix
  attr_reader :rows, :columns

  def initialize(matrix_string)
    @rows = matrix_string.lines(chomp: true).map { |row| row.split.map(&:to_i) }

    first, *rest = @rows
    @columns = first.zip(*rest)
  end

  def saddle_points
    possible_saddle_points = @rows.map.with_index { |row, i| [i, find_column_of_maximum_row_value(row)] }
    possible_saddle_points.select do |row_index, column_index|
      @rows[row_index][column_index] == find_minimum_column_value(column_index)
    end
  end

  private

  def find_column_of_maximum_row_value(row)
    # todo: this should return all indexes with the max value
    row.index(row.max)
  end

  def find_minimum_column_value(column_index)
    @columns[column_index].min
  end
end
