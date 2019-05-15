module FlattenArray
  def self.flatten(array)
    flatten = []
    array.each do |element|
      next if element.nil? || element.size.zero?

      if element.is_a?(Array)
        flatten.concat(flatten(element))
      else
        flatten << element
      end
    end
    flatten
  end
end
