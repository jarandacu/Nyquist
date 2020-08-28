function[v]=RaisedC(t,alpha)
T=1;

if abs(abs(alpha * t / T) - 0.5) > 1e-5
    v=sinc(t/T) .* cos(pi .* alpha .* t ./ T) ./ (1 - (2 .* alpha .* t ./ T).^2); % # typical case
else
    v=sinc(t/T) * pi * sin(pi * alpha * t / T) / (8 * alpha * t / T);  % L'Hopital limit for alpha * tau = 0.5
end

end