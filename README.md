# final_project-chen-yu-ye
final_project-chen-yu-ye created by GitHub Classroom
***
# Main purpose of the program

Find the last 10 digit of $1^1 + 2^2 + 3^3... + 1000^1000$.
***
# Main concept of the program

Add each ii^ii module 10^10 from 1 to 1000.
***
# The recursive function "bigMod"

## Remark

if a = b*c, then mod(a,10^10) = mod(b,10^10) * mod(c,10^10)

## Concept

If exp(exponential) is 0 ,return 1

> EX:13^0 = 1

If exp is 1 ,return base

> EX:13^1 = 13

If exp is an odd number, return base ^ floor(exp/2) ^ 2 * base.

> EX:13^13 = 13^6 * 13^6 * 13 

If exp is an even number, return base ^ floor(exp/2) ^ 2.

> EX:13^6 = 13^3 * 100^3

## Example

```
bigMod(13,13,10^10) = mod(bigMod(13,6,10^10) * bigMod(13,6,10^10) , 10^10)

bigMod(13,6,10^10) = mod(bigMod(13,3,10^10) * bigMod(13,3,10^10) , 10^10)

bigMod(13,3,10^10) = mod(bigMod(13,1,10^10) * bigMod(13,1,10^10) * 13 , 10^10)

bigMod(13,1,10^10) = 13 
```

## Why we need the function "bigMod"?

Since if you derectly do mod(1000^1000,10^10), you will get a wrong result caused by exceeding range of an integer can be stored. 

***

# The recursive function "bigMul"

## Concept

The concept of bigMul is same as bigMod.

## Remark

if a = b+c, then mod(a,10^10) = mod(b,10^10) + mod(c,10^10)

## Why we need the function "bigMul"?

Since in bigMod, when two number multiple each other, the result might be too big for computer can handle.

When we calculate 10000001^2, we get 100000020000001 which is obviously right,but when calculate 100000001^2, we get 10000000200000000 which is obviously wrong.

Since we have "bigMul", in the process of this program, there is no number exceeds 2 * 10^10 ,and each step can be calculated precisely .

***
# Correctness checking of small numbers

In this program, we can check that 1^1+2^2...+10^10 % 10^10 has the same result by derectly computing
,but 1^1+2^2...+15^15 has different result compared to the program that don't use bigMul.

Previous one has result of 4130199828 ,and the other one has the result of 4130199845, which is impossible since the last digit must be even.

Verified by using c++, the result is also 4130199828.

***
# Explaining of the function "verification"

This function can verify if the result meets the expectation in certain situation
(User can choose the verified range.)

## Concept
1^1 is odd, 1^1 + 2^2 is odd, 1^1 + 2^2 + 3^3 is even,  1^1 + 2^2 + 3^3 + 4^4 is even.. odd,odd,even,even,odd,odd.
That is , the result is odd when we add up to the number module 4 = 1 or 2, even otherwhise.

## Remark
By assuming the program has a wrong result, then the result has a probability be an even number of 1/2,so does an odd number.
If the chosen range has n numbers. the possibility that wrong results can pass the verification is 1/2^n, when n goes big, the prosibility goes 0.

