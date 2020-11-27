clc
clear
%Practice midterm 2 for next week.
%How to represent a polynomial
%3x^2+5x+3 can be represented as [3,5,3]
%5x^3+4x^5-1=0 can be respresented as [4,0,5,0,-1]
%What can you do with a polynomial?
%How can i evaluate a polynomial??
    %POLYVAL:accepts 2 arguments (p,x) where p is the polynomial
    %coefficients and x is the points at which to evaluate.
    position=[3,5,3];
    x=[10,0.5,0];
    y=polyval(position,x)
    velocity=diff(y) %diff is not actually the derivative, but the difference between two ponts
    acceleration=diff(velocity)
  clc
  clear
%for addition and subtraction of polynomials, make sure the polynomial
%arrays are the same size by using placement zeros to make the arrays thw
%same size

%To multiply two polynomials, use convolution
%conv(a,b);

%to divide two polynomials, use deconvolution
% deconv(b,a);

%Data interpolation: estimating intermediate data values when the values of
%points around it are known.
        %Fancy way to connect data points
        x1=[0,1,2,3,4];
        y1=[9,5,-5,-8,10];
        %What was your mood at x1=3.5?
        %What was your mood at any given time, even after the given data?
        yi=interp1(x1,y1,linspace(0,4,50),'spline');
        disp(yi)
        plot(yi,'Linewidth',4)
        
%Extrapolation: trying to estimate outside the data bounds (before and
%after your given data points)
        %more risky and less accurate
        
        
%Another way to interpolate is by using fitting
%polyfit fits a curve represented by a polynomial to a dataset x,y.
    p=polyfit(x,y,polynomialOrder);
    
  
