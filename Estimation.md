---
title: "Estimation"
author: "Paul Stricker"
bibliography: literature_list.bib
date: "2023-11-29"
output: 
 html_document:
      keep_md: true
---






# Baseline equation (fixed effects)

In the first attempt, a simple fixed effects model and aggregated data on container throughput is used to identify the effect of Chinese port ownership. The effect of chinese ownership is included in form of a dummy variable (ChineseControl_it) that is set to one when the ownership (at least partly) transfered to a Chinese company (needs clarification).

$Thrpt_{it}=\alpha_{i}+\gamma_{t}+ChineseOwnership_{it}+e_{it}$ \left (1)

Second, we leverage the bilateral structure of the data, and use the variation between sender country and receiving port over time. The advantage of this approach is, that we can use higher levels of fixed effects, which enable much more precise control over which variation is used to identify the treatment effect. We proceed by estimating multipe equations with different levels of fixed effects with increasing restrictiveness.

$Thrpt_{ijt}=\alpha_{i}+\beta_{j}+\gamma_{t}+ChineseOwnership_{it}+ChineseOwnership_{it}*ChineseOrigin_{ij}+e_{ijt}$ \left (2)

In equation (1), the quarterly ($t$) container throughput ($Thrpt$) is explained by a set of port fixed-effects ($\alpha_{i}$), sender country fixed effects (\beta_{j}), and time fixed effects (\gamma_{t}). This specification controls for all time-invariant port-specific, and all time-invariant sender-specific unobserved covariates. The time fixed effects account for common shocks that affect all European ports equally.  

$Thrpt_{ijt}=\alpha_{ij}+\gamma_{t}+ChineseOwnership_{it}}+ChineseOwnership_{it}*ChineseOrigin_{ij}+e_{ijt}$ \left (3)

Equation (2) increases the restrictiveness of th fixed effects by replacing the port-level fixed effects with port-sender fixed effects. This set of fixed effects controls for all time-invariant sender-port specfic covariates like regular shipping routes and preferences. This setup is often referred to as a difference-in-differences (DiD) set-up, as in the two-period case, equation (2) estimates a standard DiD effect. However, recent studies have shown, that this similarity does not extend to the multi-period case. 

$Thrpt_{ijt}=\alpha_{ij}+\beta_{jt}++ChineseOwnership_{it}+ChineseOwnership_{it}*ChineseOrigin_{ij}+e_{ijt}$ \left (4)

Equation (3) adds another dimension to the fixed effects. In addition to controlling for sender-port time-invariant covariates, it also controls for sender-time fixed effects. These encapsule all sender-time varying covariates like production shocks or supply shortages (as in the case of the blocked Suez Canal in 2021).

$Thrpt_{ijt}=\alpha_{ij}+\beta_{jt}++ChineseOwnership_{it}+ChineseOwnership_{it}*ChineseOrigin_{ij}+ChineseOperation_{it}+e_{ijt}$ \left (5)

Lastly, we add another Dummy variable $ChineseOperation_{it}$, which indicates whether a Chinese company is involved in the operation of the port or whether it just holds equity shares. 





