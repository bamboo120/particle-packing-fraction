clear;
A = imread('/Users/bamboo/Desktop/shape_nonlocal/circle/200/t11.bmp');
B=A(:,:,1);
[centers, radii, metric] = imfindcircles(B,[6 27],'Sensitivity',0.8);
 Radius=radii;
 Cent=centers;
 Me=metric;
 B(B<255)=0;
 j=1;
 for i=1:length(radii)
     if ((radii(i)>6.5) && (radii(i)<10.0))
        centersStrong5(j,:)= Cent(i,:);
     end
     if ((radii(i)>6.5) && (radii(i)<10.0))
         radiiStrong5(j) = radii(i);
     end
     if ((radii(i)>6.5) && (radii(i)<10.0))
         metricStrong5(j) = metric(i);
     end
     if ((radii(i)>6.5) && (radii(i)<10.0))
         j=j+1;
         
     end
 end
 centersStrong5_s=[];
 centersStrong5_L=[];
 j=1;
 for i=1:length(radiiStrong5)
     if ((radiiStrong5(i)>7.5))
        centersStrong5_L(j,:)= centersStrong5(i,:);
     end
     if ((radiiStrong5(i)>7.5))
         radiiStrong5_L(j) = radiiStrong5(i);
     end
     if ((radiiStrong5(i)>7.5))
         j=j+1;        
     end
 end
 j=1;
 for i=1:length(radiiStrong5)
     if ((radiiStrong5(i)<7.5))
        centersStrong5_s(j,:)= centersStrong5(i,:);
     end
     if ((radiiStrong5(i)<7.5))
         radiiStrong5_s(j) = radiiStrong5(i);
     end
     if ((radiiStrong5(i)<7.5))
         j=j+1;        
     end
 end
 I_center=centersStrong5;
 m=0.175;
 cx=zeros(1256,1248);
 cy=zeros(1256,1248);
 c=zeros(1256,1248);
 R_l=36.4/2;
 R_s=26/2;
 R=(R_l+R_s)/2;
 D=2*R;
 w=1.3*D;
 ccc=w*2;
 for i=1: 1256
     for j =1:1248
             cx(i,j)=i;
             cy(i,j)=j;
     end
 end
 h=waitbar(0,'waiting');
 le_L=length(centersStrong5_L);
 le_s=length(centersStrong5_s);

%  ml=0.234;
%  ms=0.116;
% ml=0.202;
% ms=0.101;
 ml=0.234;
 ms=0.110;
 for i =1: le_L
      waitbar((i)/le_L)
     x=centersStrong5_L(i,1);
     y=centersStrong5_L(i,2);
     r=sqrt(((cx-x).^2+(cy-y).^2));
     u=ml*(105./(16*pi*ccc^2)).*(-3.*(r/ccc).^4+8.*(r./ccc).^3-6.*(r./ccc).^2+1);
     u(r>ccc)=0;
     c=c+u;
 end
 
 for i =1: le_s
      waitbar((i)/le_s)
     x=centersStrong5_s(i,1);
     y=centersStrong5_s(i,2);
     r=sqrt(((cx-x).^2+(cy-y).^2));
     u=ms*(105./(16*pi*ccc^2)).*(-3.*(r/ccc).^4+8.*(r./ccc).^3-6.*(r./ccc).^2+1);
     u(r>ccc)=0;
     c=c+u;
 end
 close(h)
%rho_p=0.202/(pi*R_l*R_l);
rho_p=0.202/790;
packingh=c/rho_p;
save circle11.txt -ascii packingh

imagesc(packingh)
colorbar
%caxis([0,1])
figure,imshow(A)
   viscircles(centersStrong5_L, radiiStrong5_L,'Color','b');
   hold on;
   viscircles(centersStrong5_s, radiiStrong5_s,'Color','r');
   hold off;