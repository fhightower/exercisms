class ETL
  def self.transform(old_data)
    old_data.each_with_object({}) { |(score, letters), new_data| letters.each { |letter| new_data[letter.downcase] = score } }
  end
end
