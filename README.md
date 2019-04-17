### GNSS Signals:signal_strength:

![](https://img.shields.io/badge/build-passing-brightgreen.svg)
![](https://img.shields.io/badge/platform-windows-orange.svg)
![](https://img.shields.io/badge/compiler-matlab-yellow.svg)
![](https://img.shields.io/badge/author-Jason%20Ding-blue.svg) ![](https://img.shields.io/badge/license-MIT-ff69b4.svg)

### Subroutines

| NO.  | M FILES         | FUNCTION                                                     |
| :--: | --------------- | ------------------------------------------------------------ |
|  1   | CAcode.m        | Generate different PRN's C/A code and calculate the correlation function between two C/A codes. |
|  2   | AllanVariance.m | Calculate the Alan variance of the clock difference(phase) sequence or frequency sequence. |

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
% Calculate the Alan variance of the clock difference (phase) sequence.
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

#### Several commonly used variances.

|             type              |           symbol            | description                                                  |
| :---------------------------: | :-------------------------: | ------------------------------------------------------------ |
|       Standard Variance       |            $S^2$            | Calculated based on the relative frequency deviation relative to the square of its mean. |
|        Allan Variance         |     $\sigma_y^2(\tau)$      | Calculated based on the relative frequency deviation relative to the square of its mean. |
|  Overlapping Allan Variance   |     $\sigma_y^2(\tau)$      | Calculating the Allan variance based on full overlap sampling. |
|        Total Variance         |  $\sigma_{total}^2(\tau)$   | Calculate the Allan variance using the extended data.        |
|    Modified Allan Variance    |    $Mod\sigma_y^2(\tau)$    | Calculating the Allan variance based on the relative frequency deviation or the mean of the time difference data. |
|    Modified Total Variance    | $Mod\sigma_{total}^2(\tau)$ | Calculate "Modified the Allen Variance" with the extended data. |
|         Time Variance         |     $\sigma_x^2(\tau)$      | $\frac{\tau^2}{3}Mod\sigma_y^2(\tau)$                        |
|      Time Total Variance      | $\sigma_{total x}^2(\tau)$  | $\frac{\tau^2}{3}Mod\sigma_{total}^2(\tau)$                  |
|       Hadamard Variance       |     $H\sigma_y^2(\tau)$     | Calculation based on the second difference of the relative frequency deviation or the cubic difference of the time difference data. |
| Overlapping Hadamard Variance |     $H\sigma_y^2(\tau)$     | The Hadamard variance is calculated based on full overlap sampling. |
|    Hadamard Total Variance    |  $H\sigma_{total}^2(\tau)$  | Calculate the Hadamard variance using the extended data.     |

