# final_project-chen-yu-ye
final_project-chen-yu-ye created by GitHub Classroom
#Main purpose of program
***
# Explaining of the recursive function "bigMod"

If exp(exponential) is 0 ,we have bigMod(base,0,modNum) = 1

ex:13^0 = 1

If exp is 1 ,we have bigMod(base,1,modNum) = base

ex:13^1 = 13

If exp is an odd number, multiply base ^ floor(exp/2) two time and multiply base will equal to origin number.

ex:13^13 = 13^6 * 13^6 * 13 

If exp is an even number, multiply base ^ floor(exp/2) two time will equal to origin number.

ex:13^6 = 13^3 * 100^3

The following is an example of simulating mod(13^13,10^10) by "bigMod" function:

bigMod(13,13,10^10) = mod(bigMod(13,6,10^10) * bigMod(13,6,10^10) , 10^10)

bigMod(13,6,10^10) = mod(bigMod(13,3,10^10) * bigMod(13,3,10^10) , 10^10)

bigMod(13,3,10^10) = mod(bigMod(13,1,10^10) * bigMod(13,1,10^10) * 13 , 10^10)

bigMod(13,1,10^10) = 13 


The goal of this program is to calculate summation of ii^ii ,which is in range of 1 to 1000.
We mod summation after plusing each ii^ii in preventing of exceeding the integer range the computer can store.
***

# Explaining of the recursive function "bigMul"

The concept of bigMul is same as bigMod.

***
# Why we need the function "bigMul"?

Since in bigMod, when two number multiple each other, the result might be wrong since it exceeds the range. 

## Example

When we calculate 10000001^2, we get 100000020000001 which is obviously right,but when calculate 100000001^2, we get 10000000200000000 which is obviously wrong.

Since we have bigMul, in the process of this program, there is no number exceeds 2 * 10^10 ,and each step can be calculated precisely .

***
# Correctness checking

In this program, we can check that 1^1+2^2...+10^10 % 10^10 has the same result by derectly computing
,but 1^1+2^2...+15^15 has different result compared to the program that don't use bigMul.
Previous one has result of 4130199828 ,and the next one has the result of 4130199845,which is impossible since the last digit must be even.
Verified by using c++, the result is also 4130199828.

***
# Explaining of the function "verification"

This function can verify if the result meets the expectation in certain situation
(User can choose the verified range.)

## Concept
1^1 is odd, 1^1 + 2^2 is odd, 1^1 + 2^2 + 3^3 is even,  1^1 + 2^2 + 3^3 + 4^4 is even.. odd,odd,even,even,odd,odd.
That is , the result is odd when we add up to the number module 4 = 1 or 2, even otherwhise.

(By assuming the program has a wrong result, then the result has a probability be an even number of 1/2,so does an odd number.
If the chosen range has n numbers. the possibility of wrong result can pass the verification is 1/2^n, when n goes big, the prosibility goes 0)


