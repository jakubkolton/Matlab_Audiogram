f_audiogram = [125 500 1000 2000 3000 4000 6000 8000 100000]; % 9 czestotliwosci audiogramu

% wspolczynniki (wzmacniajace n*10dB); od 0dB do +140dB
coef_audiogram = [1]; 
    for i = 1:14 %wypelnienie
        coef_audiogram(i+1) = 10.^(i*10/20);
    end

    
% NAPISZ KALIBRACJE OD NOWA NP. Z UZYCIEM GENERATORA
%kalibracja
            fs=48000; % f probkowania 
            f=1000; % f generowanego dzwieku
            t=0:1/fs:1; % probki czasowe 1 sekundy
            A=0.01; % domyslnie bylo 1
            y=A*sin(2*pi*f*t);  % sygnal harmoniczny
            Py=10*log10(sum(y.^2)); % moc akustyczna
            coef=10.^(5/20); % wspolczynnik (zwiekszajacy +dB)
            yy=y.*coef; % wzmocnienie sygnalu o +5dB
            Pyy=10*log10(sum(yy.^2)); % moc akustyczna +5dB
            test=[]; % dzwiek testowy do kalibracji
            
            % generowanie 2*10 sekund sygnalu testowego do kalibracji
            for i=1:10
                z1=y(1,1:48000);
                z2=yy(1,1:48000);
                test=[zz z1 z2];
            end
            
            %z4=zz/max(abs(zz));
            %plot(z4)
            %audiowrite('test.wav', zz, fs); % zapisanie sygnalu testowego
            %do pliku
         
            
            % Uniwersalny generator
            A = 0.01; % stale wzmocnienie (zeby nie ogluchnac przy testach); domyslnie bylo 1
            f = f_audiogram(1); % czestotliwosc generowanego dzwieku [Hz]
            fs = 48000; % czestotliwosc probkowania [Hz]
            t = 0:1/fs:1; % probki czasowe
%             gain = 0; % wzmocnienie dB; Do wzmacniania kolejnych 
            coef = coef_audiogram(1); % wspolczynnik (zwiekszajacy +dB)
            y=coef*A*sin(2*pi*f*t);  % sygnal harmoniczny
            
            
            % Lewy kanal
            left=y(1,1:48000);
            left = [left; zeros(size(left))];
            % generowanie 10 sekund w lewym kanale
            left_10sec = []
            for i = 1:10
                left_10sec = [left_10sec left];
            end
            sound(left_10sec, fs);
            
%             % Prawy kanal
%             right=y(1,1:48000);
%             right = [zeros(size(right)); right];
%             % generowanie 10 sekund w lewym kanale
%             right_10sec = []
%             for i = 1:10
%                 right_10sec = [right_10sec right];
%             end
%             sound(right_10sec, fs);
            
            %sound(test, fs); % dzwiek testowy do kalibracji
            h=questdlg('Kliknij, gdy będziesz słyszeć tylko jeden z dwóch tonów', ...
                'Kalibracja','OK','OK');
            switch h
              case 'OK'
                 %'OK' code here
                 clear("sound");
              case ''
                 %abort code
              otherwise
            end