```
##                                            spec1                spec2
##                                            Eq. 1                Eq. 2
## Dependent Var.:                        container            container
##                                                                      
## ownership_china            146,727.1* (70,739.9)      585.4 (1,441.9)
## s_china                                                -6,774.8 (0.9)
## ownership_china x s_china                        58,325.9. (33,689.5)
## operation                                                            
## Fixed Effects              --------------------- --------------------
## port_code                                    yes                     
## period                                       yes                  yes
## reporter_code-period                         yes                     
## port                                                              yes
## sender                                                            yes
## port-sender                                                          
## sender-period                                                        
## _________________________  _____________________ ____________________
## S.E.: Clustered           by: port_code & period    by: port & sender
## Observations                              11,551              388,820
## R2                                       0.92030              0.23615
## Within R2                                0.03340              0.03665
## 
##                                          spec3                spec4
##                                          Eq. 3                 Eq.4
## Dependent Var.:                      container            container
##                                                                    
## ownership_china              1,253.2** (392.6)   2,087.4*** (357.2)
## s_china                                                            
## ownership_china x s_china 30,529.3* (15,121.0) 19,469.3. (10,820.8)
## operation                                                          
## Fixed Effects             -------------------- --------------------
## port_code                                                          
## period                                     yes                     
## reporter_code-period                                               
## port                                                               
## sender                                                             
## port-sender                                yes                  yes
## sender-period                                                   yes
## _________________________ ____________________ ____________________
## S.E.: Clustered              by: port. & peri.    by: port. & send.
## Observations                           388,820              388,820
## R2                                     0.78364              0.80578
## Within R2                              0.02011              0.01082
## 
##                                          spec5              spec6
##                                           Eq.5               Eq.6
## Dependent Var.:                      container          container
##                                                                  
## ownership_china             1,907.2*** (374.0) 1,527.2*** (379.2)
## s_china                                                          
## ownership_china x s_china 19,324.0. (10,773.4)                   
## operation                      1,318.3 (880.4)                   
## Fixed Effects             -------------------- ------------------
## port_code                                                        
## period                                                           
## reporter_code-period                                          yes
## port                                                             
## sender                                                           
## port-sender                                yes                yes
## sender-period                              yes                yes
## _________________________ ____________________ __________________
## S.E.: Clustered              by: port. & send.  by: port. & send.
## Observations                           388,820            388,820
## R2                                     0.80586            0.81201
## Within R2                              0.01121            0.00097
## ---
## Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

While the fixed effects identification strategy presented above is a common one in the literature, many authors criticize the model fo its lack of interpretable results. In particular, it is often unclear how the coefficients in fixed effects models are obtained and which units have served as comparisons to treated units, especially when the treatment timing varies between units. @Chaisemartin.2020 and @Borusyak.2022 find that the treatment effect estimated by two-way fixed effects models (as in equation (2)) is a weighted average of time-specific treatment effects with some weights potentially being negative. In extreme cases, this can cause negative coefficients although all time-specific treatment effects are positive. @GoodmanBacon.2021 point out that the estimator can be seen as a weighted average of all possible comparisons between treated, untreated, and not-yet-treated units, with the weights depending on treatment timing and the number of observations and conclude that a fixed effects set should be avoided, when the treatment effect is likely to vary over time.  

Another common issue is finding reasonable counterfactuals when interpreting the coefficients from fixed effects models. @Mummolo.2018 notes that researchers tend to present unrealistic counterfactuals when using fixed effects regression. Since fixed effect models only use a fraction of the variance to estimate the coefficients, interpreting the model with counterfactuals that are drawn from the original distribution of the data often leads to unrealistically high effects that sometimes falsely imply economically relevant effect sizes. Additionally, the major benefit of fixed effects, the ability to control for unobserved covariates, critically depends on the linear additive assumption [@Imai.2021]. In cases where the variation can be attributed to several dimensions of fixed effects, the estimator is undefined [@Kropko.2020].


# Difference in Differences

To address these shortcomings, we use recent advances in the DiD literature, and employ a staggered DiD estimator by @Callaway.2021. They formulate a unified approach to estimating average treatment effects in a DiD framework with multiple periods and varying treatment timing that avoids all above described interpretation issues. They define group-time average treatment effects, which measure the average treatment effect for a group of units that receive the treatment at the same point in time. In a later step, these group-time average treatment effects can be aggregated either by time period or group to derive an overall average treatment effect. Another advantage of their approach is that it gives the research the liberty to choose which comparison group should be used to calculate the treatment effects. That is, whether the comparison group includes only never-treated or not-yet-treated units. This translates to two parallel trend assumptions. When the comparison group is made up of never treated units:

$E[Y_{t}(0)-Y_{t-1}(0)|G=g]=E[Y_{t}(0)-Y_{t-1}(0)|C=1]$ 
with $g\leq t$ \left (6)

Where $Y_{t}(0)$ denotes the potential untreated outcome in period t, $G$ indicates the period a unit is first treated, and $C$ is an indicator that takes the value of one if a unit is never treated. Hence, the first term of the equation above denotes the difference between untreated outcomes of period t and period t-1 for units while they are treated, and the second term denotes the difference between potential outcomes of periods t and t-1 for units that are never treated. In a setting with staggered treatment, random sampling, and not treatment anticipation, the above parallel trend assumption leads the following group-time average treatment effects: 

$ATT(g,t)=E[Y_{t}(g)-Y_{t}(0)|G=g]=E[Y_{t}-Y_{g-1}|G=g]-E[Y_{t}-Y_{g-1}|C=1]$ \left (7)

Where $Y_{t}(g)$ denotes the treated outcome in period $t$, $Y_{t}$ denotes the observed outcome in period $t$. Hence, the average $ATT(g,t)$ represents the average effect of treatment in period t for units that are first treated in period g. To derive at an overall average treatment effect, we use a simple aggregation scheme as proposed by @Callaway.2021, which weights each ATT by the size of the group. 







```{=html}
<div id="isscaxkygg" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#isscaxkygg table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#isscaxkygg thead, #isscaxkygg tbody, #isscaxkygg tfoot, #isscaxkygg tr, #isscaxkygg td, #isscaxkygg th {
  border-style: none;
}

#isscaxkygg p {
  margin: 0;
  padding: 0;
}

#isscaxkygg .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#isscaxkygg .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#isscaxkygg .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#isscaxkygg .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#isscaxkygg .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#isscaxkygg .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#isscaxkygg .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#isscaxkygg .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#isscaxkygg .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#isscaxkygg .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#isscaxkygg .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#isscaxkygg .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#isscaxkygg .gt_spanner_row {
  border-bottom-style: hidden;
}

#isscaxkygg .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#isscaxkygg .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#isscaxkygg .gt_from_md > :first-child {
  margin-top: 0;
}

#isscaxkygg .gt_from_md > :last-child {
  margin-bottom: 0;
}

#isscaxkygg .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#isscaxkygg .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#isscaxkygg .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#isscaxkygg .gt_row_group_first td {
  border-top-width: 2px;
}

#isscaxkygg .gt_row_group_first th {
  border-top-width: 2px;
}

