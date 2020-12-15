sum = 0; %reset sum
for ii = 1:10
    sum = sum + bigMod(ii,ii,10^10); %sum up each ii^ii after bigMod
    sum = mod(sum,10^10); %let the final result be last 10 digits
end

disp(sum);%show the result

function y = bigMod(target,exp,modNum) %it's a recursive function
    if exp == 0 %when exponential is 0, return 0
        y = 1;
    elseif exp == 1 %when exponential is 1, return the original number
        y = target;
    else 
        y = bigMod(target,floor(exp/2),modNum); %this will be used later
        if mod(exp,2) == 1
            y = mod(y * y * target,modNum); %if exp is an odd number, multiply target ^ floor(exp/2) two time 
        else                                % and multiply target,then mod 10^10. ex:11^11 = 11^5 * 11^5 * 11
            y = mod(y * y,modNum);          %if exp is an odd number, multiply target ^ floor(exp/2) two time 
        end                                 % ex:10^10 = 10^5 * 10^5
    end
end

function y = bigMul(mul1,mul2)
    if mul2 == 0
        y = 0;
    elseif mul2 == 1 
        y = mul1;
    else 
        y = bigMul(target,mu2); 
        if mod(mul2,2) == 1
            y = mod(y + y + mul1,modNum); 
        else                                
            y = mod(y + y,modNum);          
        end                                 
    end
end
        

