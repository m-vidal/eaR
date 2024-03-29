\name{PeriodicityPitch}
\alias{PeriodicityPitch}
\title{Periodicity Pitch Image}
\description{This function calculates the periodicity pitch image (PPI) from the ANI matrix obtained with the function \code{\link{CalcANI}}. The periodicity pitch is defined as the summed autocorrelation over bandpass filtered fluctuations on the auditory channels. Since the output of the auditory model gives the envelopes of the neural firing probabilities (< 1250Hz), it suffices to apply a low-pass filter to obtain the pitch in a reliable frequency range (80-1250 Hz).

Let \eqn{F_{j}} denote a second-order Butterworth filter with a cutoff frequency of 80 Hz. Then, the filtered channels are %\eqn{\tilde{A}_{j}=A_j-F_{80}[A_j],}
\eqn{\tilde{A}_{j}=F_{j}[A_j],} where \eqn{A_j\ (j=1,\ldots,m)} denote the channels of the ANI matrix. %\eqn{\mathbf{A}=(A_{ij})_{n\times m}}  with associated sample frequency \eqn{f_{A}}.
The lower limit of 80 Hz accounts for the fact that for smaller frequencies, the pitch becomes more a sensation of textural properties. The higher limit of 1250 Hz is related to the limits of neural synchronization. Beyond about 1250 Hz, the neurons are no longer able to follow the exact period of the signal very accurately, and periodicity pitch becomes unreliable. Only the lowest frequency can be changed by \code{inLowFrequency}. Secondly, a frame-based convolution analysis and a coincidence mechanism is conducted by the summation of the convolution results over all channels. 
 }
\usage{PeriodicityPitch(inANIObj, inLowFrequency = 80,
                 inFrameWidth = 0.064, inFrameStepSize = 0.010)}
\arguments{
  \item{inANIObj}{an object of class "\code{AI}". It must contain the output of \code{\link{CalcANI}} function:
  \itemize{
    \item{a matrix of size  \emph{n} x \emph{m} where \emph{n} is the number of auditory channels (<= 40) and \emph{m} is the number of samples.}
    \item{the sample frequency of the input signal (in Hz).}}}
  \item{inLowFrequency}{cutoff frequency (in Hz) of a first order lowpass filter applied before calculating the autocorrelation. If empty or not specified, 80 is used by default.}
  \item{inFrameWidth}{width of the frame used for the accumulation of the autocorrelation (in s). If empty or not specified, 0.064 is used by default.}
  \item{inFrameStepSize}{stepsize or time interval between two \code{inFrameWidth} (in s). If empty or not specified, 0.010 is used by default.}}
\details{As for any frame-based function, the first value of the output signal is the value calculated for the first complete frame in the input signal. Thus, if you have an input signal of length 1 s at a sampling frequency of 1000 Hz, a frame width of 0.050 s and a frame step size of 0.010 s, then there will be \code{ceiling(((1 - 0.050)*1000 + 1)/(0.010*1000)) = 96} values in the output signal. The first value corresponds to the first complete frame (the interval 0 to 0.050 s).}
\value{An object of class "\code{AI}", which is a list with the following elements:
  \item{PeriodicityPitchImage}{periodicity pitch: a matrix of size \code{inFrameWidth * length(inMatrix) / outSampleFreq}}
  \item{SampleFreq}{sampling rate, equal to inSampleFreq/inFrameStepSize (in Hz).}
  \item{Periods}{analyzed periods (in s).}
  \item{BPANI}{bandpass filtered auditory nerve images (at the original sample frequency).}}
\author{Marc Vidal (\code{R} version). Based on the original code from \pkg{IPEM} Toolbox.}
\examples{\dontrun{probe <- ShepardTone(293.66, 1, indBLevel = -20)
s <- c(SchumannKurioseGeschichte, numeric(2205), probe)
ANIs <- CalcANI(s, 22050)
PPs <- PeriodicityPitch(ANIs)}}
