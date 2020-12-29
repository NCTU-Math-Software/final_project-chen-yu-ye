# final_project- Sum of mod
final_project-Sum of mod created by GitHub Classroom
***
# About the program

## Purpose

Find the last 10 digit of 1^1 + 2^2 + 3^3... + 1000^1000.

## Concept

Add each ii^ii mod 10^10 ,which the range of ii is from 1 to 1000.

## How to use the program

The user can choose the final number the sequence adds up to by modifing the varible "num".

The user can choose verification range by modifing first virable and second virable of the function "verify".

The user can use the program by clicking the run button(F5).

## Example
When num = 1000,and the verification range is from 990 to 1000.
The following is the output.
```
The answer is 9110846700
 
Verification passed.
The possibility that you get a correct result is 98.76543%.
```
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

The final result is 5106592253.
```

## Why we need the function "bigMod"?

If you derectly do mod(1000^1000,10^10), you will get a wrong result caused by exceeding range of an integer can be stored. 

***

# The recursive function "bigMul"

## Concept

The concept of bigMul is same as bigMod.

## Remark

if a = b+c, then mod(a,10^10) = mod(b,10^10) + mod(c,10^10)

## Why we need the function "bigMul"?

In bigMod, when two number multiply each other, the result might be too big for computer can handle.

When we calculate 10000001^2, we get 100000020000001 which is obviously right,but when calculate 100000001^2, we get 10000000200000000 which is obviously wrong.

Since we have "bigMul", in the process of this program, there is no number exceeds 2 * 10^10 ,and each step can be calculated precisely .

***
# Correctness checking for small numbers

In this program, we can check that 1^1+2^2...+10^10 % 10^10 has the same result by derectly computing
,but 1^1+2^2...+15^15 has different result compared to the program that don't use bigMul.

Previous one has result of 4130199828 ,and the other one has the result of 4130199845, which is impossible since the last digit must be even.

Verified by using c++, the result is also 4130199828.

***
# The additional function "verify"

## purpose
This function can verify if the result meets the expectation in certain situation
(The user can choose the verified range.)

## Concept
1^1 is an odd number, 1^1 + 2^2 is an odd number, 1^1 + 2^2 + 3^3 is an even number,  1^1 + 2^2 + 3^3 + 4^4 is an even number, odd number,odd number ,even number,even number...
That is , the result is odd when we add up to the number mod 4 = 1 or 2, even otherwhise.

## Remark
Assuming the program has a wrong result in certain number of summing up, then the result has the same probability be an even number or an odd number,which is 1/2.
If the chosen verified range has n numbers. the possibility that wrong results can pass the verification is 1/2^n, when n goes big, the prosibility goes 0.

