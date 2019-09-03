#!/bin/bash

#Script for testing SundaramsSieve and EratosthenesSieve

function StartTest 
{
    # $1 == 0 - show only FAIL, $1 == 1 - show all results
    while read number
    do
        if [ "$number" != "" ]
        then
            IsPrimeNumber $number
            if [ $? -eq 0 ]
            then
                echo "FAILED:" $number "is non prime number"
            else
                if [ $1 -eq 1 ]
                then
                    echo "PASS:" $number "is prime number"
                fi
            fi
        fi
    done < testfile
    rm -rf testfile
}

function IsPrimeNumber
{
    # $1 - number for check
    for ((i=2; i<$1/2; ++i))
    do
        if [ $(( $1 % $i )) -eq 0 ]
        then
            return 0
        fi
    done
    return 1

}

echo "Sundarams Sieve:"
ruby SundaramsSieve.rb 1000 > testfile
StartTest 1

echo "Eratosthenes Sieve:"
ruby EratosthenesSieve.rb 1000 > testfile
StartTest 1

rm -rf testfile
