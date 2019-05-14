module FlattenArray
  def self.flatten(array)
    flatten = []
    array.each do |element|
      next if element.nil?

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
