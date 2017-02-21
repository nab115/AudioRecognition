%go analysis
for i = 1:1:4
    filename = strcat('snap', int2str(i), '.wav');
    [y,Fs] = audioread(filename);
    N = length(y);
    T = N/Fs;
    t = linspace(0, length(y)/Fs, length(y));
    %figure();
    %plot(t, y);
    start = 0;
    stop = 0;
    for i = 1:1:length(y)
        if(y(i) > .02)
            start = i;
            break;
        end
    end
    
    for i = length(y):-1:1
        if(y(i) > .02)
            stop = i;
            break;
        end
    end
    %figure();
    %plot(t(start:stop), y(start:stop));
    MYDUDE = length(t(start:stop))
    Nfft = 1024;
    f = linspace(0,Fs,Nfft);
    G = abs(fft(y(start:stop),Nfft));
    figure()
    plot(f(1:Nfft/2),G(1:Nfft/2));
end



[y,Fs] = audioread('clap2.wav');
N = length(y);
T = N/Fs;
t = linspace(0, length(y)/Fs, length(y));
%figure();
%plot(t, y);
start = 0;
stop = 0;
for i = 1:1:length(y)
    if(y(i) > .02)
        start = i;
        break;
    end
end
    
for i = length(y):-1:1
    if(y(i) > .02)
        stop = i;
        break;
    end
end
figure();
plot(t(start:stop), y(start:stop));
MYDUDE = length(t(start:stop))
Nfft = 1024;
f = linspace(0,Fs,Nfft);
G = abs(fft(y(start:stop),Nfft));
figure()
plot(f(1:Nfft/2),G(1:Nfft/2));
YOLO = length(G);