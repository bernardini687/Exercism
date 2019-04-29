module TwoFer
  def self.two_fer(name = 'you')
    "One for #{name}, one for me."
    # format('One for %<name>s, one for me.', name: name)
    # 'One for %s, one for me.' % name
  end
end
