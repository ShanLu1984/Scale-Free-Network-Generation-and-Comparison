% 
%This demo program is used to show how to generate 
% (1) one random graph using Erdos-Renyi model and 
% (2) one power law graph using Barabasi-Albert model.
% and it also show how to compute the heat contents to compare.
%
%Two graphs are both undirected graphs;
%Two graphs have the same mean degree;
%Two graphs have the same percentage of boundary nodes;
%Output figure: heat contents of the two graphs (black: E-R model; red: B-A model)

%Initialization
% N: Total number of nodes in the graph;
% mean_deg: mean degree of the graph;
% B_percentage: the percentage of boundary nodes;
% Time: heat content display time length;
% Interval: heat content display interval;
% Initial_walker: intial random walkers on each node;

N = 1000;
mean_deg = 10;
B_percentage = 0.02;
Time = 5; 
Interval = 0.01; 
Initial_walker = 10;

%------------------------------------------------------------------------
%---------------------------- Generate a E-R graph-----------------------

% Generate E-R graph;
% Output A_er is the Adjacency matrix;
A_er = ERModel(N, mean_deg);

%Randomly selecting the nodes with the smallest degrees as the boundaries
% Output: B_er
B_er = Boundary(B_percentage , A_er);

% Compute eigenvalues and corresponding alpha value;
% Output: lambda_er, alpha_er;
[ lambda_er, alpha_er, Deg_er] = coef_computing(A_er,B_er);


%-------------------------------------------------------------------------
%-------------------------- generate a B-A graph--------------------------

% Generate B-A graph;
% Output A_ba, the Adjacency matrix;
A_ba = BAModel(N,mean_deg);

%Randomly selecting the nodes with the smallest degrees as the boundaries
% Output: B_ba
B_ba = Boundary(B_percentage, A_ba);

% Compute eigenvalues and corresponding alpha value;
% Output: lambda_ba, alpha_ba;
[ lambda_ba, alpha_ba, D_ba] = coef_computing(A_ba, B_ba);


%-------------------------------------------------------------------------
%-------------------------- Heat content comparison ----------------------

% Compute the theoretical heat content.
% Output: hc_er, hc_ba
disp('Displaying the heat content comparisons of the graphs...')
figure;
hold on
[ hc_er ]=hc_Theoretical(lambda_er, alpha_er, Time, Interval, 'k');
[ hc_ba ]=hc_Theoretical(lambda_ba, alpha_ba, Time, Interval, 'r');
hold off
legend('E-R graph','B-A graph')