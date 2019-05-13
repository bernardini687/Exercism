require 'pry'

module FlattenArray
  def self.flatten(array)
    flatten = []
    array.each do |element|
      if element.is_a?(Array)
        self.flatten(element).map { |e| flatten << e }
      elsif element
        flatten << element
      else
        next
      end
    end
    flatten
  end
end

p FlattenArray.flatten [2, nil, 43, [34, 12], 90, nil, [nil, [422, 32], 47, '43']]
