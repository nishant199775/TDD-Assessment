require_relative "test"

def add(numbers_string)
    ans = 0
    numbers_string = numbers_string.split("\n").join(",")
    numbers_array = numbers_string.split(",")
    numbers_array.each do |number|
        ans=ans+number.to_i
    end
    ans
end

puts run_test(method(:add), "", 0)
puts run_test(method(:add), "1", 1)
puts run_test(method(:add), "1,5", 6)
puts run_test(method(:add),"1\n2,3", 6)