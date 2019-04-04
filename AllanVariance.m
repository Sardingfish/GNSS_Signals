% *************************************************************************
% AllanVariance.m :Compute Phase or Frequency Sequence's Allan Variance
%  
%           Copyright (C) 2019 by Jason DING , All rights reserved.
%  
%    version :$Revision: 1.0 $ $Date: 2019/04/04 $
%    history : 2019/04/04  1.0  new
% *************************************************************************

function AllanVariance = AVAR_Phase(PhaseSequence,tau)
% 功能：计算时差（相位）序列的阿伦方差.***************************************
% 输入：
%       PhaseSequence      时差序列   
%       tau                采样时间间隔              
% 输出：
%       AllanVariance      阿伦方差
% *************************************************************************
N = length(PhaseSequence);
bias=PhaseSequence(3:N)-2*PhaseSequence(2:N-1)+PhaseSequence(1:N-2);
AllanVariance=(bias*bias')/(2*(N-2)*tau*tau);
end

function AllanVariance = AVAR_Freq(FrequencySequence)
% 功能：计算频率序列的阿伦方差.**********************************************
% 输入：
%       FrequencySequence      频率序列                 
% 输出：
%       AllanVariance          阿伦方差
% *************************************************************************
M = length(FrequencySequence);
bias=FrequencySequence(2:M)-FrequencySequence(1:M-1);
AllanVariance=(bias*bias')/(2*(M-1));
end
