# final_project-chen-yu-ye
final_project-chen-yu-ye created by GitHub Classroom

the following is explaining of the recursive function bigMod

if exp is 0 then return 1
ex:100^0 = 1

if exp is 1 then return target
ex:100^1 = 100

if exp is an odd number, multiply target ^ floor(exp/2) two time and multiply target,then mod 10^10. 
ex:111^111 = 111^55 * 111^55 * 11

if exp is an odd number, multiply target ^ floor(exp/2) two time 
ex:100^100 = 100^50 * 100^50

simulate mod(13^13,10^10) by bigMod method:
bigMod(13,13,10^10) = mod(bigMod(13,6,10^10) * bigMod(13,6,10^10) , 10^10)
the computer does neither compute 13^13 nor 10^10 in this proccess
bigMod(13,6,10^10) = mod(bigMod(13,3,10^10) * bigMod(13,3,10^10) , 10^10)
bigMod(13,3,10^10) = mod(bigMod(13,1,10^10) * bigMod(13,1,10^10) * 13 , 10^10)
bigMod(13,1,10^10) = 13 and it takes only 4 step
while if you calculate 13^13 mod 10^10,13^13 can't be stored by the computer

the target is to calculate summation of ii^ii and range of ii is  1 to 1000
we can mod each ii^ii by using bigMod and sum up each result
,and we mod summation after puls each ii^ii after moduled in preventing of exceeding the integer range the computer can store.

(*)note that bigMod only takes at most min{n|ii < 2^n} steps for each ii^ii 
,so 1000^1000 on only takes at most 10 steps in bigMod

bigMod(1000,1000,10^10) = mod(bigMod(1000,500,10^10) * bigMod(1000,500,10^10) , 10^10) 
bigMod(1000,500,10^10) = mod(bigMod(1000,250,10^10) * bigMod(1000,250,10^10) , 10^10)
bigMod(1000,250,10^10) = mod(bigMod(1000,125,10^10) * bigMod(1000,125,10^10) , 10^10)
bigMod(1000,125,10^10) = mod(bigMod(1000,62,10^10) * bigMod(1000,62,10^10) * 1000 , 10^10)
bigMod(1000,62,10^10) = mod(bigMod(1000,31,10^10) * bigMod(1000,31,10^10) , 10^10)
bigMod(1000,31,10^10) = mod(bigMod(1000,15,10^10) * bigMod(1000,15,10^10) * 1000 , 10^10)
bigMod(1000,15,10^10) = mod(bigMod(1000,7,10^10) * bigMod(1000,7,10^10) * 1000 , 10^10)
bigMod(1000,7,10^10) = mod(bigMod(1000,3,10^10) * bigMod(1000,3,10^10) * 1000 , 10^10)
bigMod(1000,3,10^10) = mod(bigMod(1000,1,10^10) * bigMod(1000,1,10^10) * 1000 , 10^10)
bigMod(1000,1,10^10) = 1000

the concept of bigMul is same as bigMod
since when two number multiple each other, the result might be wrong since it exceeds the range ex: y * y > 10^19 might happen in bigMod without bigMul
since we have bigMul, in the process of this program, there is no number exceeds 2 * 10^10  

in this program, we can check 1^1+2^2...+10^10 % 10^10 has the same result as normal compute way
and 1^1+2^2...+15^15 has different result compared to the program don't use bigMul0.If we use c++ to calculate, the result is same as the one has bigMul
as long as there is no other problem, the final result should be right
