function NC1 = feature_calculation(im,alpha)
C=pdfbdec(double(im),'9-7','9-7',[3,3,4]);%�²���Contourlet
% C=nsctdec(double(im),[3,3,4]);%���²���Contourlet
n=0;

i=4;
w=WCSF(3/8);
for j=1:2:16
    n=n+1;
    oband=C{i}{j};
    band=oband*w;
    %     NC1(n) =round(100*length(find(absband>=thr))/prod(size(absband)))/100;
%     NC1(n) =round(1000*length(find(absband>=thr))/prod(size(absband)))/1000;
    th(n)=std2(band);
end
% thr=1.5*mean(th);
thr=alpha*mean(th);

NC1(1)=thr;

n=1;
i=2;
w=WCSF(3/32);
for j=1:2:8
   
    n=n+1;
    oband=C{i}{j};
    band=oband*w;
    absband=abs(band);
%     NC1(n) =round(100*length(find(absband>=thr))/prod(size(absband)))/100;
%     NC1(n) =round(1000*length(find(absband>=thr))/prod(size(absband)))/1000;
    NC1(n) =round(512*length(find(absband>=thr))/prod(size(absband)))/512;
end

i=3;
w=WCSF(3/16);
for j=2:2:8
    n=n+1;
    oband=C{i}{j};
    band=oband*w; 
    absband=abs(band);
%     NC1(n) =round(100*length(find(absband>=thr))/prod(size(absband)))/100;
%     NC1(n) =round(1000*length(find(absband>=thr))/prod(size(absband)))/1000;
    NC1(n) =round(512*length(find(absband>=thr))/prod(size(absband)))/512;
end

i = 4;
w=WCSF(3/8);
for j=1:2:16
    n=n+1;
    oband=C{i}{j};
    band=oband*w;
    absband=abs(band);
%     NC1(n) =round(100*length(find(absband>=thr))/prod(size(absband)))/100;
%     NC1(n) =round(1000*length(find(absband>=thr))/prod(size(absband)))/1000;
    NC1(n) =round(512*length(find(absband>=thr))/prod(size(absband)))/512;
end
return