#isscaxkygg .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#isscaxkygg .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#isscaxkygg .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#isscaxkygg .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#isscaxkygg .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#isscaxkygg .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#isscaxkygg .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#isscaxkygg .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#isscaxkygg .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#isscaxkygg .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#isscaxkygg .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#isscaxkygg .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#isscaxkygg .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#isscaxkygg .gt_left {
  text-align: left;
}

#isscaxkygg .gt_center {
  text-align: center;
}

#isscaxkygg .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#isscaxkygg .gt_font_normal {
  font-weight: normal;
}

#isscaxkygg .gt_font_bold {
  font-weight: bold;
}

#isscaxkygg .gt_font_italic {
  font-style: italic;
}

#isscaxkygg .gt_super {
  font-size: 65%;
}

#isscaxkygg .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#isscaxkygg .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#isscaxkygg .gt_indent_1 {
  text-indent: 5px;
}

#isscaxkygg .gt_indent_2 {
  text-indent: 10px;
}

#isscaxkygg .gt_indent_3 {
  text-indent: 15px;
}

#isscaxkygg .gt_indent_4 {
  text-indent: 20px;
}

#isscaxkygg .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="7" class="gt_heading gt_title gt_font_normal" style>Aggregation of group time average treatment effects</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="7" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>Control group: Never treated</td>
    </tr>
    <tr class="gt_col_headings gt_spanner_row">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id=""></th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="uncond. PTA">
        <span class="gt_column_spanner">uncond. PTA</span>
      </th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="cond. PTA">
        <span class="gt_column_spanner">cond. PTA</span>
      </th>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="ATT">ATT</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="[95%">[95%</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="conf.int.]">conf.int.]</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="ATT">ATT</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="[95%">[95%</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="conf.int.]">conf.int.]</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <th colspan="7" class="gt_empty_group_heading" scope="colgroup" id=""></th>
    </tr>
    <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">simple average</th>
<td headers="NA stub_1_1 ATT.x" class="gt_row gt_right">212,233.22<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="NA stub_1_1 lower.x" class="gt_row gt_right">29,752.72</td>
<td headers="NA stub_1_1 upper.x" class="gt_row gt_right">394,713.71</td>
<td headers="NA stub_1_1 ATT.y" class="gt_row gt_right">106,024.95<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="NA stub_1_1 lower.y" class="gt_row gt_right">7,805.53</td>
<td headers="NA stub_1_1 upper.y" class="gt_row gt_right">204,244.36</td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="7" class="gt_group_heading" scope="colgroup" id="by group:">by group:</th>
    </tr>
    <tr class="gt_row_group_first"><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Ambarli (76)</th>
<td headers="by group: stub_1_2 ATT.x" class="gt_row gt_right">−38,788.63</td>
<td headers="by group: stub_1_2 lower.x" class="gt_row gt_right">−185,635.86</td>
<td headers="by group: stub_1_2 upper.x" class="gt_row gt_right">108,058.60</td>
<td headers="by group: stub_1_2 ATT.y" class="gt_row gt_right">−28,743.89</td>
<td headers="by group: stub_1_2 lower.y" class="gt_row gt_right">−135,030.16</td>
<td headers="by group: stub_1_2 upper.y" class="gt_row gt_right">77,542.38</td></tr>
    <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">Amsterdam, Thessaloniki (85)</th>
<td headers="by group: stub_1_3 ATT.x" class="gt_row gt_right">−2,238.48</td>
<td headers="by group: stub_1_3 lower.x" class="gt_row gt_right">−218,443.54</td>
<td headers="by group: stub_1_3 upper.x" class="gt_row gt_right">213,966.59</td>
<td headers="by group: stub_1_3 ATT.y" class="gt_row gt_right">−3,833.61</td>
<td headers="by group: stub_1_3 lower.y" class="gt_row gt_right">−16,298.63</td>
<td headers="by group: stub_1_3 upper.y" class="gt_row gt_right">8,631.42</td></tr>
    <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">Antwerpen (32)</th>
<td headers="by group: stub_1_4 ATT.x" class="gt_row gt_right">866,346.94<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_4 lower.x" class="gt_row gt_right">764,641.09</td>
<td headers="by group: stub_1_4 upper.x" class="gt_row gt_right">968,052.79</td>
<td headers="by group: stub_1_4 ATT.y" class="gt_row gt_right">427,729.36<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_4 lower.y" class="gt_row gt_right">195,722.90</td>
<td headers="by group: stub_1_4 upper.y" class="gt_row gt_right">659,735.82</td></tr>
    <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Barcelona (63)</th>
<td headers="by group: stub_1_5 ATT.x" class="gt_row gt_right">213,341.43<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_5 lower.x" class="gt_row gt_right">94,203.74</td>
<td headers="by group: stub_1_5 upper.x" class="gt_row gt_right">332,479.11</td>
<td headers="by group: stub_1_5 ATT.y" class="gt_row gt_right">225,724.52<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_5 lower.y" class="gt_row gt_right">122,117.43</td>
<td headers="by group: stub_1_5 upper.y" class="gt_row gt_right">329,331.60</td></tr>
    <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">Bilbao, Valencia (84)</th>
