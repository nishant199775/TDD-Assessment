require_relative "test"

def add(numbersString)
    ans = 0
    numbersArray = numbersString.split(",")
    numbersArray.each do |number|
        ans=ans+number.to_i
    end
    ans
end

puts run_test(method(:add), "", 0)
puts run_test(method(:add), "1", 1)
puts run_test(method(:add), "1,5", 6)