
#WARMUP
def rec_range(start_num, end_num)
    return [] if end_num <= start_num
    rec_range(start_num, end_num - 1) + [end_num - 1]
end

# p rec_range(5,7)

def iter_range(start_num, end_num)
    range = []
    (start_num...end_num).each do |i|
        range << i
    end
    range
end

# p iter_range(5,7)

#EXPONENTIATION

def exp1(base, power)
    return 1 if power == 0
    base * exp1(base, power - 1)
end

# p exp1(3,0)
# p exp1(3,1)
# p exp1(3,2)
# p exp1(3,3)

def exp2(base, power)
    return 1 if power == 0
    return base if power == 1
    if power.even?
        exp2(base, power / 2) ** 2
    else
        base * exp2(base, (power - 1) / 2 ) ** 2
    end
end

# p exp2(3,0)
# p exp2(3,1)
# p exp2(3,2)
# p exp2(3,3)

class Array
    def deep_dup
        self.map do |ele|
            if !ele.is_a?(Array)
                ele
            else
                ele.deep_dup
            end
        end
    end
end

# orig_arr = [1,[2],[3,[4]]]

# copy_arr = orig_arr.deep_dup

# copy_arr[1] << 5

# p copy_arr

# p orig_arr

def rec_fib(n)
    return [0] if n == 1
    return [0,1] if n == 2

    last_fibs = rec_fib(n-1)

    last_fibs << last_fibs[-1] + last_fibs[-2]
end

# p rec_fib(1)
# p rec_fib(2)
# p rec_fib(3)
# p rec_fib(6)
# p rec_fib(10)

def iter_fib(n)
    seq = [0, 1]

    while seq.length < n 
        seq << seq[-1] + seq[-2]
    end

    seq[0...n]  

end

# p iter_fib(1)
# p iter_fib(2)
# p iter_fib(3)
# p iter_fib(6)
# p iter_fib(10)

#Possible refactor with <=> ?
def bsearch(arr, target)
    return nil if arr.empty?
    mid_idx = arr.length / 2
    return mid_idx if arr[mid_idx] == target
    left = arr[0...mid_idx]
    right = arr[(mid_idx + 1)..-1]
    if target < arr[mid_idx]
        bsearch(left, target)
    # elsif target > arr[mid_idx] && !right.empty?
    #     mid_idx + 1 + bsearch(right, target)
    # else
    #     nil
    else
        right_search = bsearch(right, target)
        return nil if right_search == nil
        mid_idx + 1 + right_search
    end
end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil