a1 = 250;
a2 = 150;
d4 = 50;

%%%%%%%% END EFFECTOR POSITIONING %%%%%%
xee = 400;
yee = 0;
zee = -150;
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

    Dfx = vpa(simplify(subs(f, [Theta1, Theta2, d3], x)));
    Fx = vpa(simplify(subs(p, [Theta1, Theta2, d3], x)));
    h = -Dfx \ Fx';
    x = vpa(simplify(x + h'));
    %%%%%% CHEKING ERROR %%%%%%%
    if sum(h.^2) < .001
        x(1:2) = vpa(simplify(x(1:2)./pi))*180
        break
    end
    
end
