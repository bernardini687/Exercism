module FlattenArray
  def self.flatten(array)
    flatten = []
    array.each do |element|
      next if element.nil?

      if element.is_a?(Array)
        self.flatten(element).map { |e| flatten << e }
      else
        flatten << element
      end
    end
    flatten
  end
end

p FlattenArray.flatten [2, nil, 43, [34, 12], 90, nil, [nil, [422, 32], 47, '43']]
