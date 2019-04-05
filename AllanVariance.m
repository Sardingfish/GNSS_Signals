% ****************************************************************************
% AllanVariance.m :Compute Phase or Frequency Sequence's Allan Variance
%  
%           Copyright (C) 2019 by Jason DING , All rights reserved.
%  
%    version :$Revision: 1.0 $ $Date: 2019/04/04 $
%    history : 2019/04/04  1.0  new
%              2019/04/05  1.1  add Modified Allan variance and Time variance.
% ****************************************************************************

function AllanVariance = AVAR_Phase(PhaseSequence,tau)
% Calculate the Allan variance of the time difference (phase) sequence.*****
% Given:
%       PhaseSequence      Phase sequence  
%       tau                Sampling interval              
% Returned:
%       AllanVariance      Allan variance
% *************************************************************************
N = length(PhaseSequence);
bias=PhaseSequence(3:N)-2*PhaseSequence(2:N-1)+PhaseSequence(1:N-2);
AllanVariance=(bias*bias')/(2*(N-2)*tau*tau);
end

function AllanVariance = AVAR_Freq(FrequencySequence)
% Calculate the Allan variance of the frequency sequence.*******************
% Given:
%       FrequencySequence      Frequency sequence                 
% Returned:
%       AllanVariance          Allan variance
% *************************************************************************
M = length(FrequencySequence);
bias=FrequencySequence(2:M)-FrequencySequence(1:M-1);
AllanVariance=(bias*bias')/(2*(M-1));
end

function Mod_AllanVariance = MAVAR_Phase(PhaseSequence,tau,m)
% Calculate the Modified Allan variance of the time difference (phase) sequence.
% Given:
%       PhaseSequence      Phase sequence  
%       tau                Sampling interval  
%       m                  Smoothing factor       
% Returned:
%       Mod_AllanVariance  Modified Allan variance
% *************************************************************************
N = length(PhaseSequence);
sum = 0;
for j=1:N-3*m+1
    for i=j:j+m-1
        sum = sum+(PhaseSequence(i+2*m)-2*PhaseSequence(i+m)+PhaseSequence(i))^2;
    end
end
Mod_AllanVariance = sum/(2*m^2*tau^2*(N-3*m+1));
end

function Mod_AllanVariance = MAVAR_Freq(FrequencySequence,m)
% Calculate the Modified Allan variance of the frequency sequence.*********
% Given:
%       FrequencySequence      Frequency sequence         
%       m                      Smoothing factor
% Returned:
%       Mod_AllanVariance      Modified Allan variance
% *************************************************************************
M = length(FrequencySequence);
sum = 0;
for j=1:M-3*m+2
    for i=j:j+m-1
       for k=i:i+m-1
           sum = sum+(FrequencySequence(k+m)-FrequencySequence(k))^2;
       end
    end
end
Mod_AllanVariance = sum/(2*m^4*(M-3*m+2));
end

function TimeVariance = TVAR(ModAVAR,tau)
% Calculate the Time Variance. ********************************************
% Given:
%       ModAVAR                Modified Allan variance      
%       tau                    Sampling interval  
% Returned:
%       TimeVariance           Time Variance
% *************************************************************************
TimeVariance = ModAVAR*tau/sqrt(3);
end















