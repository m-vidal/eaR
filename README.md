# An R package for perception-based auditory and music analysis <img src="man/figure/logo2.png" align="right" width="150" />
<!--- 
[![Travis-CI Build Status](https://travis-ci.org/FredHasselman/casnet.svg?branch=master)](https://travis-ci.org/FredHasselman/casnet)

[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/FredHasselman/casnet?branch=master&svg=true)](https://ci.appveyor.com/project/FredHasselman/casnet)
-->
[![CRAN status](https://www.r-pkg.org/badges/version/casnet)](https://cran.r-project.org/package=casnet)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

This is a version in development of the **eaR** package, an open-source **R** tool for perception-based auditory analysis. **eaR** provides user-friendly and flexible tool oriented to facilitate the workflow of researchers interested in content analysis and automatic extraction of auditory and musical features. Routines are mainly designed according to the  auditory short term memory (ASTM) model developed by Marc Leman and previously implemented in [IPEM Toolbox](https://www.ugent.be/lw/kunstwetenschappen/ipem/en/research/projects/finishedprojects/ipem-toolbox.htm).  


## Install the Package
Before downloading **eaR**, you should have installed **devtools** and load it:

```R
install.packages("devtools")
library("devtools")
```

After that, to download **eaR**, you can type in the **R** prompt:

```R
install_github("m-vidal/eaR")
```
<!--- 
You will get a message confirming that your **eaR** Package has been installed correctly.
___
:exclamation: **Note for Mac users:**
Running the Auditory Model makes it necessary to give permissions to execute the file `.../Auditory_Model/ASTMunix`. To install correctly all dependecies, once the package is download type in the **R** prompt:

```R
library(eaR)
InstallAuditoryModel("mac")
```
(See: Auditory_Model/Readme.txt)
-->

## A short glipmse to auditory nerve images, the atom of **eaR**
The **eaR**  package contains an adapted version of the auditory periphery model proposed by [Van Immerseel and Martens (1992)](https://asa.scitation.org/doi/10.1121/1.402840). The model simulates the cochlear mechanical filtering using an array of overlapping band-pass filters. An audio signal can be then represented as a *auditory nerve image* (ANI), which is multivariate vector of neural discharges in different frequency bands.

To calculate the ANI and periodicity pitch image (PPI) of the *SchumannKurioseGeschichte* dataset, type:

```R
library(eaR)
data(SchumannKurioseGeschichte)
ANIs <- CalcANI(SchumannKurioseGeschichte, 22050) #auditory nerve image
PPs <- PeriodicityPitch(ANIs)
PlotImage(PPs)
```

After running the code, you will get an image as follows,

<div align="center">
 <img src="https://github.com/m-vidal/eaR/blob/main/PP.jpeg"></a><br>
</div>
which is a transformation of the auditory nerve image into a coherent pitch representation.

## Version 0.2.1

The package was designed through the object class `ANI`, which at least must contain an image, the sample frequency of the image and a set of frequencies or periods used in their transformations. Unlike in IPEM Toolbox, the formulation of the class `ANI`  facilitates interaction in the use of the functions and prevent disorderly data. This version includes the functions detailed in the following table. In addition, you can check whether the functions and documentation are available. 

Function | Status | Documentation | Migrated |
| :---  |  :---:  |  :---:  |  :---:  
`AdaptLevel` |:ballot_box_with_check:|:ballot_box_with_check:|Yes|
`as.Wave` |--|--|No|
`BellShape` |:ballot_box_with_check:|--|Yes|
`CalcANI` |:ballot_box_with_check:|:ballot_box_with_check:|Yes|
`CalcNoteFrequency` |:ballot_box_with_check:|:ballot_box_with_check:|No|
`CalcOnsetsFromANI` |:red_circle:|--|Yes|
`CalcProfile` |--|--|No|
`CalcRMS` |:ballot_box_with_check:|--|Yes|
`Clip` |:ballot_box_with_check:|--|Yes |
`ContextualityIndex` |:ballot_box_with_check:|:ballot_box_with_check:|Yes|
`CreateMask` |:ballot_box_with_check:|--|Yes|
`FindAllPeaks` |:ballot_box_with_check:|--|Yes|
`FindNearestMinima` |:ballot_box_with_check:|--|Yes|
`LeakyIntegration` |:ballot_box_with_check:|:ballot_box_with_check:|Yes|
`OnsetPattern` |:red_circle:|--|Yes|
`OnsetPatternFilter` |:red_circle:|--|Yes|
`OnsetPeakDetection` |:red_circle:|--|Yes|
`OnsetPeakDetection1Channel` |:red_circle:|--|Yes|
`PeriodicityPitch` |:ballot_box_with_check:|:ballot_box_with_check:|Yes|
`PlotImage` |:ballot_box_with_check:|:ballot_box_with_check:|No|
`RoughnessFFT` |:ballot_box_with_check:|:ballot_box_with_check:|Yes|
`ShepardTone` |:ballot_box_with_check:|:ballot_box_with_check:|Yes|
`ShepardToneComplex` |:ballot_box_with_check:|:ballot_box_with_check:|Yes|

:red_circle: (Deprecated) | :ballot_box_with_check: (Working)

[PPImage]: https://github.com/m-vidal/pv01/blob/master/PP.jpeg "Periodicity Pitch Image"