<td headers="by group: stub_1_6 ATT.x" class="gt_row gt_right">−2,871.33</td>
<td headers="by group: stub_1_6 lower.x" class="gt_row gt_right">−252,138.27</td>
<td headers="by group: stub_1_6 upper.x" class="gt_row gt_right">246,395.60</td>
<td headers="by group: stub_1_6 ATT.y" class="gt_row gt_right">22,420.17</td>
<td headers="by group: stub_1_6 lower.y" class="gt_row gt_right">−50,019.40</td>
<td headers="by group: stub_1_6 upper.y" class="gt_row gt_right">94,859.75</td></tr>
    <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">Dunkerque, Le Havre, Marsaxlokk, Marseille, Nantes Saint Nazaire, Zeebrugge (66)</th>
<td headers="by group: stub_1_7 ATT.x" class="gt_row gt_right">1,349.26</td>
<td headers="by group: stub_1_7 lower.x" class="gt_row gt_right">−437,454.75</td>
<td headers="by group: stub_1_7 upper.x" class="gt_row gt_right">440,153.27</td>
<td headers="by group: stub_1_7 ATT.y" class="gt_row gt_right">−1,084.51</td>
<td headers="by group: stub_1_7 lower.y" class="gt_row gt_right">−63,838.87</td>
<td headers="by group: stub_1_7 upper.y" class="gt_row gt_right">61,669.84</td></tr>
    <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">Gdynia (38)</th>
<td headers="by group: stub_1_8 ATT.x" class="gt_row gt_right">39,404.22</td>
<td headers="by group: stub_1_8 lower.x" class="gt_row gt_right">−67,800.42</td>
<td headers="by group: stub_1_8 upper.x" class="gt_row gt_right">146,608.85</td>
<td headers="by group: stub_1_8 ATT.y" class="gt_row gt_right">22,332.38<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_8 lower.y" class="gt_row gt_right">7,101.93</td>
<td headers="by group: stub_1_8 upper.y" class="gt_row gt_right">37,562.82</td></tr>
    <tr><th id="stub_1_9" scope="row" class="gt_row gt_left gt_stub">Genova (81)</th>
<td headers="by group: stub_1_9 ATT.x" class="gt_row gt_right">57,295.85</td>
<td headers="by group: stub_1_9 lower.x" class="gt_row gt_right">−99,442.75</td>
<td headers="by group: stub_1_9 upper.x" class="gt_row gt_right">214,034.45</td>
<td headers="by group: stub_1_9 ATT.y" class="gt_row gt_right">83,574.61<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_9 lower.y" class="gt_row gt_right">50,347.68</td>
<td headers="by group: stub_1_9 upper.y" class="gt_row gt_right">116,801.54</td></tr>
    <tr><th id="stub_1_10" scope="row" class="gt_row gt_left gt_stub">Moerdijk, Rotterdam (21)</th>
<td headers="by group: stub_1_10 ATT.x" class="gt_row gt_right">346,145.31</td>
<td headers="by group: stub_1_10 lower.x" class="gt_row gt_right">−3,606,408.66</td>
<td headers="by group: stub_1_10 upper.x" class="gt_row gt_right">4,298,699.28</td>
<td headers="by group: stub_1_10 ATT.y" class="gt_row gt_right">63,913.61</td>
<td headers="by group: stub_1_10 lower.y" class="gt_row gt_right">−69,020.47</td>
<td headers="by group: stub_1_10 upper.y" class="gt_row gt_right">196,847.70</td></tr>
    <tr><th id="stub_1_11" scope="row" class="gt_row gt_left gt_stub">Piraeus (52)</th>
<td headers="by group: stub_1_11 ATT.x" class="gt_row gt_right">702,775.04<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_11 lower.x" class="gt_row gt_right">575,268.57</td>
<td headers="by group: stub_1_11 upper.x" class="gt_row gt_right">830,281.51</td>
<td headers="by group: stub_1_11 ATT.y" class="gt_row gt_right">569,268.34<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_11 lower.y" class="gt_row gt_right">489,101.50</td>
<td headers="by group: stub_1_11 upper.y" class="gt_row gt_right">649,435.18</td></tr>
  </tbody>
  
  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="7"> First treatment period in brackets.</td>
    </tr>
    <tr>
      <td class="gt_footnote" colspan="7"><span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span> Confidence interval does not include zero.</td>
    </tr>
  </tfoot>
</table>
</div>
```


One potential issue, that above DiD model may have is endogeneity. In particular, ports may be selected into treatment based on their throughput in the past. If that is the case, untreated units do not pose a credible comparison group to estimate treatment effects. To alleviate those concerns, we reestimate the treatment effects adding the not yet treated observations as the comparison group. Following @Callaway.2021, the underlying parallel trend assumption is then: 

$E[Y_{t}-Y_{t-1}|G=g]=E[Y_{t}-Y_{t-1}|D_{t}=0, G\neq g]$ with $g\leq t$ \left (8)

Where $D_{t}$ is an binary variable indicating whether a unit is treated in period t. The new parallel trend assumption then leads to the following group-time average treatment effects:

$ATT(g,t)=E[Y_{t}(g)-Y_{t}(0)|G=g]=E[Y_{t}-Y_{g-1}|G=g]-E[Y_{t}-Y_{g-1}|D_{t}=0, G\neq g]$ \left (9)

Hence $ATT(g,t)$ represents the average treatment effect of group $G$ in period $t$ in comparison to not yet treated units (and untreated units). 






```{=html}
<div id="tuilvwcxrp" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#tuilvwcxrp table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#tuilvwcxrp thead, #tuilvwcxrp tbody, #tuilvwcxrp tfoot, #tuilvwcxrp tr, #tuilvwcxrp td, #tuilvwcxrp th {
  border-style: none;
}

