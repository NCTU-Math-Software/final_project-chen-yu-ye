format long g
num = 1000;
disp(expSeries(num))
verify(990,1000) %this might take time to run if verified number goes big

function y = expSeries(max)
    sum = 0;
    for ii = 1:max
        sum = sum + bigMod(ii,ii,10^10);
        sum = mod(sum,10^10);
    end
    y = sum;
end

function y = bigMod(target,exp,modNum)
    if exp == 0 
        y = 1;
    elseif exp == 1 
        y = target;
    else 
        y = bigMod(target,floor(exp/2),modNum); 
        if mod(exp,2) == 1
            y = bigMul(bigMul(y,y,modNum) , target,modNum); 
        else                            
            y = bigMul(y,y,modNum);       
        end                                 
    end
end

function y = bigMul(mul1,mul2,modNum)
    if mul2 == 0
        y = 0;
    elseif mul2 == 1 
        y = mul1;
    else 
        y = bigMul(mul1,floor(mul2/2),modNum); 
        if mod(mul2,2) == 1
            y = mod(y + y + mul1,modNum); 
        else                                
            y = mod(y + y,modNum);          
        end                                 
    end
end

function verify(from,to)
    correctness = 1;
    A = (1 - 1 / 2^(to-from+1) )*100;
    for ii = from : to
        if mod(ii,4) == 1 | mod(ii,4) == 2
            if mod(expSeries(ii),2) == 0
                correctness = 0;
                break
            end             
        else
            if mod(expSeries(ii),2) == 1
                correctness = 0;
                break
            end
        end
    end
    if correctness == 0
        warning("the result must be wrong")
    else
        disp("Verification passed.")
        B = ['The possibility that you get a correct result is ',num2str(A,'%.5f'),'%.'];
        disp(B)
    end
end
