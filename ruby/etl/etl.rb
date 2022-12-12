class ETL
  def self.transform(old_data)
    new_data = {}
    old_data.map do | score, letters |
      letters.map { |letter| new_data[letter.downcase] = score }
    end
    new_data
  end
end