#tuilvwcxrp p {
  margin: 0;
  padding: 0;
}

#tuilvwcxrp .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#tuilvwcxrp .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#tuilvwcxrp .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#tuilvwcxrp .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#tuilvwcxrp .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#tuilvwcxrp .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#tuilvwcxrp .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#tuilvwcxrp .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#tuilvwcxrp .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#tuilvwcxrp .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#tuilvwcxrp .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#tuilvwcxrp .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#tuilvwcxrp .gt_spanner_row {
  border-bottom-style: hidden;
}

#tuilvwcxrp .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#tuilvwcxrp .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#tuilvwcxrp .gt_from_md > :first-child {
  margin-top: 0;
}

#tuilvwcxrp .gt_from_md > :last-child {
  margin-bottom: 0;
}

#tuilvwcxrp .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#tuilvwcxrp .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#tuilvwcxrp .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#tuilvwcxrp .gt_row_group_first td {
  border-top-width: 2px;
}

#tuilvwcxrp .gt_row_group_first th {
  border-top-width: 2px;
}

#tuilvwcxrp .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#tuilvwcxrp .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#tuilvwcxrp .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#tuilvwcxrp .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#tuilvwcxrp .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#tuilvwcxrp .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#tuilvwcxrp .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#tuilvwcxrp .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#tuilvwcxrp .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#tuilvwcxrp .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#tuilvwcxrp .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#tuilvwcxrp .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#tuilvwcxrp .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#tuilvwcxrp .gt_left {
  text-align: left;
}

#tuilvwcxrp .gt_center {
  text-align: center;
}

#tuilvwcxrp .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#tuilvwcxrp .gt_font_normal {
  font-weight: normal;
}

#tuilvwcxrp .gt_font_bold {
  font-weight: bold;
}

#tuilvwcxrp .gt_font_italic {
  font-style: italic;
}

#tuilvwcxrp .gt_super {
  font-size: 65%;
}

#tuilvwcxrp .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#tuilvwcxrp .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#tuilvwcxrp .gt_indent_1 {
  text-indent: 5px;
}

#tuilvwcxrp .gt_indent_2 {
  text-indent: 10px;
}

#tuilvwcxrp .gt_indent_3 {
  text-indent: 15px;
}

#tuilvwcxrp .gt_indent_4 {
  text-indent: 20px;
}

#tuilvwcxrp .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="7" class="gt_heading gt_title gt_font_normal" style>Aggregation of group time average treatment effects</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="7" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>Control group: Not yet treated</td>
    </tr>
    <tr class="gt_col_headings gt_spanner_row">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id=""></th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="uncond. PTA">
        <span class="gt_column_spanner">uncond. PTA</span>
      </th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="cond. PTA">
        <span class="gt_column_spanner">cond. PTA</span>
      </th>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="ATT">ATT</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="[95%">[95%</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="conf.int.]">conf.int.]</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="ATT">ATT</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="[95%">[95%</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="conf.int.]">conf.int.]</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <th colspan="7" class="gt_empty_group_heading" scope="colgroup" id=""></th>
    </tr>
    <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">simple average</th>
<td headers="NA stub_1_1 ATT.x" class="gt_row gt_right">158,597.32</td>
<td headers="NA stub_1_1 lower.x" class="gt_row gt_right">−38,850.18</td>
<td headers="NA stub_1_1 upper.x" class="gt_row gt_right">356,044.83</td>
<td headers="NA stub_1_1 ATT.y" class="gt_row gt_right">166,504.33<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="NA stub_1_1 lower.y" class="gt_row gt_right">3,176.30</td>
<td headers="NA stub_1_1 upper.y" class="gt_row gt_right">329,832.35</td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="7" class="gt_group_heading" scope="colgroup" id="by group:">by group:</th>
    </tr>
    <tr class="gt_row_group_first"><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Ambarli (76)</th>
<td headers="by group: stub_1_2 ATT.x" class="gt_row gt_right">−43,370.01<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_2 lower.x" class="gt_row gt_right">−58,962.03</td>
<td headers="by group: stub_1_2 upper.x" class="gt_row gt_right">−27,777.98</td>
<td headers="by group: stub_1_2 ATT.y" class="gt_row gt_right">582,314.06<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_2 lower.y" class="gt_row gt_right">515,406.64</td>
<td headers="by group: stub_1_2 upper.y" class="gt_row gt_right">649,221.49</td></tr>
    <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">Antwerpen (32)</th>
