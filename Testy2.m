% i = 2;
% 
% while (i < 15)
%    fprintf("%d\n", i);
%    i = i + 1;
% end
% 
% sound(i, 9600);

x = 0.01.*rand(1,48001)

app.fs=48000; % f probkowania
            app.f=1000; % f generowanego dzwieku
            app.t=0:1/app.fs:1; % probki czasowe
            app.A=0.01; % domyslnie bylo 1
            app.y=app.A*sin(2*pi*app.f*app.t);  % sygnal harmoniczny