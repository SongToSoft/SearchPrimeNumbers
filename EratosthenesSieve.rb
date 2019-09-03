#!/usr/bin/ruby

class EratosthenesSieve
    def initialize(value)
        @sieve = Array.new(value.to_i, false)
    end

    def Solve
        for i in 2..@sieve.length
            if (!@sieve[i])
                p = 2
                while ((i * p) <= @sieve.length)
                    @sieve[i * p] = true
                    p += 1
                end
            end
        end
    end
    
    def ShowPrimeNumbers
        for i in 2...@sieve.length
            if (!@sieve[i])
                puts i
            end
        end
    end
end

eratosthenesSieve = EratosthenesSieve.new(ARGV[0])
eratosthenesSieve.Solve
eratosthenesSieve.ShowPrimeNumbers