<td headers="by group: stub_1_3 ATT.x" class="gt_row gt_right">578,043.76<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_3 lower.x" class="gt_row gt_right">445,871.81</td>
<td headers="by group: stub_1_3 upper.x" class="gt_row gt_right">710,215.70</td>
<td headers="by group: stub_1_3 ATT.y" class="gt_row gt_right">562,513.85<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_3 lower.y" class="gt_row gt_right">471,240.78</td>
<td headers="by group: stub_1_3 upper.y" class="gt_row gt_right">653,786.91</td></tr>
    <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">Barcelona (63)</th>
<td headers="by group: stub_1_4 ATT.x" class="gt_row gt_right">69,049.79<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_4 lower.x" class="gt_row gt_right">37,117.15</td>
<td headers="by group: stub_1_4 upper.x" class="gt_row gt_right">100,982.43</td>
<td headers="by group: stub_1_4 ATT.y" class="gt_row gt_right">57,638.95<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_4 lower.y" class="gt_row gt_right">37,886.70</td>
<td headers="by group: stub_1_4 upper.y" class="gt_row gt_right">77,391.19</td></tr>
    <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Bilbao, Valencia (84)</th>
<td headers="by group: stub_1_5 ATT.x" class="gt_row gt_right">−38,203.50</td>
<td headers="by group: stub_1_5 lower.x" class="gt_row gt_right">−136,942.01</td>
<td headers="by group: stub_1_5 upper.x" class="gt_row gt_right">60,535.01</td>
<td headers="by group: stub_1_5 ATT.y" class="gt_row gt_right">−31,801.12</td>
<td headers="by group: stub_1_5 lower.y" class="gt_row gt_right">−119,808.91</td>
<td headers="by group: stub_1_5 upper.y" class="gt_row gt_right">56,206.67</td></tr>
    <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">Dunkerque, Le Havre, Marsaxlokk, Marseille, Nantes Saint Nazaire, Zeebrugge (66)</th>
<td headers="by group: stub_1_6 ATT.x" class="gt_row gt_right">−14,458.25</td>
<td headers="by group: stub_1_6 lower.x" class="gt_row gt_right">−103,131.42</td>
<td headers="by group: stub_1_6 upper.x" class="gt_row gt_right">74,214.91</td>
<td headers="by group: stub_1_6 ATT.y" class="gt_row gt_right">2,864.56</td>
<td headers="by group: stub_1_6 lower.y" class="gt_row gt_right">−68,965.78</td>
<td headers="by group: stub_1_6 upper.y" class="gt_row gt_right">74,694.89</td></tr>
    <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">Gdynia (38)</th>
<td headers="by group: stub_1_7 ATT.x" class="gt_row gt_right">−59,221.39</td>
<td headers="by group: stub_1_7 lower.x" class="gt_row gt_right">−192,982.98</td>
<td headers="by group: stub_1_7 upper.x" class="gt_row gt_right">74,540.21</td>
<td headers="by group: stub_1_7 ATT.y" class="gt_row gt_right">−7,309.35</td>
<td headers="by group: stub_1_7 lower.y" class="gt_row gt_right">−42,521.69</td>
<td headers="by group: stub_1_7 upper.y" class="gt_row gt_right">27,902.99</td></tr>
    <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">Genova (81)</th>
<td headers="by group: stub_1_8 ATT.x" class="gt_row gt_right">27,415.87</td>
<td headers="by group: stub_1_8 lower.x" class="gt_row gt_right">−1,318.68</td>
<td headers="by group: stub_1_8 upper.x" class="gt_row gt_right">56,150.43</td>
<td headers="by group: stub_1_8 ATT.y" class="gt_row gt_right">36,622.77<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_8 lower.y" class="gt_row gt_right">21,415.55</td>
<td headers="by group: stub_1_8 upper.y" class="gt_row gt_right">51,829.99</td></tr>
    <tr><th id="stub_1_9" scope="row" class="gt_row gt_left gt_stub">Moerdijk, Rotterdam (21)</th>
<td headers="by group: stub_1_9 ATT.x" class="gt_row gt_right">186,230.89</td>
<td headers="by group: stub_1_9 lower.x" class="gt_row gt_right">−217,251.14</td>
<td headers="by group: stub_1_9 upper.x" class="gt_row gt_right">589,712.93</td>
<td headers="by group: stub_1_9 ATT.y" class="gt_row gt_right">161,395.18</td>
<td headers="by group: stub_1_9 lower.y" class="gt_row gt_right">−290,545.02</td>
<td headers="by group: stub_1_9 upper.y" class="gt_row gt_right">613,335.37</td></tr>
    <tr><th id="stub_1_10" scope="row" class="gt_row gt_left gt_stub">Piraeus (52)</th>
<td headers="by group: stub_1_10 ATT.x" class="gt_row gt_right">428,419.61<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_10 lower.x" class="gt_row gt_right">321,546.76</td>
<td headers="by group: stub_1_10 upper.x" class="gt_row gt_right">535,292.46</td>
<td headers="by group: stub_1_10 ATT.y" class="gt_row gt_right">350,096.18<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_10 lower.y" class="gt_row gt_right">153,968.84</td>
<td headers="by group: stub_1_10 upper.y" class="gt_row gt_right">546,223.53</td></tr>
  </tbody>
  
  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="7"> First treatment period in brackets.</td>
    </tr>
    <tr>
      <td class="gt_footnote" colspan="7"><span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span> Confidence interval does not include zero.</td>
    </tr>
  </tfoot>
