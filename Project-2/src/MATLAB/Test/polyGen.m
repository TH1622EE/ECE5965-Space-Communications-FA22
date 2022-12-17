syms x

U = 1 + x^2 + x^3 + x^5;
G1 = 1 + x^3 + x^5 + x^7 + x^8;
G2 = 1 + x^2 + x^3 + x^4 + x^5 + x^7;

V1 = expand(U*G1)
V2 = expand(U*G2)