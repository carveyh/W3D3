
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

p exp1(3,0)
p exp1(3,1)
p exp1(3,2)
p exp1(3,3)

def exp2(base, power)
    return 1 if power == 0
    return base if power == 1
    if power.even?
        exp2(base, power / 2) ** 2
    else
        base * exp2(base, (power - 1) / 2 ) ** 2
    end
end

p exp2(3,0)
p exp2(3,1)
p exp2(3,2)
p exp2(3,3)

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

orig_arr = [1,[2],[3,[4]]]

copy_arr = orig_arr.deep_dup

copy_arr[1] << 5

p copy_arr

p orig_arr