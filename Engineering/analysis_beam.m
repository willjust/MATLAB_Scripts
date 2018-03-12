%% Beam Analysis Solver
% Calculates margin/deflection based on idealized scanerios
% Best used for inital sizing
% All units are in kg/m/s
clc; clear;
%% Type of analysis
% 10. Square Cantilever Beam
% 11. Circular Cantilever Beam
% 20. Square Simply Supported Beam
% 21. Circular Simply Supported Beam
type = 21;

%% Geomtric Properties
% Ignore any values not relevent (if they are relevent you will get an error)
%base = 0.05;
%height = 0.05;
ID = 0.00;
OD = 0.03;

length = convert_in2m(9);

%% Material Selection
% 1. Al-6061, failing in yield
% 2. SS-303, failing in yield (NOT A-Basis)
% 3. SS-416 Tempered, failing in yield (NOT A-Basis)
% 4. Al-7075, fialing in yield
material = Material('Al-6061');

%% Loading
point = convert_lb2N(450);
axial = 10;

%% Analysis
factors = 1.15*2; % Model Uncertainty Factor, Safety Factor

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Solver %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Determine I
profType = mod(type, 10); % 0-Rectangular 1-Circular
switch profType
    case 0
        profile = RectangularProfile(base, height);
    case 1
        profile = CircularProfile(ID, OD);
end

% Determine M
loadCase = type - mod(type, 10); % 10-cantilever 20-Simply supported
switch loadCase
    case 10
        M = point*length;
        deflection = point*length^3 / 3 / material.E / profile.I();
    case 20
        M = point*length/4;
        deflection = point*length^3 / 48 / material.E / profile.I();
end

% Determine stresses and margin
stress_bending = M*profile.y() / profile.I();
stress_tension = axial/profile.area();
stress = stress_bending+stress_tension;
margin = material.tensile_yield/(factors*stress) - 1;

% If stress is 5x higher due to one loading case, let user know
if stress_bending/stress_tension > 5 || stress_tension/stress_bending > 5
    if stress_bending>stress_tension
        fprintf('Failure mostly due to bending. Reduce area of shape to reduce mass.\n');
    else
        fprintf('Failure mostly due to tension. Reduce area moment of shape to reduce mass.\n');
    end
end


% If part is over designed, let user know
if margin < 0 || margin > 2
    maxStress = material.tensile_yield;
   switch profType
       case 1
         diameter = findDiameter(maxStress/factors, M);
         fprintf('Perfect diameter: %3.3fm\n', diameter);
       case 2
         height = findHeight(maxStress/factors, base, M);
         fprintf('Perfect heigh: %3.3fm\n', height);
   end
end

% Output basic part info
fprintf('Margin: %2.2f\tMax Deflection %2.2fmm\n', margin, deflection*1000);
fprintf('Mass: %2.2fkg\n', material.density*profile.area()*length);


% Helpers for reducing margin
function d = findDiameter(failStress, moment) 
    d = power(32*moment/pi/failStress, 1/3);
end
function height = findHeight(failStress, base, moment)
    height = power(6*moment/base/failStress, 1/2); 
end