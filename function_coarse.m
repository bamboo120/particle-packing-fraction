ccc=1;
w=0.5;
r=0:0.001:1;
u=(105./(16*pi*ccc^2)).*(-3.*(r/ccc).^4+8.*(r./ccc).^3-6.*(r./ccc).^2+1);
r2=0:0.001:2;
uu=normpdf(r2,0,w);

ccc=2;
w=1;
r2=0:0.001:2;
u2=(105./(16*pi*ccc^2)).*(-3.*(r2/ccc).^4+8.*(r2./ccc).^3-6.*(r2./ccc).^2+1);
uu2=normpdf(r2,0,w);

ccc=1.5;
w=0.75;
r3=0:0.001:1.5;
u3=(105./(16*pi*ccc^2)).*(-3.*(r3/ccc).^4+8.*(r3./ccc).^3-6.*(r3./ccc).^2+1);
uu3=normpdf(r2,0,w);

figure;
plot(r,u,'r','LineWidth',2)
hold on;
plot(r2,uu,'b','LineWidth',2,'LineStyle','--')
hold on;
plot(r3,u3,'Color',[0.7 0 0],'LineWidth',2)
hold on;
plot(r2,uu3,'Color',[0 0.75 1],'LineWidth',2,'LineStyle','--')
hold on;
plot(r2,u2,'Color',[1 0 1],'LineWidth',2)
hold on;
plot(r2,uu2,'Color',[0 1 1],'LineWidth',2,'LineStyle','--')
hold on;

title('coarse-grained function ')
set(gca,'fontsize',20)
xlabel('r')
ylabel('coarse-grained function')
legend('lucy function w=0.5','Gaussian w=0.5','lucy function w=0.75','Gaussian w=0.75','lucy function w=1','Gaussian w=1')