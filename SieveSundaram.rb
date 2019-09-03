#!/usr/bin/ruby

class SieveSundaram
    def initialize(value)
        @primeNumbers = []
        @limit = value.to_i
        if ((@limit % 2) == 0)
            @limit -= 1
        end
        @length = (@limit / 2).to_i
        @sieve = Array.new(@length, false)
    end

    def Solve()
        iMax = ((Math.sqrt(@limit)).to_i - 1) / 2;
        for i in 1..iMax
            jMax = (@length - i) / (2 * i + 1);
            for j in i..jMax
                @sieve[2 * i * j + i + j - 1] = true
            end
        end
        self.GetPrimeNumbersList
    end

    def GetPrimeNumbersList
        count = -1
        while (count < (@length - 1))
            count += 1
             if (!@sieve[count])
                @primeNumbers.insert(-1, 2 * count + 3)
             end
        end
        return @primeNumbers
    end

    def ShowPrimeNumbers
        for i in 0..@primeNumbers.length
            puts @primeNumbers[i]
        end
    end

end

sieveSundaram = SieveSundaram.new(ARGV[0])
sieveSundaram.Solve
sieveSundaram.ShowPrimeNumbers