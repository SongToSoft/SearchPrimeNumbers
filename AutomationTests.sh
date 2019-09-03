#!/bin/bash

#Script for testing SundaramsSieve and EratosthenesSieve

function StartTest 
{
    while read number
    do
        if [ "$number" != "" ]
        then
            IsPrimeNumber $number
            if [ $? -eq 0 ]
            then
                echo "FAILED:" $number "is non prime number"
            else
                echo "PASS:" $number "is prime number"
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
ruby SundaramsSieve.rb 100 > testfile
StartTest
rm -rf testfile

echo "Eratosthenes Sieve:"
ruby EratosthenesSieve.rb 100 > testfile
StartTest

rm -rf testfile