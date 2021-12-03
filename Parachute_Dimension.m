clc;
clear;
close all;
%%
% g: 9.81 m/s^2
% m: mass (input)
% ro: 1.225 kg/m^3 (density of air at sea level)
% Cd: coefficient of drag (input) (assumed 0.7 for now)
 
g = 9.81;
ro = 1.225;
m = input('Dry mass of rocket: ','s');
while isempty(m) || isnan(str2double((m))) || str2double(m) < 0
    fprintf('Error ! Enter a valid input\n');
    m = input('Dry mass of rocket: ','s');
end
m = str2num(m);

Cd = input('Coefficient of drag: ','s');
while isempty(Cd) || isnan(str2double((Cd))) || str2double(Cd) < 0
    fprintf('Error ! Enter a valid input\n');
    Cd = input('Coefficient of drag: ','s');
end
Cd = str2num(Cd);
fprintf('\n\n')
%% Main Parachute Dimensions
% D: diameter (output)
% v: descent velocity (input)

fprintf('-------------------------- Main chute -------------------------- \n');
v = input('Descent velocity: ','s');
while isempty(v) || isnan(str2double((v))) || str2double(v) < 0
    fprintf('Error ! Enter a valid input\n');
    v = input('Descent velocity: ','s');
end
v = str2num(v);

D = (sqrt((8*m*g)/(pi*ro*Cd*v^2)))*10^2;

% Drag Force
% Fd: force of drag (output)
% Fg: weight of rocket
% ro: 1.225 kg/m^3 (density of air at sea level
% Cd: coefficient of drag (input) (assumed 0.7 for now)
% A: area of rocket (output)
% D: diameter
% v: descent velocity (input)

A = (2*m*g)/(ro*Cd*v^2);

Fd = 0.5*ro*Cd*A*v^2;

Fg = m*9.81;

% Output
fprintf('\n----------------------------------------------------------------- \n');
fprintf('Parachute Diameter: %.2f \n', D);
fprintf('Parachute Area: %.2f \n', A);
fprintf('Rocket Weight %.2f \n', Fg);
fprintf('Drag Force %.2f  (should equal weight of rocket)\n\n\n', Fd);
%fprintf('----------------------------------------------------------------- \n\n');

%% Drogue chute
fprintf('-------------------------- Drogue chute -------------------------- \n');

v = input('Descent velocity: ','s');
while isempty(v) || isnan(str2double((v))) || str2double(v) < 0
    fprintf('Error ! Enter a valid input\n');
    v = input('Descent velocity: ','s');
end
v = str2num(v);


D = (sqrt((8*m*g)/(pi*ro*Cd*v^2)))*10^2;

% Drag Force
% Fd: force of drag (output)
% Fg: weight of rocket
% ro: 1.225 kg/m^3 (density of air at sea level
% Cd: coefficient of drag (input) (assumed 0.7 for now)
% A: area of rocket (output)
% D: diameter
% v: descent velocity (input)

A = (2*m*g)/(ro*Cd*v^2);

Fd = 0.5*ro*Cd*A*v^2;

%output
fprintf('Parachute Diameter: %.2f \n', D);
fprintf('Parachute Area: %.2f \n', A);
fprintf('Drag Force %.2f  \n\n\n', Fd);

%% Shock Chord

fprintf('-------------------------- Shock Chord -------------------------- \n');
% L: Rocket Length
% C: Chord length 
% (to prevent smacking)
% NC: Nose cone length (based off of chord length)
% BC: Body length (based off of chord length)

L = input('Rocket length (in meters): \n');
C = L*3;
NC = C/3;
BC = C-C/3;

% Output
fprintf('Chord Length (in meters): %.2f \n',C);
fprintf('Nose Cone Length (in meters) (based off ratio): %.2f \n',NC);
fprintf('Body length (in meters) (base off ratio): %.2f \n',BC);

%% Parachute Descent Rate Plot

m_plot = (round(m/2):m*2);
v_desc = sqrt((8*m_plot*g)/(pi*ro*Cd*D^2));

plot(m_plot*g,v_desc);
hold on;
grid on;
area(m_plot*g,v_desc,'FaceColor', 'blue');
plot(m*g,sqrt((8*m*g)/(pi*ro*Cd*D^2)),'o');
title('Descent Rate as a Function of Weight');

xlim([m_plot(1)*g, m_plot(end)*g]);

%% Black Powder
%F: Force to break shear pins
%V: Volume of rocket
%T: Ignition tempurature 
%R: Gas constant (8.3145 J*mol^-1*K^-1)
%M: Mass of black powder

%fix units
F = input('What is the maximum shear force of the shear pins? ');

V = ((pi*D^2)/4)*3;

T = input('What is the ignition tempurature of the black powder? ');

R = 8.3145;

M = ((F*V)/(A*R*T));

fprintf('Mass of black powder (in kg?): %.2f ',M);
