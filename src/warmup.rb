def fib(n)
    return [] if n == 0
    return [0] if n == 1

    seq = [0, 1]
    while seq.length < n
    seq << seq[-1] + seq[-2]
    end
    seq
end

def isPalindrome(n)
    s = n.to_s
    s == s.reverse
end

def nthmax(n, a)
    uniq_sorted_desc = a.uniq.sort.reverse
    uniq_sorted_desc[n]
end

def freq(s)
   return "" if s.empty?

    counts = Hash.new(0)
    s.each_char { |ch| counts[ch] += 1 }
    counts.max_by { |(ch, count)| count }[0]
end

def zipHash(arr1, arr2)
    return nil unless arr1.length == arr2.length
    arr1.zip(arr2).to_h
end

def hashToArray(hash)
    hash.map { |k, v| [k, v] }
end
