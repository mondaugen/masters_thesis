%synthesis parameters
sp=struct();
% filename base
sp.fname='/tmp/test';
% Sampling rate in Hz
sp.Fs=16000;
% Length of signal
sp.N=sp.Fs*2;
% sample indices
n=(0:(sp.N-1));
n=n(:);
t=n/sp.Fs;
% Fundamental
sp.f0=350;
% Number of harmonics
sp.K=10;
% Inharmonicity coefficient
%sp.B=exp(2.54*log(sp.f0)-24.6); % For now, the just noticeable inharmonic coefficient
sp.B=0.0001;
% Harmonic numbers
k=1:sp.K;
% Harmonic numbers adjusted for inharmonicity
k_B=k.*sqrt(1+sp.B*k.^2);
% Amplitude based on harmonic number
sp.A_k_60=Inf; % The harmonic number that is 60dB lower than the first
a_k_60=log(10^(-3))/log(10)/sp.A_k_60;
sp.A_k=exp(a_k_60*k); % use original harmonic numbers
% Initial phase
sp.phi=0;
% Initial FM phase
sp.phi_fm=0;
% Time in seconds until amplitude of partial has dropped by 60dB
%sp.T_60=1;
sp.T_60=Inf;
% amplitude coefficient
a_60=log(10^(-3))/log(10)/sp.T_60;
A=exp(a_60*t)*sp.A_k;
% Amplitude coefficient of FM
sp.A_fm=sp.f0*2^(0/12)-sp.f0;
% Frequency coefficient of FM
sp.f_fm=5;
x=A.*cos(2*pi*(sp.f0*t+sp.A_fm/(2*pi*sp.f_fm)*cos(2*pi*sp.f_fm*t+sp.phi_fm))*k_B+sp.phi);
x=sum(x,2);
[S,T,F]=stft_ne(x',1024,256,'hanning',1023,16000);
imagesc(T,F,log(abs(S)));
% write raw sound file
fo=fopen([fname '.f64'],'w');
fwrite(fo,x,'float64');
fclose(fo);
% write log file
save([fname '.dat'],'sp');
%wavwrite(x/max(x),'/tmp/test.wav');
