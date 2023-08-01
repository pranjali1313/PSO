clc;
clear;
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
   31];
st=1;
ct=3;
for i=st:ct%size(B,2)
    for j=1:size(C,2)
        S1(2)=B(1,i);
        T1(1)=C(1,j);
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
        [P1,Q1]=psa(f);
        Ac1(j,i)=P1;
        Re1(j,i)=Q1;
    end
end
A1=Ac1;
R1=Re1;
fclose all;
st=4;
ct=6;
for i=st:ct%size(B,2)
    for j=1:size(C,2)
        S1(2)=B(1,i);
        T1(1)=C(1,j);
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
        [P2,Q2]=psa(f);
        Ac2(j,i)=P2;
        Re2(j,i)=Q2;
    end
end
A2=Ac2(:,4:6);
R2=Re2(:,4:6);
fclose all;
st=7;
ct=9;
for i=st:ct%size(B,2)
    for j=1:size(C,2)
        S1(2)=B(1,i);
        T1(1)=C(1,j);
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
        [P3,Q3]=psa(f);
        Ac3(j,i)=P3;
        Re3(j,i)=Q3;
    end
end
A3=Ac3(:,7:9);
R3=Re3(:,7:9);;
fclose all;
st=10;
ct=12;
for i=st:ct%size(B,2)
    for j=1:size(C,2)
        S1(2)=B(1,i);
        T1(1)=C(1,j);
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
        [P4,Q4]=psa(f);
        Ac4(j,i)=P4;
        Re4(j,i)=Q4;
    end
end
A4=Ac4(:,10:12);
R4=Re4(:,10:12);
fclose all;
st=13;
ct=15;
for i=st:ct%size(B,2)
    for j=1:size(C,2)
        S1(2)=B(1,i);
        T1(1)=C(1,j);
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
        [P5,Q5]=psa(f);
        Ac5(j,i)=P5;
        Re5(j,i)=Q5;
    end
end
A5=Ac5(:,13:15);
R5=Re5(:,13:15);
fclose all;
st=16;
ct=18;
for i=st:ct%size(B,2)
    for j=1:size(C,2)
        S1(2)=B(1,i);
        T1(1)=C(1,j);
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
        [P6,Q6]=psa(f);
        Ac6(j,i)=P6;
        Re6(j,i)=Q6;
    end
end
A6=Ac6(:,16:18);
R6=Re6(:,16:18);
fclose all;
filename_P = 'P_data.xlsx';
filename_Q = 'Q_data.xlsx';
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
w='A':'Z';   
N=size(Bnames,1);
for i=1:size(Bnames,1)
    range=[w(i+1) '2:' w(i+1) num2str(2)];
    xlswrite('P_data.xlsx',cellstr(Bnames(i,:)),1,range)
    xlswrite('Q_data.xlsx',cellstr(Bnames(i,:)),1,range)
end
for i=1:size(Lnames,1)
    xlswrite('P_data.xlsx',cellstr(Lnames(i,:)),1,['A' num2str(i+2)])
    xlswrite('Q_data.xlsx',cellstr(Lnames(i,:)),1,['A' num2str(i+2)])
end
TA=[A1 A2 A3 A4 A5 A6];
TR=[R1 R2 R3 R4 R5 R6];
w1='A':'Z';   
N1=size(TA,2);
for i=1:N1
    range=[w1(i+1) '3:' w1(i+1) num2str(39)];
    xlswrite('P_data.xlsx',TA(:,i),1,range)
    xlswrite('Q_data.xlsx',TR(:,i),1,range)
end
toc;