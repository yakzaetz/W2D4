# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2) 
    i = 1
    while i > 0  
        result = num_1 * i 
        return result if result % num_2 == 0
        i += 1
    end 
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    counter = Hash.new(0)
    fin = str.length-2
    (0..fin).each do |i|
        counter[str[i] + str[i+1]] += 1
    end 
    sorted = counter.sort_by{|k,v| v }
    sorted[-1][0]
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash = {}
        self.each do |k, v|
            new_hash[v] = k 
        end 
        new_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        pairs = self.combination(2).to_a
        pairs.count { |pair| pair.sum == num }
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new{|num1, num2| num1 <=> num2 }
        x = self.length-1
        sorted = false
        while !sorted
            sorted = true
            (0...x).each do |i|
                if prc.(self[i], self[i + 1]) == 1
                  self[i], self[i + 1] = self[i + 1], self[i]
                  sorted = false
                end 
            end  
        end 
        self           
    end
end
