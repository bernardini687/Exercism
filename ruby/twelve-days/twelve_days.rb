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
  end

  class List
    def initialize(list: [])
      raise ArgumentError, "#{list} must be an Array" unless list.is_a? Array
      @list = list
    end
  end
end
