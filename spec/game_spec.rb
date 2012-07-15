require 'spec_helper'

describe Game do
  before do 
    @g = Game.new
  end

  def roll_number(n, pins)
    n.times { @g.roll(pins) }
  end

  def roll_spare
    @g.roll(5)
    @g.roll(5)
  end

  def roll_strike
    @g.roll(10)
  end

  it "gutter game" do
    roll_number(20, 0)
    @g.score.should == 0
  end

  it "all ones" do
    roll_number(20, 1)
    @g.score.should == 20
  end

  it "has one spare" do
    roll_spare
    @g.roll(3)
    roll_number(17,0);
    @g.score.should == 16
  end

  it "counts a strike" do
    roll_strike
    @g.roll(3)
    @g.roll(4)
    roll_number(16,0);
    @g.score.should == 24
  end

  it "rolls perfect game" do
    roll_number(20, 10);
    @g.score.should == 300
  end
end