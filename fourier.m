syms t;

T = 2; %the period
w0 = 2*pi/T; %the angular frequency
N = 640; %the number of terms

f = sign(cos(pi.*t)); %the step function

a0 = double(1/T*int(f, t, 0, T)); %constant term
a = zeros(N, 1); %setting up array of cos coefficients
b = zeros(N, 1); %setting up array of sin coefficients
for i = 1:N
    %calculate and store the coefficients
    funa = @(t) sign(cos(pi.*t)).*cos(i.*w0.*t); 
    funb = @(t) sign(cos(pi.*t)).*sin(i.*w0.*t);
    a(i) = 2/T*integral(funa, 0, T);
    b(i) = 2/T*integral(funb, 0, T);
end

tnum = 0:0.01:3; %0 to 3 with step 0.01
fnum = a0; %the function being graphed

terms = 5; %counts how many terms are being displayed

for i = 1:N
    %summation of the terms from a and b
    fnum = fnum + a(i)*cos(i*w0*tnum) + b(i)*sin(i*w0*tnum); 
     
    if i == terms %shows graph with 5, 10, 20...640 terms
        plot(tnum, fnum)
        title('Fourier series Animation');
        ylim([-1.5 1.5]);
        %display number of terms
        text(0.1, -1.3, ['Number of terms: ', int2str(terms)]); 
        %pause for arbitrary amount of time for animation
        pause(3); 
        terms = terms * 2;
        %frame = frame + 1;
    end
end

