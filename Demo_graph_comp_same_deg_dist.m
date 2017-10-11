% 
%This demo program is used to show how to generate 
% (1) one power law graph using Barabasi-Albert model.
% (2) four other graphs with the same degree distribution.
% and it also show how to compute the heat contents to compare.
%

%Five graphs are all undirected graphs;
%Five graphs have the degree distribution;
%Five graphs have the same percentage of boundary nodes;
%Output figure: heat contents of the five graphs 
%(black: B-A model; blue: M-R model; red: Kalisky; green: Model A; magenta: Model B)

%Initialization
% N: Total number of nodes in the graph;
% mean_deg: mean degree of the graph;
% B_percentage: the percentage of boundary nodes;
% Time: heat content display time length;
% Interval: heat content display interval;

N = 2000;
mean_deg = 10;
B_percentage = 0.02;
Time = 2; 
Interval = 0.01;
%-------------------------------------------------------------------------
%-------------------------- generate a B-A graph--------------------------

% Generate BA graph; 1000 nodes; mean degree 10;
% Output A_ba, the Adjacency matrix;

A_ba = BAModel(N,mean_deg);

% Randomly selecting the nodes with the smallest degrees as boundaries. 
% Output: B_ba

B_ba = Boundary(B_percentage, A_ba);

% Compute eigenvalues and corresponding alpha value;
% Output: lambda_ba, alpha_ba;

[ lambda_ba, alpha_ba, Deg_ba] = coef_computing(A_ba,B_ba);

%-------------------------------------------------------------------------
%----------------------- Generate M-R, Kalisky,A,and B Model -------------

[A_MR] = MRModel(Deg_ba);
[A_Klsky] = KaliskyModel(Deg_ba);
[A_ModelA] = ModelA(Deg_ba);
[A_ModelB] = ModelB(Deg_ba);

B_MR = Boundary(B_percentage, A_MR);
[ lambda_MR, alpha_MR, Deg_MR] = coef_computing(A_MR, B_MR);

B_Klsky = Boundary(B_percentage, A_Klsky);
[ lambda_Klsky, alpha_Klsky, Deg_Klsky] = coef_computing(A_Klsky, B_Klsky);

B_ModelA = Boundary(B_percentage, A_ModelA);
[ lambda_ModelA, alpha_ModelA, Deg_ModelA] = coef_computing(A_ModelA, B_ModelA);

B_ModelB = Boundary(B_percentage, A_ModelB);
[ lambda_ModelB, alpha_ModelB, Deg_ModelB] = coef_computing(A_ModelB, B_ModelB);


%-------------------------------------------------------------------------
%-------------------------- Heat content comparison ----------------------

% Compute the theoretical heat content.
% Output: hc_ba, hc_MR, hc_Klsky, hc_ModelA, hc_ModelB
disp('Displaying the heat content comparisons of the graphs...')
figure;
hold on
[ hc_ba ]=hc_Theoretical(lambda_ba, alpha_ba, Time, Interval, 'k');
[ hc_MR ]=hc_Theoretical(lambda_MR, alpha_MR, Time, Interval, 'b');
[ hc_Klsky ]=hc_Theoretical(lambda_Klsky, alpha_Klsky, Time, Interval, 'r');
[ hc_ModelA ]=hc_Theoretical(lambda_ModelA, alpha_ModelA, Time, Interval, 'g');
[ hc_ModelB ]=hc_Theoretical(lambda_ModelB, alpha_ModelB, Time, Interval, 'm');

hold off
legend('B-A graph','M-R graph','Kalisky Model','Model A','Model B')