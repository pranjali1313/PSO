function f=ofun(x)
% objective function (minimization)
    of=min(sqrt((x(1)-x(2))^2));
% constraints (all constraints must be converted into <=0 type)
% if there is no constraints then comments all c0 lines below
    c0=[];
    c0(1)=x(1)+x(2); % <=0 type constraints
    c0(2)=sqrt(x(1)^2+x(2)^2); % <=0 type constraints
% defining penalty for each constraint
    for i=1:length(c0)
        if c0(i)>0
            c(i)=0.2;
        else
            c(i)=0;
        end
    end
    penalty=1; % penalty on each constraint violation
    f=of+penalty*sum(c);