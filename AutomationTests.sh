#!/bin/bash

#Script for testing SieveSundaram

function StartTest 
{
    # $1 - max value 
    ruby SieveSundaram.rb $1 > testfile
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

StartTest 1000