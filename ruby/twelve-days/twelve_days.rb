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
      "#{a_series_of(gifts_before(day))}"
    end

    def gifts_before(day)
      gifts.values_at(*days_before(day))
    end

    def days_before(day)
      days = gifts.keys
      limiter = days.index(day)
      days[0..limiter].reverse
    end

    def a_series_of(items)
      *list, last_item = items
      return "#{last_item}." if items.one?

      [*list, "and #{last_item}."].join(', ')
    end
  end
end
