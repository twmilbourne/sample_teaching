%% DO NOT EDIT THIS SECTION!
% define your function and plot it

%Define a grid of uniformly spaced points
h = 0.5; %choose space between point
x = 0:h:4*pi;
N = length(x);

%make sure N is odd, need this for quad method
if mod(N,2) == 0
    x = x(1:N-1);
    N = N-1;
end

%define a function - this will be our integrand
beta = 10; %just a scaling factor
f_x = exp(-x/beta).*sin(x);

%make a nice plot!
plot(x,f_x, '.')
ylim([min(f_x), max(f_x)])
xlim([min(x), max(x)])
grid;
shg;

% then evaluate the integral analytically - use this to check your work
int_f = -beta*exp(-x/beta).*(sin(x) + beta*cos(x))/(beta^2+1); %perform the analytic integral
integral_analytic = int_f(end) - int_f(1); %it's a definite integral, apply limits of int.
%% START EDITING BELOW
% Exercise 1: Definition of Integral
% 
% try the left-hand sum
integral_left = sum(diff(x).*f_x(1:end-1));

% try the right-hand sum
integral_right = sum(diff(x).*f_x(2:end));

%% Exercise 2: Use a linear approximation
% 
% try the trapezoidal method below
integral_mytrapz = 0; 
diff_x = diff(x);
for ii = 1:N-1
    integral_mytrapz = integral_mytrapz + 1/2*(f_x(ii) + f_x(ii+1))*diff_x(ii);
end

% note - we can compare this to Matlab's built-in function
integral_matlabtrapz = trapz(x,f_x);

%% Exercise 3: using higher-order approximations

%here we have assumed our grid of points is uniformly spaced
integral_quad = 0;
for ii = 1:2:N-2
    integral_quad = integral_quad + h/3*(f_x(ii+2)+4*f_x(ii+1) + f_x(ii));
end
