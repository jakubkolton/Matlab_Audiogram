% f_audiogram = [125 500 1000 2000 3000 4000 6000 8000 100000]; % 9 czestotliwosci audiogramu
% 
% % wspolczynniki (wzmacniajace n*10dB); od 0dB do +140dB
% coef_audiogram = [1]; 
%     for i = 1:14 %wypelnienie
%         coef_audiogram(i+1) = 10.^(i*10/20);
%     end
% 
%     
% % NAPISZ KALIBRACJE OD NOWA NP. Z UZYCIEM GENERATORA
% %kalibracja
%             fs=48000; % f probkowania 
%             f=1000; % f generowanego dzwieku
%             t=0:1/fs:1; % probki czasowe 1 sekundy
%             A=0.01; % domyslnie bylo 1
%             y=A*sin(2*pi*f*t);  % sygnal harmoniczny
%             Py=10*log10(sum(y.^2)); % moc akustyczna
%             coef=10.^(5/20); % wspolczynnik (zwiekszajacy +dB)
%             yy=y.*coef; % wzmocnienie sygnalu o +5dB
%             Pyy=10*log10(sum(yy.^2)); % moc akustyczna +5dB
%             test=[]; % dzwiek testowy do kalibracji
%             
%             % generowanie 2*10 sekund sygnalu testowego do kalibracji
%             for i=1:10
%                 z1=y(1,1:48000);
%                 z2=yy(1,1:48000);
%                 test=[zz z1 z2];
%             end
%             
%             % Kody z intstrukcji
%             %z4=zz/max(abs(zz));
%             %plot(z4)
%             %audiowrite('test.wav', zz, fs); % zapisanie sygnalu testowego
%             %do pliku
%          
%             
%             % Uniwersalny generator
%             A = 0.01; % stale wzmocnienie (zeby nie ogluchnac przy testach); domyslnie bylo 1
%             f = f_audiogram(1); % czestotliwosc generowanego dzwieku [Hz]
%             fs = 48000; % czestotliwosc probkowania [Hz]
%             t = 0:1/fs:1; % probki czasowe
% %             gain = 0; % wzmocnienie dB; Do wzmacniania kolejnych 
%             coef = coef_audiogram(1); % wspolczynnik (zwiekszajacy +dB)
%             y=coef*A*sin(2*pi*f*t);  % sygnal harmoniczny
%             
%             
%             % Lewy kanal
%             left=y(1,1:48000);
%             left = [left; zeros(size(left))];
%             % generowanie 10 sekund w lewym kanale
%             left_10sec = []
%             for i = 1:10
%                 left_10sec = [left_10sec left];
%             end
%             sound(left_10sec, fs);
%             
% %             % Prawy kanal
% %             right=y(1,1:48000);
% %             right = [zeros(size(right)); right];
% %             % generowanie 10 sekund w lewym kanale
% %             right_10sec = []
% %             for i = 1:10
% %                 right_10sec = [right_10sec right];
% %             end
% %             sound(right_10sec, fs);
%             
%             %sound(test, fs); % dzwiek testowy do kalibracji
%             h=questdlg('Kliknij, gdy będziesz słyszeć tylko jeden z dwóch tonów', ...
%                 'Kalibracja','OK','OK');
%             switch h
%               case 'OK'
%                  %'OK' code here
%                  clear("sound");
%               case ''
%                  %abort code
%               otherwise
%             end
%             
% 



        % TEST - Wyznaczanie wyniku audiogramu
        f_audiogram = [125 500 1000 2000 3000 4000 6000 8000 100000]; % 9 czestotliwosci audiogramu
        coef_audiogram = [1]; % wspolczynniki (wzmacniajace n*10dB); od 0dB do +140dB; Beda wypelnione po starcie programu
        offset = 0; % sztywno ustawiany Offset uszkodzenia sluchu, np. 7dB (bo 0dB na 1kHz jest glupie)
        
        left_ear = []; % ubytki sluchu w lewym uchu (w dB) dla 9 czestotliwosci audiogramu
        right_ear = []; % ubytki sluchu w prawym uchu (w dB) dla 9 czestotliwosci audiogramu
        left_ear_score = 0; % wynik audiogramu w lewym uchu [dB]
        right_ear_score = 0; % wynik audiogramu w lewym uchu [dB]
        final_score = 0; % wynik audiogramu uogolniony
        
        % Syntetyczne wypelnienie wyniku audiogramu:
%         left_ear = [10 20 20 80 20 30 30 30 40]; % wyjatek 2
%         right_ear = [20 20 20 70 20 80 40 40 50]; % wyjatek 1
        % Zastrzezenie B:
        left_ear = [10 20 20 20 20 30 30 30 40]; % typowy
        right_ear = [20 20 20 70 20 80 40 40 50]; % wyjatek 1
        
        
        % wynik audiogramu w lewym uchu [dB]
        % 500 Hz - element #2, 1000 Hz - #3, 2000 Hz - #4, 4000 Hz - #6
        if (abs(left_ear(2) - left_ear(4)) > 40)
            if (left_ear(4) > left_ear(6)) % Wyjatek nr 2
                left_ear_score = (left_ear(2) + left_ear(3) + left_ear(6)) / 3.0;
            else  % Wyjatek nr 1
                left_ear_score = (left_ear(2) + left_ear(3) + left_ear(4) + left_ear(6)) / 4.0;
            end
        else % Przypadek typowy
            left_ear_score = (left_ear(2) + left_ear(3) + left_ear(4)) / 3.0;
        end
        p = plot(f_audiogram, left_ear);
        p.Color = 'blue';
        hold on;
        
        % wynik audiogramu w prawym uchu [dB]
        % 500 Hz - element #2, 1000 Hz - #3, 2000 Hz - #4, 4000 Hz - #6
        if (abs(right_ear(2) - right_ear(4)) > 40)
            if (right_ear(4) < right_ear(6)) % Wyjatek nr 2
                right_ear_score = (right_ear(2) + right_ear(3) + right_ear(4) + right_ear(6)) / 4.0;
            else % Wyjatek nr 1
                right_ear_score = (right_ear(2) + right_ear(3) + right_ear(6)) / 3.0;
            end
        else % Przypadek typowy
            right_ear_score = (right_ear(2) + right_ear(3) + right_ear(4)) / 3.0;
        end
        p = plot(f_audiogram, right_ear);
        p.Color = 'red';
        
        % Wynik finalny audiogramu
        if (abs(right_ear_score - left_ear_score) > 25)
           final_score = 5;
        end
        if (right_ear_score < left_ear_score)
            final_score = final_score + right_ear_score;
        else
            final_score = final_score + left_ear_score;
        end
        
        % Wynik tekstowy audiogramu
        if (final_score > 120)
            fprintf('Calkowita gluchota\n');
        elseif (final_score > 90)
            fprintf('Glebokie uszkodzenie sluchu\n');
        elseif (final_score > 70)
            fprintf('Znaczne uszkodzenie sluchu\n'); 
        elseif (final_score > 40)
            fprintf('Umiarkowane uszkodzenie sluchu\n');
        elseif (final_score > 20)
            fprintf('Lekkie uszkodzenie sluchu\n');
        else
            fprintf('Sluch w normie\n');                            
        end
        
        
        
        
        
