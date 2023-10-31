clc
clear

load electricity_pricing.mat


nFolds=91;
ninput=8;
noutput=2;

sourcedata=processeddataset;
[nData,nData1]=size(sourcedata);
[creditcardoutput,pendigits_Data]=modify_dataset_zero_class(sourcedata);
chunk_size=floor(nData/nFolds);
data=[sourcedata(:,1:end-1) creditcardoutput];
network=[];
counter=0;
iii=0;
for  k=1:chunk_size:nData
    
    iii=iii+1;
    
    lambdaD=min(1-exp(-counter/nFolds),0.01);
    lambdaW=min(1-exp(-counter/(nFolds-1)),0.1);
    confidenceinterval=lambdaD;
    if (k+chunk_size-1) > nData
        Data = data(k:nData,:);
        Data2 = data(k:nData,:);
        
    else
        Data = data(k:(k+chunk_size-1),:);
        if ((iii+1)*(chunk_size)) > nData
            Data2 = data(chunk_size+k:nData,:);
        else
            Data2 = data(chunk_size+k:(iii+1)*(chunk_size),:);
        end
    end
    
    Dataa=[Data; Data2];
    [r,q]=size(Data);
    [upperbound,upperboundlocation]=max(Data(:,1:ninput));
    [lowerbound,lowerboundlocation]=min(Data(:,1:ninput));
    
    

    
    fix_the_model=r;
    
    
    eta=1;
    mode='c';
    
    if iii==1   
        nRule=1;
        WT = 0.4*ones(ninput+1,noutput,nRule);
    end
        
    [y_xfuzz,Weight,rule_xfuzz,time_xfuzz,classification_rate_training_xfuzz,classification_rate_testing_xfuzz,ConMAT,ConMAT_train,ConMAT_test]=x_fuzz(Dataa,ninput,fix_the_model,eta,WT,nRule);
    nRule=rule_xfuzz(1,fix_the_model);
    WT=Weight;
    
    All_rule(iii)=nRule;
    CLR_training_all_xfuzz(iii)=classification_rate_training_xfuzz;
    CLR_testing_all_xfuzz(iii)=classification_rate_testing_xfuzz;
    ConMAT_test_all{iii}=ConMAT_test;
    
    TP = ConMAT_test(1,1);
    FP = ConMAT_test(1,2);
    TN = ConMAT_test(2,2);
    FN = ConMAT_test(2,1);
    
    Precision = TP / (TP+FP);
    Recall = TP / (TP+FN);
    
    P_all(iii)=Precision;
    R_all(iii)=Recall;
    
end

Overall_CR_best_xfuzz=max(CLR_testing_all_xfuzz)*100;
Overall_CR_avg_xfuzz=sum(CLR_testing_all_xfuzz)/nFolds*100;  fprintf('Overall_CR_mean_xfuzz:%.2f\n', Overall_CR_avg_xfuzz)
Overall_CR_std_xfuzz=std(CLR_testing_all_xfuzz)*100; fprintf('Overall_CR_std_xfuzz :%.2f\n', Overall_CR_std_xfuzz)

rule_avg_xfuzz=sum(All_rule)/nFolds;  fprintf('rule_avg_xfuzz:%.2f\n', rule_avg_xfuzz)
rule_std_xfuzz=std(All_rule); fprintf('rule_std_xfuzz :%.2f\n', rule_std_xfuzz)

Pr_avg_xfuzz=sum(P_all)/nFolds;  fprintf('Pr_avg_xfuzz:%.2f\n', Pr_avg_xfuzz)
Pr_std_xfuzz=std(P_all); fprintf('Pr_std_xfuzz :%.2f\n', Pr_std_xfuzz);

Rc_avg_xfuzz=sum(R_all)/nFolds;  fprintf('Rc_avg_xfuzz:%.2f\n', Rc_avg_xfuzz)
Rc_std_xfuzz=std(R_all); fprintf('Rc_std_xfuzz :%.2f\n', Rc_std_xfuzz);
