class Game
  def initialize
    @rolls = Array.new(21) { 0 }
    @current_roll = -1
  end

  def roll(pins)
    @rolls[@current_roll += 1] = pins
  end

  def score
    score = 0
    i = 0
    10.times do
      if is_strike?(i)
        score += 10 + strike_bonus(i)
        i += 1
      elsif is_spare?(i)
        score += 10 + spare_bonus(i)
        i += 2
      else
        score += sum_of_balls_in_frame(i)
        i += 2
      end
    end
    score
  end

  private

  def sum_of_balls_in_frame(i)
    @rolls[i] + @rolls[i + 1]
  end

  def strike_bonus(i)
    @rolls[i + 1] + @rolls[i + 2]
  end

  def spare_bonus(i)
    @rolls[i + 2]
  end

  def is_spare?(i)
    @rolls[i] + @rolls[i + 1] == 10
  end

  def is_strike?(i)
    @rolls[i] == 10
  end
end