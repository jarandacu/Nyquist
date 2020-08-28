function r=An(str,n,P)
r=@eva;
    function y=eva(Taui,alphai)
        fh=str2func(str);
        w=2*pi/60;
        T=1;
        alpha=0;
        y=1;
        for k=1:1:P
        y=y.*cos(n.*w.*fh(Taui-k*T,alpha).*cos(alphai)).*cos(n.*w.*fh(Taui-k*T,alpha).*sin(alphai));
        end
    end
end