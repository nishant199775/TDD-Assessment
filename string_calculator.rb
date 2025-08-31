require_relative "test"

def add(numbers_string)
    begin
        ans=0
        delimeter=","
        negative_numbers = []
        if numbers_string.start_with?("//")
            match = numbers_string.match(%r{//(.*?)\n(.*)})
            delimeter = match[1]
            modified_numbers = match[2]
            if(delimeter.start_with?("["))
                delimeter_parts = delimeter.scan(/\[(.*?)\]/)
                delimeter_parts.each do |part|
                    modified_numbers = modified_numbers.split(part[0]).join(",")
                end
                delimeter = ","
            end
            numbers_string = modified_numbers
        end
        numbers_string = numbers_string.split("\n").join(delimeter)
        numbers_array = numbers_string.split(delimeter)
        numbers_array.each do |number|
            integer_number = number.to_i
            if integer_number >= 0 
                ans=ans+integer_number if(integer_number<=1000)
            else
                negative_numbers.push(integer_number)
            end
        end
        if(negative_numbers.length>0)
            error =  "negative numbers not allowed #{negative_numbers.join(",")}"
            raise error
        end
        ans
    rescue => e
        return e
    end
end

puts run_test(method(:add), "", 0)
puts run_test(method(:add), "1", 1)
puts run_test(method(:add), "1,5", 6)
puts run_test(method(:add), "1\n2,3", 6)
puts run_test(method(:add), "//;\n1;2", 3)
puts run_test(method(:add), "1,-2,-3", RuntimeError.new("negative numbers not allowed -2,-3"))
puts run_test(method(:add), "1,1001,3", 4)
puts run_test(method(:add), "1,1000,3", 1004)
puts run_test(method(:add), "//[**]\n1**2**3", 6)
puts run_test(method(:add), "//[*][%]\n1*2%3", 6)
puts run_test(method(:add), "//[*][%][#]\n1*2%3#4", 10)
