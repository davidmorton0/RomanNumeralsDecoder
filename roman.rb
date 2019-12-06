require "test/unit/assertions"
include Test::Unit::Assertions

def solution(roman)
	total = 0
	counter = 0
	num_vals = {'I' => 1, 'V' => 5,'X' => 10,'L' => 50,'C' => 100,'D' => 500,'M' => 1000}
  	dec = roman.chars.map { |c| num_vals.fetch(c) }
  	dec.each_with_index { |num, i|
  		if i == 0 or dec[i - 1] == dec[i]
  			counter += dec[i]
  		elsif dec[i - 1] > dec[i]
  			total += counter
  			counter = dec[i]
  		else
  			total += dec[i] - counter
  			counter = 0
  		end
  	}
  	total += counter
end

assert_equal(solution('XXI'), 21)
assert_equal(solution('I'), 1)
assert_equal(solution('IV'), 4)
assert_equal(solution('MMVIII'), 2008)
assert_equal(solution('MDCLXVI'), 1666)
