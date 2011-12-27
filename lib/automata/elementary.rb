require 'enumerator'

module Automata
  class Elementary
    # This elegantly simple algorithm and code is from Jesse Merriman written for
    #   Ruby Quiz 134: Cellular Automata. see: http://www.rubyquiz.com/quiz134.html
    def self.transformer(rule_num)
      rule = rule_num.to_s 2
      rule = ('0' * (2**3 - rule.length) + rule).reverse.split(//)
      lambda { |hood| rule[hood.join.to_i(2)] }
    end

    def self.step(state, trans)
      new_state = []
      ([0,0] + state + [0,0]).each_cons(3) do |hood|
        new_state << trans[hood]
      end
      new_state
    end
  
    attr_reader :rule, :steps, :state
    def initialize(rule, state = ['1'])
      @rule, @state = rule, state
    end
    
    def run(steps)
      trans = Elementary.transformer(@rule)
      steps.times do |s|
        @state = Elementary.step(@state, trans)
      end
      self
    end
    
    def to_s
      @state.join('')
    end
  end
end



