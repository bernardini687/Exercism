module FlattenArray
  def self.flatten(array)
    return array if array.none? { |e| e.is_a?(Array) }

    array.to_s.tr('[]nil,', '').split.map(&:to_i)
  end
end
