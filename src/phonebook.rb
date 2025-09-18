class PhoneBook
    require 'set'
    def initialize
        @entries = {}
        @listed_numbers = Set.new
        @listed_lookup = {}
    end

    def add(name, number, is_listed)
        return false if @entries.key?(name)
        return false unless number.is_a?(String) && number.match?(/^\d{3}-\d{3}-\d{4}$/)
        
        if is_listed && @listed_numbers.include?(number)
        return false
        end
        @entries[name] = { number: number, listed: !!is_listed }

        if is_listed
        @listed_numbers.add(number)
        @listed_lookup[number] = name
        end
        true
    end

    def lookup(name)
        entry = @entries[name]
        return nil unless entry && entry[:listed]
        entry[:number]
    end

    def lookupByNum(number)
        @listed_lookup[num]
    end

    def namesByAc(areacode)
        prefix = areacode + "-"
        @entries.each_with_object([]) do |(name, entry), acc|
        acc << name if entry[:number].start_with?(prefix)
        end
    end
end
