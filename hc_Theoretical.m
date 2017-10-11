function [HeatContent]=hc_Theoretical(VAL,ALPHA, Time, interval, color)

t=0:interval:Time;

st=length(t);
sv=length(VAL);

% heat content computing
HeatContent=zeros(1,st);


for t_i=1:st
    ht_temp=0;
    flag=0;
    matrix_index=0;
    for i=1:sv
        
        if flag==1
            flag=0;
        else
            matrix_index=matrix_index+1;
            if i==sv
                temp=exp(-Lambda_i*t(t_i))*real(ALPHA(i));
            else
                
                Lambda_i=real(VAL(i));
                Lambda_i_next=real(VAL(i+1));
                if Lambda_i==Lambda_i_next
                    % complex eigenvalue-pair
                    flag=1;
                    temp=exp(-Lambda_i*t(t_i))*(2*real(ALPHA(i))*cos(imag(VAL(i))*t(t_i))+2*imag(ALPHA(i))*sin(imag(VAL(i))*t(t_i)));
                else
                    % real eigenvalue
                    temp=exp(-Lambda_i*t(t_i))*real(ALPHA(i));
                end
            end
            ht_temp=ht_temp+temp;
        end
    end
    HeatContent(1,t_i)=ht_temp;
end


%normalization
hc_sum=HeatContent(1,1);
HeatContent=HeatContent/hc_sum;

%heat content is plotted

plot(t,HeatContent,color,'LineWidth',1);

