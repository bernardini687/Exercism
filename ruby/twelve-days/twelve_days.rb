module CumulativeSong
  class TwelveDays
    GIFTS = {
      first: 'a Partridge in a Pear Tree',
      second: 'two Turtle Doves',
      third: 'three French Hens'
    }

    GIVER = 'my true love'

    attr_reader :gifts, :giver

    def initialize(gifts: nil, giver: nil)
      @gifts = gifts || GIFTS
      @giver = giver || GIVER
    end

    def self.song

    end

    def song
      list = []
      song = ''
      gifts.each do |key, value|
        list.unshift value
        verse = "On the #{key} day of Christmas #{giver} gave to me: "
        song = song + verse + CumulativeSong::List.new(list: list).to_s + "/n"
      end
      song
    end
  end

  class List
    attr_reader :list

    def initialize(list: [])
      raise ArgumentError, "#{list} must be an Array" unless list.is_a? Array
      @list = list
    end

    def to_s
      list[0..-2].join(', ') << last_item
    end

    private

    def last_item
      case list.size
      when 0 then ''
      when 1 then "#{list[0]}."
      else ", and #{list[-1]}."
      end
    end
  end
end
