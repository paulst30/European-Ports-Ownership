# European-Ports-Ownership
This repository accompanies the paper 'European ports development under Chinese investments' available on SSRN [here](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4976399). 


## Replication 
### Download files and install package
The scripts reproduce all the results presented in the paper. The following steps are necessary before running the scripts: 

1. Download and install our Difference in Difference package:

```
    library(devtools)

    install_github("paulst30/counterfactual_inference")
```

2. Download the container throughput data [here](https://drive.google.com/drive/folders/1rqlXxkYFbFRuLsu8Cy5LnupaLJyjd5Ht?usp=sharing).
   You can use the scripts `download_TEU.R`, `download_TEU_inflow.R`, and `download_TEU_outflow.R` to download the container data from Eurostat directly. However, this might lead to different results as historical data is sometimes revised.

### Run the scripts
The scripts produce the following results: 

`Descriptives.rmd`: Produces time-series graphs and European port landscape graph.

`Estimation.rmd`: Produces fixed effects results, the baseline DiD results, and the event study graph.

`Robustness.rmd`: Produces terminal-level analysis, the terminal-level time-series graph, and the China-share robustness check. 

`Reshuffling_direction_region_analysis.rmd`: Produces the reshuffling results.

`Extensive_intensive_margins.rmd`: Produces the extensive intensive margin results. 

`policytoolfinal.rmd`: Produces the policy tool investment analysis including the associated graphs.

