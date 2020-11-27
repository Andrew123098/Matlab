%% Script for fitting a gaussian to a signal
% Edit this script to produce a decent fit

clear;
clc;
clf;

%% Load the data in - you can save variables using the 'save' command,
%   then read them in using the 'load' command. Very similar to dlmread
%   and dlmwrite, but for any matlab variable
dataLoaded = load('signal.mat');
dataRaw = dataLoaded.data;  % Get data out
dataRaw1=dataRaw([1:floor(end/2)]);
dataRaw2=dataRaw([ceil(end/2):end]);
% Convert from signal to intensity at frequency
dataIntensity = abs( hilbert(dataRaw) );
dataIntensity1 = abs( hilbert(dataRaw1) );
dataIntensity2 = abs( hilbert(dataRaw2) );
% Data rate is 512 frames per second
lengthFrame = 1.0/512.0; % in seconds
times = 0:lengthFrame:lengthFrame * (length(dataIntensity)-0.5);
times1 = 0:lengthFrame:lengthFrame * (length(dataIntensity1)-0.5);
times2 = (5e4)/512+(0:lengthFrame:lengthFrame * (length(dataIntensity2)-0.5));

% Plot raw signal data
nRows = 3;
nCols = 2;
subplot(nRows, nCols, 1);
plot( times, dataRaw, '-k' );
xlabel('Time (s)');
ylabel('Amplitude (db)')
title('Raw data');
axis([0,200,-0.2,0.2])

% Plot envelope
subplot(nRows, nCols, 2);
plot( times, dataIntensity, '-k' );
xlabel('Time (s)');
ylabel('Signal strength')
title('Intensity data');
axis([0,200,0,0.15])

% Fit a Gaussian to the entire thing
gaussFitted = fit( times', dataIntensity', 'gauss1' );
gaussFitted1 = fit( times1', dataIntensity1', 'gauss1' );
gaussFitted2 = fit( times2', dataIntensity2', 'gauss1' );

% plot the result
subplot(nRows, nCols, 3);
% plot 'knows' what kind of data gaussFitted is, so it plots the right
% thing
plot(gaussFitted1, times1, dataIntensity1);
xlabel('Time (s)');
ylabel('Signal strength')
axis([0,100,0,0.15])

% plot the result
subplot(nRows, nCols, 5);
% plot 'knows' what kind of data gaussFitted is, so it plots the right
% thing
plot(gaussFitted2, times2, dataIntensity2);
xlabel('Time (s)');
ylabel('Signal strength')
axis([80,200,0,0.06])

% Evaluate the fitted Gaussian and plot
%   You can treat gaussFitted as a function and 'call' it with t value
fittedValues1 = gaussFitted1(times1);
subplot(nRows, nCols, 4);
plot( times1, dataIntensity1, '.b' );
hold on;
plot( times1, fittedValues1, '--k', 'LineWidth', 3 );
legend('Original data', 'Fitted Gausian');
xlabel('Time (s)');
ylabel('Signal strength')
title('Fitted Pulse 1');
axis([0,100,0,0.15])
fprintf('Gaussian 1 centered at %0.2f, peak %0.4f, sd %0.4f\n',gaussFitted1.b1,gaussFitted1.a1,gaussFitted1.c1)


% Evaluate the fitted Gaussian and plot
%   You can treat gaussFitted as a function and 'call' it with t value
fittedValues2 = gaussFitted2(times2);
subplot(nRows, nCols, 6);
plot( times2, dataIntensity2, '.b' );
hold on;
plot( times2, fittedValues2, '--k', 'LineWidth', 3 );
legend('Original data', 'Fitted Gausian');
xlabel('Time (s)');
ylabel('Signal strength')
title('Fitted Pulse 2');
axis([80,200,0,0.06])
fprintf('Gaussian 2 centered at %0.2f, peak %0.4f, sd %0.4f\n',gaussFitted2.b1,gaussFitted2.a1,gaussFitted2.c1)
