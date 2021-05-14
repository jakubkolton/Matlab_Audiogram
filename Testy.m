%kalibracja
            fs=48000;
            f=1000;
            t=0:1/fs:1;
            A=0.01; % domyslnie bylo 1
            y=A*sin(2*pi*f*t);
            Py=10*log10(sum(y.^2));
            coef=10.^(5/20);
            yy=y.*coef;
            Pyy=10*log10(sum(yy.^2));
            zz=[];
            for i=1:10
            z1=y(1,1:48000);
            z2=yy(1,1:48000);
            zz=[zz z1 z2];
            end
            %z4=zz/max(abs(zz));
            %plot(z4)
            %audiowrite('test.wav', zz, fs);
          
            left=y(1,1:48000);
            left = [zeros(size(left)); left];
            left = [left left left];
            sound(left, 48000);
            
            %sound(zz, fs); %dzwiek testowy
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