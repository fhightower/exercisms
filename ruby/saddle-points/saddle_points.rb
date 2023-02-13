class Array
  def indices(val)
    each_index.select { |index| self[index] == val }
  end
end

class Matrix
  attr_reader :rows, :columns

  def initialize(matrix_string)
    @rows = matrix_string.lines(chomp: true).map { |row| row.split.map(&:to_i) }
    @columns = @rows.transpose
  end

  def saddle_points
    row_maxes = @rows.map(&:max)
    col_mins = @columns.map(&:min)
    saddle_coordinates = []

    row_maxes.map.with_index do |row_max, row_index|
      col_mins.indices(row_max).map do |col_index|
        saddle_coordinates.push([row_index, col_index])
      end
    end
    saddle_coordinates
  end
end
