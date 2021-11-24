function g = gmake(X)

x = X(1); y= X(2); z = X(3);
g = x^4 -2*x^3*y + 2*x^2*z^3-x*y*z + 2*y^2*z^2 + z^6;
end