</table>
</div>
```

# Parallel trend assumption
## Event study
For the DiD framework to deliver unbiased results, the parallel trend assumptions needs to hold. While it is not possible to test this assumption directly, we conduct a few test to validate whether the pre-treatment trends run parallel or not. The following graph displays and event study type aggregation of the group-time average treatment effects calculated above. The aggregated average treatment effects before treatment (red) are all around zero, indicating that parallel trends holds in the pre-treatment period. The graphs clearly indicate a persistent positive treatment effect after the treatment. The point-wise estimates are only significant in a couple of periods, which is due to the fact that some ports experience a high positive treatment effect while others do not. In particular *insert portnames* show consistently higher throughputs after treatment than the control group. 

![](Estimation_files/figure-html/unnamed-chunk-10-1.png)<!-- -->![](Estimation_files/figure-html/unnamed-chunk-10-2.png)<!-- -->

## Placebo test




Due to the small number of treated ports, there exists the possibility that the treated ports are just coincidentally experiencing an increase in the throughput after treatment. To alleviate these concerns, we conduct a placebo test testing the sharp null of an average treatment effect of zero @Young.2019. We exclude all treated ports from the data and randomly assign 18 port to be treated at a random point in time and calculate the simple average treatment effect. Repeating this process for 100 times yields the empirical distribution of treatment effects depicted in the bar chart below. As expected, the distribution is centered around zero, indicating that there is no consistent average treatment effect, when the treatment is assigned randomly. The observed treatment effect of the actual treated ports (vertical line) clearly lies at the right end of the distribution. If the true treatment effect was in fact zero and the observed treatment effect was only due to a coincidental lucky pick of ports and time, that probability of the observed treatment to occur effect would be 0 percent.    

![](Estimation_files/figure-html/unnamed-chunk-12-1.png)<!-- -->

# Extension

## Shipments from China

In this section, we look further into the effect of Chinese ownership and the operation of the ports by investigating the effect of Chinese ownership on the throughput of Chinese container. To evaluate whether Chinese container were processed more often in ports that management was taken over by a Chinese investor, we employ a triple difference framework. In particular, we define our output variable as the share of Chinese containers processed in a particular port relative to containers from all other origins. The identifying parallel trends assumption that needs to hold is that the relative throughput of Chinese containers in treated ports trend in the same way as the relative throughput of Chinese containers in untreated ports @Olden.2022.
This setup has a number of advantages over a simple difference in difference using Chinese container throughput in levels as the outcome variable. In particular, the triple difference setup helps reducing potential bias that could be in a difference in difference estimation of Chinese container throughput versus container throughput of other origins for treated ports and untreated ports.   






```{=html}
<div id="ipwavxiswk" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#ipwavxiswk table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#ipwavxiswk thead, #ipwavxiswk tbody, #ipwavxiswk tfoot, #ipwavxiswk tr, #ipwavxiswk td, #ipwavxiswk th {
  border-style: none;
}

#ipwavxiswk p {
  margin: 0;
  padding: 0;
}

#ipwavxiswk .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#ipwavxiswk .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#ipwavxiswk .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#ipwavxiswk .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#ipwavxiswk .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#ipwavxiswk .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ipwavxiswk .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#ipwavxiswk .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#ipwavxiswk .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#ipwavxiswk .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#ipwavxiswk .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#ipwavxiswk .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#ipwavxiswk .gt_spanner_row {
  border-bottom-style: hidden;
}

#ipwavxiswk .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#ipwavxiswk .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#ipwavxiswk .gt_from_md > :first-child {
  margin-top: 0;
}

#ipwavxiswk .gt_from_md > :last-child {
  margin-bottom: 0;
}

#ipwavxiswk .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#ipwavxiswk .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#ipwavxiswk .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#ipwavxiswk .gt_row_group_first td {
  border-top-width: 2px;
}

#ipwavxiswk .gt_row_group_first th {
  border-top-width: 2px;
}

#ipwavxiswk .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ipwavxiswk .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#ipwavxiswk .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#ipwavxiswk .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ipwavxiswk .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ipwavxiswk .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#ipwavxiswk .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#ipwavxiswk .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#ipwavxiswk .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ipwavxiswk .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#ipwavxiswk .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#ipwavxiswk .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#ipwavxiswk .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#ipwavxiswk .gt_left {
  text-align: left;
}

#ipwavxiswk .gt_center {
  text-align: center;
}

#ipwavxiswk .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#ipwavxiswk .gt_font_normal {
  font-weight: normal;
}

#ipwavxiswk .gt_font_bold {
  font-weight: bold;
}

#ipwavxiswk .gt_font_italic {
  font-style: italic;
}

#ipwavxiswk .gt_super {
  font-size: 65%;
}

#ipwavxiswk .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#ipwavxiswk .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#ipwavxiswk .gt_indent_1 {
  text-indent: 5px;
}

