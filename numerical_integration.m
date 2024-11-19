%% Initialize parameters - DO NOT EDIT THIS SECTION!
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
plot(x,f_x, 'r.', MarkerSize = 20)
ylim([min(f_x), max(f_x)])
xlim([min(x), max(x)])

ylim([-1,1])
xlim([min(x), max(x)])
xlabel("x")
ylabel("f(x)")
xticks(x)

grid;
shg;

% then evaluate the integral analytically - use this to check your work
int_f = -beta*exp(-x/beta).*(sin(x) + beta*cos(x))/(beta^2+1); %perform the analytic integral
integral_analytic = int_f(end) - int_f(1); %it's a definite integral, apply limits of int.
%% START EDITING BELOW
% Exercise 1: Definition of Integral


%% Exercise 2: Use a linear approximation
% 
% try the trapezoidal method below


% note - we can compare this to Matlab's built-in function
integral_matlabtrapz = trapz(x,f_x);

%% Exercise 3: using higher-order approximations

