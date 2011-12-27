require 'spec_helper'
require 'automata/elementary'

describe Automata::Elementary do 
  describe 'rule 110' do
    before do 
      @automaton = Automata::Elementary.new(110)
    end
    
    it 'produces "111110001101110010011" after 20 steps' do 
      @automaton.run(20).to_s.must_equal "11111000110111001001100000000000000000000"
    end
    
    it 'produces a string of steps * 2 + 1 size' do
      @automaton.run(20).to_s.size.must_equal 41
      Automata::Elementary.new(10).run(1).to_s.size.must_equal 3
      Automata::Elementary.new(57).run(100).to_s.size.must_equal 201
    end
  end
  
  describe 'rules' do 
    it 'accepts rules 0-255' do
      256.times do |x|
        Automata::Elementary.new(x).run(5).to_s.size.must_equal 11
      end
    end
  end
end
