function distortion=RR_Wavelet(im_reference,im_distorted,alpha)
%�õ�����WBCT�任�Ĳ��ֲο�����������
%alphaΪ��ֵȨֵ
path('F:\code\RR_Wavelet\sender_side',path);
path('F:\code\RR_Wavelet\receiver_side',path);
path('F:\code\Wavelet9_7_toolbox',path);
NC1= sender_feature_extraction(im_reference,alpha);%%ȷ���ο�ͼ�����������ֵ��ϵ���ı���
distortion = receiver_distortion_measure(im_distorted, NC1);%�õ���������ͼ���������� Qֵ
rmpath('F:\code\Wavelet9_7_toolbox');
rmpath( 'F:\code\RR_Wavelet\receiver_side');
rmpath('F:\code\RR_Wavelet\sender_side');