function [P,Q]=psa(f)
initpsat;
clpsat.readfile = 0;
runpsat(f,'data');
runpsat('pf');
P=sum(Bus.Pg);
Q=sum(Bus.Qg);
closepsat;