#ipwavxiswk .gt_indent_2 {
  text-indent: 10px;
}

#ipwavxiswk .gt_indent_3 {
  text-indent: 15px;
}

#ipwavxiswk .gt_indent_4 {
  text-indent: 20px;
}

#ipwavxiswk .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="4" class="gt_heading gt_title gt_font_normal" style>Aggregation of group time average treatment effects</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="4" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>Control group: Never treated</td>
    </tr>
    <tr class="gt_col_headings gt_spanner_row">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id=""></th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="uncond. PTA">
        <span class="gt_column_spanner">uncond. PTA</span>
      </th>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="ATT">ATT</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="[95%">[95%</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="conf.int.]">conf.int.]</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <th colspan="4" class="gt_empty_group_heading" scope="colgroup" id=""></th>
    </tr>
    <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">simple average</th>
<td headers="NA stub_1_1 ATT" class="gt_row gt_right">0.01</td>
<td headers="NA stub_1_1 lower" class="gt_row gt_right">−0.02</td>
<td headers="NA stub_1_1 upper" class="gt_row gt_right">0.03</td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="4" class="gt_group_heading" scope="colgroup" id="by group:">by group:</th>
    </tr>
    <tr class="gt_row_group_first"><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Moerdijk, Rotterdam (21)</th>
<td headers="by group: stub_1_2 ATT" class="gt_row gt_right">0.03</td>
<td headers="by group: stub_1_2 lower" class="gt_row gt_right">−0.12</td>
<td headers="by group: stub_1_2 upper" class="gt_row gt_right">0.17</td></tr>
    <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">Antwerpen (32)</th>
<td headers="by group: stub_1_3 ATT" class="gt_row gt_right">−0.01</td>
<td headers="by group: stub_1_3 lower" class="gt_row gt_right">−0.02</td>
<td headers="by group: stub_1_3 upper" class="gt_row gt_right">0.01</td></tr>
    <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">Gdynia (38)</th>
<td headers="by group: stub_1_4 ATT" class="gt_row gt_right">0.00</td>
<td headers="by group: stub_1_4 lower" class="gt_row gt_right">−0.02</td>
<td headers="by group: stub_1_4 upper" class="gt_row gt_right">0.01</td></tr>
    <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Piraeus (52)</th>
<td headers="by group: stub_1_5 ATT" class="gt_row gt_right">0.07<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_5 lower" class="gt_row gt_right">0.04</td>
<td headers="by group: stub_1_5 upper" class="gt_row gt_right">0.09</td></tr>
    <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">Barcelona (63)</th>
<td headers="by group: stub_1_6 ATT" class="gt_row gt_right">0.01<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_6 lower" class="gt_row gt_right">0.00</td>
<td headers="by group: stub_1_6 upper" class="gt_row gt_right">0.02</td></tr>
    <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">Dunkerque, Le Havre, Marsaxlokk, Marseille, Nantes Saint Nazaire, Zeebrugge (66)</th>
<td headers="by group: stub_1_7 ATT" class="gt_row gt_right">−0.02</td>
<td headers="by group: stub_1_7 lower" class="gt_row gt_right">−0.11</td>
<td headers="by group: stub_1_7 upper" class="gt_row gt_right">0.07</td></tr>
    <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">Ambarli (76)</th>
<td headers="by group: stub_1_8 ATT" class="gt_row gt_right">−0.02<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_8 lower" class="gt_row gt_right">−0.04</td>
<td headers="by group: stub_1_8 upper" class="gt_row gt_right">−0.01</td></tr>
    <tr><th id="stub_1_9" scope="row" class="gt_row gt_left gt_stub">Genova (81)</th>
<td headers="by group: stub_1_9 ATT" class="gt_row gt_right">0.07<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_9 lower" class="gt_row gt_right">0.06</td>
<td headers="by group: stub_1_9 upper" class="gt_row gt_right">0.08</td></tr>
    <tr><th id="stub_1_10" scope="row" class="gt_row gt_left gt_stub">Bilbao, Valencia (84)</th>
<td headers="by group: stub_1_10 ATT" class="gt_row gt_right">−0.02</td>
<td headers="by group: stub_1_10 lower" class="gt_row gt_right">−0.06</td>
<td headers="by group: stub_1_10 upper" class="gt_row gt_right">0.02</td></tr>
    <tr><th id="stub_1_11" scope="row" class="gt_row gt_left gt_stub">Amsterdam, Thessaloniki (85)</th>
<td headers="by group: stub_1_11 ATT" class="gt_row gt_right">0.00</td>
<td headers="by group: stub_1_11 lower" class="gt_row gt_right">−0.01</td>
<td headers="by group: stub_1_11 upper" class="gt_row gt_right">0.02</td></tr>
  </tbody>
  
  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="4"> First treatment period in brackets.</td>
    </tr>
    <tr>
      <td class="gt_footnote" colspan="4"><span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span> Confidence interval does not include zero.</td>
    </tr>
  </tfoot>
</table>
</div>
```

# Placebo test




```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![](Estimation_files/figure-html/unnamed-chunk-17-1.png)<!-- -->


# References

