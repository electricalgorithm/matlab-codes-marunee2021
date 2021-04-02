function outputSignal = echo_gen(signal, framerate, delaytime, amplitude)
% ECHO_GEN Echo generator for given signal and delay time.
timeBetween = 1/framerate; %[second/element]
newValCount = round(delaytime/timeBetween);
outputSignal = zeros(size(signal, 1) + newValCount, 1);

originalSignal = [signal; zeros(newValCount, 1)];
echoedSignal = [zeros(newValCount, 1); signal.*amplitude];
outputSignal = originalSignal + echoedSignal;

% If absolute of any element in the vector is higher than 1,
% multiple it to fit [-1, 1] interval.
if max(abs(outputSignal)) > 1
    outputSignal = outputSignal ./ max(abs(outputSignal)); 
end
end