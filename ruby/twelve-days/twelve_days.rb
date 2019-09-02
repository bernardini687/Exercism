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
    }.freeze

    GIVER = 'my true love'.freeze

    attr_reader :gifts, :giver

    def initialize(gifts: GIFTS, giver: GIVER)
      @gifts = gifts
      @giver = giver
    end

    def self.song
      new.song
    end

    def song
      gifts.each_key.map do |day|
        verse(day)
      end.join("\n\n")
    end

    private

    def verse(day)
      "On the #{day} day of Christmas #{giver} gave to me: "\
      "#{CumulativeSong::List.new(*gifts_before(day))}"
    end

    def gifts_before(day)
      gifts.values_at(*days_before(day))
    end

    def days_before(day)
      days = gifts.keys
      limiter = days.index(day)
      days[0..limiter].reverse
    end
  end

  class List
    attr_reader :list

    def initialize(*list)
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
      *, item = list
      list.size == 1 ? "#{item}." : "and #{item}."
    end
  end
end
