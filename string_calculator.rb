require_relative "test"

def add(numbers_string)
    ans = 0
    delimeter=","
    if numbers_string.start_with?("//")
        match = numbers_string.match(%r{//(.*?)\n(.*)})
        delimeter = match[1]
        numbers_string = match[2]
    end
    numbers_string = numbers_string.split("\n").join(delimeter)
    numbers_array = numbers_string.split(delimeter)
    numbers_array.each do |number|
        ans=ans+number.to_i
    end
    ans
end

puts run_test(method(:add), "", 0)
puts run_test(method(:add), "1", 1)
puts run_test(method(:add), "1,5", 6)
puts run_test(method(:add),"1\n2,3", 6)
puts run_test(method(:add),"//;\n1;2", 3)
