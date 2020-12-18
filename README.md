# final_project-chen-yu-ye
final_project-chen-yu-ye created by GitHub Classroom

[explaining of the recursive function bigMod]

if exp(exponential) is 0 bigMod(base,0,modNum) = 1
ex:13^0 = 1

if exp is 1 then bigMod(base,1,modNum) = base
ex:13^1 = 13

if exp is an odd number, multiply base ^ floor(exp/2) two time and multiply base will equal to origin number
ex:13^13 = 13^6 * 13^6 * 13 

if exp is an even number, multiply base ^ floor(exp/2) two time will equal to origin number
ex:13^6 = 13^3 * 100^3

the following is an example of simulating mod(13^13,10^10) by bigMod method:

bigMod(13,13,10^10) = mod(bigMod(13,6,10^10) * bigMod(13,6,10^10) , 10^10)

bigMod(13,6,10^10) = mod(bigMod(13,3,10^10) * bigMod(13,3,10^10) , 10^10)

bigMod(13,3,10^10) = mod(bigMod(13,1,10^10) * bigMod(13,1,10^10) * 13 , 10^10)

bigMod(13,1,10^10) = 13 


the goal of this program is to calculate summation of ii^ii ,and the range of ii is 1 to 1000
so we mod summation after plusing each ii^ii in preventing of exceeding the integer range the computer can store.



[explaining of the recursive function bigMul]

the concept of bigMul is same as bigMod



[why we need the function bigMul?]

since in bigMod, when two number multiple each other, the result might be wrong since it exceeds the range ex: y * y > 10^19 might happen in bigMod without bigMul
[example]

when we calculate 10000001^2, we get 100000020000001 which is obviously right,but when calculate 100000001^2, we get 10000000200000000 which is obviously wrong
since we have bigMul, in the process of this program, there is no number exceeds 2 * 10^10 ,and each step can be calculated precisely 



[correctness checking]

in this program, we can check 1^1+2^2...+10^10 % 10^10 has the same result as normal compute way
and 1^1+2^2...+15^15 has different result compared to the program that don't use bigMul
previous one has result of 4130199828 ,and the next one has the result of 4130199845,which is impossible since the last digit must be even
and verified by using c++, the result is also 4130199828



[explaining of the function verification]

this function can verify if the result meets the expectation in certain situation
concept:
1^1 is odd, 1^1 + 2^2 is odd, 1^1 + 2^2 + 3^3 is even,  1^1 + 2^2 + 3^3 + 4^4 is even.. odd,odd,even,even,odd,odd
that is , result is odd when we add up to the number module 4 = 1 or 2, even otherwhise
it also greatly adds up the probability of correctness of the program
