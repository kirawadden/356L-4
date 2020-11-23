% part 1 - first principles
m_p = 0.0135; % mass pendulum (kg)
l_c = 0.162; % center of gravity from motor shaft (m)
L_a = 41.6*10^-4;
K_e = 0.0241;
K_t = 0.0241;
R_a = 3.02;
theta_m_prime = 490.09;
i_a = 0.0586;
b = (K_t*i_a)/theta_m_prime;
J_e = 1.7*10^-7;
J_p = 4.43*10^-4;
J_m = 4.35*10^-6;
J_t = J_e + J_p + J_m;
g = -9.81;
s = tf('s');
sys_fprinciples = (K_t/(R_a*J_t + b*L_a))/(s^2 + s*((R_a*b - L_a*l_c*m_p*g + K_e*K_t)/(R_a*J_t + b*L_a)) - ((l_c*m_p*R_a*g)/(R_a*J_t + b*L_a)));

% part 2 - transient and steady-state response
t1 = 0.5001;
t2 = 1.5244;
re = 150;
omega_d = 2*pi/(t2 - t1);
y_max = 1.1704;
y_ss = 0.7573;
input_f = (12/1023)*re;
K = y_ss/(input_f);
os = (y_max - y_ss)/y_ss;
zeta = sqrt(log(os)^2/(pi^2 + log(os)^2));
omega_n = omega_d/sqrt(1 - zeta^2);
sys_sstrans_response = K*omega_n^2/(s^2 + (2*zeta*omega_n)*s + omega_n^2)
