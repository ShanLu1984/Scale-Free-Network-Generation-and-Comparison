% This demo program is used to generate one random graph using Erdos-Renyi model; one power law graph using Barabasi-Albert model.
% Two graphs are both undirected graphs;
% Two graphs have the same mean degree;
% Two graphs have the same percentage of boundary nodes;
% Output figure: heat contents of the two graphs (black: E-R model; red: B-A model)

%Initialization

N = 1000;
mean_deg = 10;

%---------------------------------------------------------------------------------
% Generate ER graph; 2000 nodes; mean degree 15;
% Output A_er is the Adjacency matrix;

p_er = mean_deg/N;
A_er = ERModel(N, mean_deg);

% Remove isolate nodes;
A_er = remove0nodes(A_er);

% The boundary set is 2% of the total nodes; randomly selecting the nodes with the smallest degrees. 
% Output: B_er

B_er = Boundary(0.02, A_er);

% Compute eigenvalues and corresponding alpha value;
% Output: lambda_er, alpha_er;

[ lambda_er alpha_er] = coef_computing(A_er,B_er);

% Compute the theoretical heat content.
% Output: hc_er

[ hc_er ]=hc_Theoretical(lambda_er,alpha_er,'k');
hold on
%------------------------------------------------------------------------------------------

% Generate BA graph; 1000 nodes; mean degree 10;
% Output A_ba, the Adjacency matrix;

A_ba = BAModel(N,mean_deg);

% Remove isolate nodes;
A_ba = remove0nodes(A_ba);

% The boundary set is 2% of the total nodes; randomly selecting the nodes with the smallest degrees. 
% Output: B_ba

B_ba = Boundary(0.02, A_ba);

% Compute eigenvalues and corresponding alpha value;
% Output: lambda_ba, alpha_ba;

[ lambda_ba alpha_ba] = coef_computing(A_ba,B_ba);

% Compute the theoretical heat content.
% Output: hc_ba

[ hc_ba ]=hc_Theoretical(lambda_ba,alpha_ba,'r');