clc;
clear;
rng default;
tic;

fid = fopen('gov_2.m');
tline = fgetl(fid);
tlines = cell(0,1);
while ischar(tline)
    tlines{end+1,1} = tline;
    disp(tline)
    tline = fgetl(fid);
end
fclose(fid);
S1=str2num(cell2mat(tlines(75)));
T1=str2num(cell2mat(tlines(123)));

B=[2 4 6 7 8 9 10 11 13 14 15 16 17 18 19 20 22 24];
C=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 25 26 27 28 29 30....
   31];% 32 33 34 35 36 37 38];
m=2;% number of variables
n=20;% population size
for i=1:n
    for j=1:m
        rb=B(end,randperm(size(B,2), 1));
        Bat(i,j)=rb;
        rc=C(end,randperm(size(C,2), 1));
        Cat(i,j)=rc;
   end 
end

for i=1:n
    for j=1:m
        Z=[Bat(i,j) Cat(i,j)];
        Y(i,j)={Z};
    end
end
zy=[17*ones(1) 28*ones(1)];
Y=cell2mat(Y(:));
Z_Y=[Y(1:2*n-1,:);zy];
ZY=sortrows(Z_Y);
%ZY=[Z_Y(1:2*n-1,:);zy];
for i=1:length(ZY)
        S1(2)=ZY(i,1);
        T1(1)=ZY(i,2);
        c={S1};
        d={';'};
        b={T1};
        a={';'};
        T2= cellfun(@(a,b) [num2str(b) a ' '],a,b,'uniformoutput',false);
        S2= cellfun(@(d,c) [num2str(c) d ' '],d,c,'uniformoutput',false);
        tlines(75)=S2;
        tlines(123)=T2;
        Fid = fopen('Xfile.m','w');
        for jj = 1:size(tlines,1)
            fprintf( Fid, '%s\n', tlines{jj,1} );
        end
        f='Xfile.m';
        [P,Q]=psa(f);
        Ac(i,1)=P;
        Re(i,1)=Q;
end
xt=[Ac Re];
xn=xt;
xm=sum(xt,2);
%x=xt;
fclose all;
maxite=10;
maxrun=2;
m=3;% No of particles

wmax=0.9; % inertia weight
wmin=0.4; % inertia weight
c1=2; % acceleration factor
c2=2;
LB=1*ones(1:m); %lower bounds of variables
UB=5*ones(1:m); %upper bounds of variables
xt=repmat(xm,2*n,m);
for run=1:maxrun
% pso initialization----------------------------------------------start
    for i=1:2*n
        for j=1:m
            x0(i,j)=round(LB(j)+rand()*(UB(j)-LB(j)));
        end
    end
    x=x0; % initial population
    v=0.1*x0; % initial velocity
    for i=1:2*n 
        f0(i,1)=ofun(x0(i,:));
    end
    f01=f0;
    [fmin0,index0]=min(f0);
    pbest=x0; % initial pbest
    gbest=x0(index0,:);
    g_best=gbest;
    ite=1;
    tolerance=1;
    while ite<=maxite && tolerance>10^-12
        w=wmax-(wmax-wmin)*ite/maxite; % update inertial weight
        for i=1:2*n
            for j=1:m
                v(i,j)=w*v(i,j)+c1*rand()*(pbest(i,j)-xt(i,j))...
                +c2*rand()*(gbest(1,j)-xt(i,j));
            end
        end
        for i=1:2*n
            for j=1:m
                xt(i,j)=xt(i,j)+v(i,j);
                %xt(i,j)=x(i,j);
            end
        end
        for i=1:2*n
            for j=1:m
                if xt(i,j)<LB(j)
                    xt(i,j)=LB(j);
                elseif xt(i,j)>UB(j)
                    xt(i,j)=UB(j);
                end
            end
        end
        for i=1:2*n
            f1(i,1)=ofun(xt(i,:));
        end
        xp=xt;
        f11=f1;
        for i=1:2*n
            if f1(i,1)<f0(i,1)
                pbest(i,:)=xt(i,:);
                f0(i,1)=f1(i,1);
            end
        end
        [fmin,index]=min(f0); % finding out the best particle
        ffmin(ite,run)=fmin; % storing best fitness
        ffite(run)=ite; % storing iteration count
        if fmin<fmin0
            gbest=pbest(index,:);
            fmin0=fmin;
        end
        if ite>100
            tolerance=abs(ffmin(ite-100,run)-fmin0);
        end
        ite=ite+1;
        gbest;
        fvalue=sqrt((gbest(1)-1)^2+(gbest(2)-2)^2);
        fff(run)=fvalue;
        rgbest(run,:)=gbest;
        
    end
end

for i = 1: size(f1,1)
    A(i,1)=abs(2-(f0(i,1)+f1(i,1)));
        if A(i,1) <0.05 
            if f0(i,1)~=fmin0
                mst(i,1)=i;
                lst(i,1)=f0(i,1);
            end
        end
end
f01=f0+f1;
lst(lst==0)=[];
mst(mst==0)=[];
MT=[lst mst];
[fm,idx]=min(MT(:,1));
indx=MT(idx,2);
ZX=ZY(indx,:);
Bnames=['Bus10';'Bus12';'Bus14'; 'Bus15';'Bus16';'Bus17';'Bus18';'Bus19';'Bus20';'Bus21';'Bus22';....
    'Bus23';'Bus24';'Bus25';'Bus26';'Bus27';'Bus29';'Bus30'];
Lnames=[....
    'L_01_03';'L_25_26';'L_15_18';'L_12_16';'L_02_05';'L_04_06';....
    'L_02_06';'L_18_19';'L_16_17';'L_10_22';'L_15_23';'L_21_22';....
    'L_10_21';'L_06_28';'L_12_14';'L_14_15';'L_12_15';'L_19_20';....
    'L_02_04';'L_10_20';'L_10_17';'L_08_28';'L_06_08';'L_06_07';....
    'L_05_07';'L_03_04';'L_22_24';'L_27_29';'L_29_30';'L_27_30';....
    'L_25_27';'L_24_25';'L_12_13';'L_06_09';'L_01_02';'L_09_11';'L_09_10';
    ];
Bnam=[B' [1:length(B)]'];
Lnam=[C' [1:length(C)]'];
for i=1:length(B)
    if Bnam(i,1)==ZX(:,1)
        Bn(i,:)=Bnam(i,2);
    end
end
Bn(Bn==0)=[];

for i=1:length(C)
    if Lnam(i,1)==ZX(:,2)
        Ln(i,:)=Lnam(i,2);
    end
end
Ln(Ln==0)=[];
for i=1:length(ZY)
    if ZY(i,1)==ZX(1,1)&& ZY(i,2)==ZX(1,2)
        tp(i)=i;
    end
end
tp(tp==0)=[];

disp(sprintf('\n'));
disp(sprintf('*********************************************************'));
disp(sprintf('Final Results-----------------------------'));
Best_DFIG_connected_bus=Bnames(Bn,:)
Best_UPFC_connected_bus=Lnames(Ln,:)
Total_Active_Power=Ac(tp)
Total_Rective_Power=Re(tp)
disp(sprintf('*********************************************************'));
toc;
