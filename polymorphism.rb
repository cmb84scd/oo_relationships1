class ScrambledDiary
  def initialize(contents)
    @contents = contents
  end

  def read
    @contents
  end

  def scramble(scrambler)
    @contents = scrambler.scramble(@contents)
  end
end

class ScrambleAdvanceChars
  def initialize(steps)
    @steps = steps
  end

  def scramble(contents)
    plain_chars = contents.chars
    scrambled_chars = plain_chars.map do |char|
      (char.ord + @steps).chr
    end
    contents = scrambled_chars.join
  end
end

class UnscrambleAdvanceChars
  def initialize(steps)
    @steps = steps
  end

  def scramble(contents)
    scrambled_chars = contents.chars
    plain_chars = scrambled_chars.map do |char|
      (char.ord - @steps).chr
    end
    contents = plain_chars.join
  end
end

class ScrambleReverse
  def scramble(contents)
    contents = contents.reverse
  end
end

class UnscrambleReverse
  def scramble(contents)
    contents = contents.reverse
  end
end
