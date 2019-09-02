#!/usr/bin/ruby

class SieveSundaram
    def initialize(value)
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
    end

    def ShowPrimeNumbers
        count = -1
        while (count < (@length - 1))
            count += 1
             if (!@sieve[count])
                puts (2 * count + 3)
             end
        end
    end
end

sieveSundaram = SieveSundaram.new(ARGV[0])
sieveSundaram.Solve
sieveSundaram.ShowPrimeNumbers