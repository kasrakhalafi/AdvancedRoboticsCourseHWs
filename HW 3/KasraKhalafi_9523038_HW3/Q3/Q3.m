% WE CONSIDER A CIRCLE WITH R = 400 AND PZ = -50 AND WE WILL FIND OUT A WAY
% TO CALCULATE THE INVERSE KINEMATIC OF THE ROBOT
%SO AS WE KNOW WE HAVE A CIRCLE WITH R = 400 SO WE HAVE THE EQUATION BELLOW
%                 PX ^ 2 + PY ^ 2 = 400 ^ 2                  %
%FIRST WE HAVE TO CALCULATE THE THETA1 AS SHOWN BELLOW

% (1)   px = a1 * cos(Theta1) + a2 * cos(Theta1 + Theta2);
% (2)   py = a1 * sin(Theta1) + a2 * sin(Theta1 + Theta2)
% (3)   PX ^ 2 + PY ^ 2 = 400 ^ 2
%  ====> 400^2 = a1^2 + a2^2 + 2*a1*a2*[cos(Theta1) * cos(Theta1 + Theta2)
%  + sin(Theta1) * sin(Theta1 + Theta2)]
%  ====> 400^2 = a1^2 + a2^2 + 2*a1*a2*cos(Theta2)
%  ====> cos(Theta2) = (400^2 - a1^2 - a2^2) / (2 * a1 * a2)

a1 = 250;
a2 = 150;
d4 = 50;

syms Theta1 Theta2 d3
px = a1 * cos(Theta1) + a2 * cos(Theta1 + Theta2);
py = a1 * sin(Theta1) + a2 * sin(Theta1 + Theta2);
pz = -d3 - d4;
cTheta2 = acos((400^2 - a1^2 - a2^2) / (2 * a1 * a2));
sTheta2 = (1 - (cTheta2).^ 2).^(1/2);
Theta2 = atan2(sTheta2,cTheta2);

% (1) ==>  px = a1 * cos(Theta1) + a2 * cos(Theta1) * cos(Theta2) - a2 *
% sin(Theta1) * sin(Theta2) (4)
% (2) ==>  py = a1 * sin(Theta1) + a2 * sin(Theta1) * cos(Theta2) + a2 *
% cos(Theta1) * sin(Theta2) (5)
%
% (4) ===> sin(Theta1) = [a2*sin(Theta2)*px + (a1+a2*cos(Theta2))*py] /
% [(a2*sin(Theta2)^2 + (a1+a2*cos(Theta2))^2]
% (5) ===> cos(Theta1) = [(a1+a2*cos(Theta2))*px + a2*sin(Theta2)*py] /
% [(a2*sin(Theta2)^2 + (a1+a2*cos(Theta2))^2]
% 
% FROM EQUATIONS ABOVE AND WITH RESPECT TO ATAN2 WE COULD CALCULATE THE
% THETA1 PARAMETER

%%%%%%%%%  NOTE : THETA1 AND THETA2 ARE TO RADIAN NOT DEGREE  %%%%%%%
Theta1 = atan2(a2*sin(Theta2)*px + (a1+a2*cos(Theta2))*py,(a1+a2*cos(Theta2))*px + a2*sin(Theta2)*py)


%SO TILL HERE WE HAVE CALCULATED THE 2 PARAMETERS AND NOW WE HAVE TO JUST
%CALCULATE THE THIRD PARAMETER (D3)

pz = -50;
d3 = -pz - d4




%SO WE CALCULATED ALL THE 3 PARAMETERS
