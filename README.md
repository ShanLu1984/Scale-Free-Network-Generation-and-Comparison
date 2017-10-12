# Network Generation and Comparison

## Introduction:

This projects generate random graphs using MATLAB to show the ability of heat content in distinguishing graphs. For the concept of heat content, you may refer to my paper "Complex network comparison using random walks" https://pdfs.semanticscholar.org/c7db/af648594c1a6ae476be634d8872d1ec50d1c.pdf.

For Barabási–Albert Model, you may refer to wikipedia page https://en.wikipedia.org/wiki/Barab%C3%A1si%E2%80%93Albert_model.

For Erdős–Rényi model, you may refer to wikipedia page https://en.wikipedia.org/wiki/Erd%C5%91s%E2%80%93R%C3%A9nyi_model.

Molloy-Reed Model, Kalisky Model, Model A and Model B are used to graphs with different structures given the same degree distribution. You may refer to the following paper "Scale-Free Networks with the Same Degree Distribution: Different Structural Properties" https://arxiv.org/pdf/1306.0233.pdf for detail.

## What's inside:
### Graph generating functions:

  |  function       |    model               |  output                    |
  |-----------------|------------------------| ---------------------------|
  | BAModel.m       | Barabási–Albert Model  | Adjacency Matrix: A_ba     |
  | ERMode.m        | Erdős–Rényi Model      | Adjacency Matrix: A_er     |
  | MRModel.m       | Molloy-Reed Model      | Adjacency Matrix: A_MR     |
  | KaliskyModel.m  | Kalisky Model          | Adjacency Matrix: A_Klsky  |
  | ModelA.m        | Model A                | Adjacency Matrix: A_ModelA |
  | ModelB.m        | Model B                | Adjacency Matrix: A_ModelB |
  
### Heat content computing functions:
  |  function            |    description              |  output                    |
  |----------------------|------------------------| ---------------------------|
  | hc_Theoretical.m     | Compute theoretical heat content based on input Adjacency matrix  | HeatContent |
  | hc_RWSimulation.m    | Estimate heat content based on random walk simulation     | hc_sim     |
  
  
### Demo functions:
  |  function       |    description               |  output                    |
  |-----------------|------------------------| ---------------------------|
  | Demo_graph_comp_diff_deg_dist.m   |  Generate and compare random graph with different degree distribution |  Figure  |
  | Demo_graph_comp_same_deg_dist.m   |  Generate and compare random graph with the same degree distribution  |  Figure  |
  | Demo_heat_content_comp_theoretical_vs_RW.m   | Compare heat content from theoretical computing and from random walk simulation | Figure|

### Other functions:
  |  function       |    description               |  output                    |
  |-----------------|------------------------| ---------------------------|
  | codf_computing  | Computing essential parameters based on Adjacency matrix and Boundary  | [lambda, alpha, Deg] |
  | Boundary        | Randomly select boundary nodes      | Boundary index: B |
  | remove0nodes    | Remove isolate nodes in graph      | Adjacency matrix: A |
## How to use:
1. Put all the .m files in one folder.
2. Open Matlab and change the path the the current folder.
3. To test graph comparison with different degree distribution: type "Demo_graph_comp_diff_deg_dist" in Command Window or open file "Demo_graph_comp_diff_deg_dist.m" and click "Run" button on the top bar.
4. To test graph comparison with the same degree distribution: type "Demo_graph_comp_same_deg_dist" in Command Window or open file "Demo_graph_comp_same_deg_dist.m" and click "Run" button on the top bar.
5. To test heat content comparison from theoretical computing and from random walk simulation: type "Demo_heat_content_comp_theoretical_vs_RW" in Command Window or open file "Demo_heat_content_comp_theoretical_vs_RW.m" and click "Run" button on the top bar.
