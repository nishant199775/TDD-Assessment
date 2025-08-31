def run_test(func, arg, expected_result)
    if(func.call(arg).class == RuntimeError && expected_result.class == RuntimeError)
        return func.call(arg).message == expected_result.message
    else 
        return func.call(arg) == expected_result
    end
end