function [Thet1, Thet2, D3] = solverInverse(Xee, Yee, Zee)
a1 = 250;
a2 = 150;
d4 = 50;

%%%%%%%% END EFFECTOR POSITIONING %%%%%%
xee = Xee;
yee = Yee;
zee = Zee;
%%%%%%%% EQUATIONS GIVEN %%%%%%%%%%%
syms Theta1 Theta2 d3
px = a1 * cos(Theta1) + a2 * cos(Theta1 + Theta2) - xee;
py = a1 * sin(Theta1) + a2 * sin(Theta1 + Theta2) - yee;
pz = -d3 - d4 - zee;

p = [px, py, pz];
s = [Theta1 Theta2 d3];
%%%%% CALCULATING THE DERIVATIVE %%%%%%%%%
f = jacobian(p, s);
x = [pi/5, pi/2, 0];

while true

    Dfx = double((subs(f, [Theta1, Theta2, d3], x)));
    Fx = double((subs(p, [Theta1, Theta2, d3], x)));
    h = -Dfx \ Fx';
    x = (x + h');
    %%%%%% CHEKING ERROR %%%%%%%
    if sum(h.^2) < .001
        x(1:2) = round(double((x(1:2)./pi))*180);
        x(3) = round(x(3));
        break
    end
    
end
Thet1 = x(1);
Thet2 = x(2);
D3 = x(3);
