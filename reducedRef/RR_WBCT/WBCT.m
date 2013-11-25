% function y = WBCT(x,fname,dfilt,nlevs)
function y = WBCT(x,nlevs)
%Wavlet�ֽ�,xΪ����ͼ��dfiltΪ�ֽ��˲�������,nlvesΪ�ֽ⼶��

if isempty(nlevs)
    y = {x};
else
    %%//////////////////////////////////////////////////////
    %���Ƚ���С���ֽ�
    x=double(x);
   [ca1,ch1,cv1,cd1]=dwt2(x,'db1');%%����Daubechies�˲���
% %/////////////////////////////////////////////////////////////////////
%     [h0, h1] = dfilters('9-7', 'd');%С���任�õ��˲�������������biorthogonal Daubechies 9-7�˲�����
%     [ca1,ch1,cv1,cd1]=wfb2dec(x,h0,h1);
    %%////////////////////////////////////////////////////////
    dfilt = '9-7';
     if nlevs(end) ~= 0
         % ��cd1����nlevs(end)�������˲����õ�2^nlevs(end)�������Ӵ�
         %ch1��ӷ����˲�����dfbdec
         %cv1��ӷ����˲�����dfbdec
          switch dfilt        % Decide the method based on the filter name
            case {'pkva6', 'pkva8', 'pkva12', 'pkva'}   
                % Use the ladder structure (whihc is much more efficient)
                % 
                xcd_dir = dfbdec_l(cd1, dfilt, nlevs(end));
                xch_dir = dfbdec_l(ch1, dfilt, nlevs(end));
                xcv_dir = dfbdec_l(cv1, dfilt, nlevs(end));
            otherwise       
                % General case
                 xcd_dir = dfbdec(cd1, dfilt, nlevs(end)); %���� nlevs��dfb�ֽ�,
                                                          %�õ���Ϊ2^nlevs�ĵ�λ�����ϵ��Ӵ�ͼ��    
                 xch_dir = dfbdec(ch1, dfilt, nlevs(end));
                 xcv_dir = dfbdec(cv1, dfilt, nlevs(end)); 
           end
           x_dir={xch_dir,xcv_dir,xcd_dir};
      end
       x_dir = {ch1, cv1, cd1};
       %Ȼ���ca1���ַ������������ֽ�
       ylo = WBCT(ca1,nlevs(1:end-1));
%         ylo = WBCT(ca1,fname, dfilt, nlevs(1:end-1));
       %���õ��ֽ���
       y={ylo{:},x_dir};
end
   
       
         