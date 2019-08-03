module CumulativeSong
  class TwelveDays
    GIFTS = {
      first: 'a Partridge in a Pear Tree',
      second: 'two Turtle Doves',
      third: 'three French Hens',
      fourth: 'four Calling Birds',
      fifth: 'five Gold Rings',
      sixth: 'six Geese-a-Laying',
      seventh: 'seven Swans-a-Swimming',
      eighth: 'eight Maids-a-Milking',
      ninth: 'nine Ladies Dancing',
      tenth: 'ten Lords-a-Leaping',
      eleventh: 'eleven Pipers Piping',
      twelfth: 'twelve Drummers Drumming'
    }

    GIVER = 'my true love'

    attr_reader :gifts, :giver

    def initialize(gifts: GIFTS, giver: GIVER)
      @gifts = gifts
      @giver = giver
    end

    def self.song
      new.song
    end

    def song
      list = []
      gifts.map do |day, gift|
        list.unshift(gift)
        verse(day, list)
      end.join("\n\n")
    end

    private

    def verse(day, gifts)
      "On the #{day} day of Christmas #{giver} gave to me: "\
      "#{CumulativeSong::List.new(*gifts)}"
    end
  end

  class List
    attr_reader :list

    def initialize(*list)
      raise ArgumentError, "#{list} must be an Array" unless list.is_a? Array
      @list = list
    end

    def to_s
      all_items.join(', ')
    end

    private

    def all_items
      list[0..-2] << last_item
    end

    def last_item
      case list.size
      when 0 then ''
      when 1 then "#{list[0]}."
      else "and #{list[-1]}."
      end
    end
  end
end
