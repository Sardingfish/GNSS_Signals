### GNSS Signals:signal_strength:

![](https://img.shields.io/badge/build-passing-brightgreen.svg)
![](https://img.shields.io/badge/platform-windows-orange.svg)
![](https://img.shields.io/badge/compiler-matlab-yellow.svg)
![](https://img.shields.io/badge/author-Jason%20Ding-blue.svg) ![](https://img.shields.io/badge/license-MIT-ff69b4.svg)

### Subroutines

- **CAcode.m**

  The purpose of the function is to generate a C/A code and calculate the correlation function between C/A codes.

```matlab
function C_A = generateC_A(PRN,CodeLength,Delay)
% Generate C/A code
% Given:
%     PRN             i      PRN number
%     CodeLength      i      C/A code length
%     Delay           i      C/A code delay
% Returned:
%     C_A             d      C/A code
```

```matlab
function Rkl = Relafunc(Rk,Rl,CodeLength,NUM)
% Generate two C/A code correlation functions
% Given:
%       Rk , Rl       i      First C/A code and Second C/A code
%       CodeLength    i      C/A code length
%       NUM           i      Number of chips  
% Returned:
%       Rkl           d      Correlation functions
```

---

- **AllanVariance.m**

  The purpose of the function is to calculate the Alan variance of the phase or frequency sequence.

~~~matlab
function AllanVariance = AVAR_Phase(PhaseSequence,tau)
% Calculate the Alan variance of the time difference (phase) sequence.
% Given:
%       PhaseSequence        Phase sequence  
%       tau                  Sampling interval              
% Returned:
%       AllanVariance        Allan variance
~~~

~~~matlab
function AllanVariance = AVAR_Freq(FrequencySequence)
% Calculate the Alan variance of the frequency sequence.
% Given:
%       FrequencySequence    Frequency sequence                 
% Returned:
%       AllanVariance        Allan variance
~~~

The corresponding formula is:

![](https://raw.githubusercontent.com/Sardingfish/GNSS_Signals/master/image/AVAR.png)

---

