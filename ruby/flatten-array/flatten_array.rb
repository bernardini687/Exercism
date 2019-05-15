module FlattenArray
  def self.flatten(array)
    flatten = []
    array.each do |element|
      next if element.nil? || element.size.zero?

      if element.is_a?(Array)
        flatten.concat(flatten(element))
        # flatten(element).each { |e| flatten << e }
      else
        flatten << element
      end
    end
    flatten
  end
end

p FlattenArray.flatten([0, 2, [[2, 3], 8, [[100]], nil, [[nil]]], -2])
