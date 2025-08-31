def run_test(func, arg, expected_result)
    return func.call(arg) == expected_result
end