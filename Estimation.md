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

In the first attempt, a simple fixed effects model and aggregated data on container throughput is used to identify the effect of Chinese port ownership. The effect of chinese ownership is included in form of a dummy variable ($ChineseOwnership_{pt}$) that is set to one when the ownership (at least partly) transfered to a Chinese company (needs clarification).

$Thrpt_{prt}=\alpha_{p}+\theta_{rt} +ChineseOwnership_{pt}+e_{pt}$ 

Where $p$ stands for the port, $r$ for the reporting country, and $t$ for the period. In equation (1), the quarterly ($t$) container throughput ($Thrpt$) is explained by a set of port fixed-effects ($\alpha_{p}$), and reporter country-time fixed effects ($\theta_{rt}$). This specification controls for all time-invariant port-specific, and all time-invariant reporter country-specific unobserved covariates.
Second, we leverage the bilateral structure of the data, and use the variation between partner country and port over time to identify the effect of Chinese ownership on port throughput. The advantage of this approach is that we can use higher levels of fixed effects, which enable a much more precise control over which variation is used to identify the treatment effect. We proceed by estimating multiple equations with different levels of fixed effects with increasing restrictiveness:

$Thrpt_{prct}=\alpha_{p}+\beta_{c}+\gamma_{t}+ChineseOwnership_{pt}+ChineseOwnership_{pt}*ChinesePartner_{pc}+e_{prct}$ 

Where $c$ stands for the partner country, i.e. the destination/origin of the shipped container. We also include an interaction term of our treatment indicator ($ChineseOwnership_{pt}$) with the an indicator for shipments fromo and to China ($ChinesePartner_{pc}$). In equation (2), we account for all port-specific time-invariant unobserved covariates and all partner-specific unobserved covariates. That includes influencing factors like the average port size and geographic position, but also economic size of the origins and destinations of container shipments.

$Thrpt_{prct}=\alpha_{pc}+\beta_{ct}+ChineseOwnership_{pt}+ChineseOwnership_{pt}*ChinesePartner_{pc}+e_{prct}$ 

Equation (3) increases the restrictiveness of the fixed effects by replacing the port-level fixed effects with port-partner fixed effects and the partner fixed effects with partner-time fixed effects. This set of fixed effects controls for all time-invariant port-partner specfic covariates like regular shipping routes, geographic proximity and preferences. Additionally, time-varying partner country covariates, like economic up- or downswings are accounted for as well.

$Thrpt_{prct}=\alpha_{pc}+\beta_{ct}+ChineseOwnership_{pt}+ChineseOwnership_{pt}*ChineseOrigin_{pc}+e_{prct}$ 

Lastly, equation (4) adds another dimension to the fixed effects. In addition to controlling for port-partner time-invariant covariates, it also controls for reporter-time fixed effects. These encapsule all reporter-time varying covariates, like production and demand shocks in the port's country.






```{=html}
<div id="jwfpsyznlw" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#jwfpsyznlw table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#jwfpsyznlw thead, #jwfpsyznlw tbody, #jwfpsyznlw tfoot, #jwfpsyznlw tr, #jwfpsyznlw td, #jwfpsyznlw th {
  border-style: none;
}

#jwfpsyznlw p {
  margin: 0;
  padding: 0;
}

#jwfpsyznlw .gt_table {
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

#jwfpsyznlw .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#jwfpsyznlw .gt_title {
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

#jwfpsyznlw .gt_subtitle {
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

#jwfpsyznlw .gt_heading {
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

#jwfpsyznlw .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#jwfpsyznlw .gt_col_headings {
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

#jwfpsyznlw .gt_col_heading {
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

#jwfpsyznlw .gt_column_spanner_outer {
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

#jwfpsyznlw .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#jwfpsyznlw .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#jwfpsyznlw .gt_column_spanner {
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

#jwfpsyznlw .gt_spanner_row {
  border-bottom-style: hidden;
}

#jwfpsyznlw .gt_group_heading {
  padding-top: 0px;
  padding-bottom: 0px;
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
  border-bottom-color: rgba(255, 255, 255, 0);
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#jwfpsyznlw .gt_empty_group_heading {
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
  border-bottom-color: rgba(255, 255, 255, 0);
  vertical-align: middle;
}

#jwfpsyznlw .gt_from_md > :first-child {
  margin-top: 0;
}

#jwfpsyznlw .gt_from_md > :last-child {
  margin-bottom: 0;
}

#jwfpsyznlw .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: rgba(255, 255, 255, 0);
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#jwfpsyznlw .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 0px;
  border-right-color: rgba(255, 255, 255, 0);
  padding-left: 5px;
  padding-right: 5px;
}

#jwfpsyznlw .gt_stub_row_group {
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

#jwfpsyznlw .gt_row_group_first td {
  border-top-width: 2px;
}

#jwfpsyznlw .gt_row_group_first th {
  border-top-width: 2px;
}

#jwfpsyznlw .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#jwfpsyznlw .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#jwfpsyznlw .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#jwfpsyznlw .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#jwfpsyznlw .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#jwfpsyznlw .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#jwfpsyznlw .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#jwfpsyznlw .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#jwfpsyznlw .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#jwfpsyznlw .gt_footnotes {
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

#jwfpsyznlw .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#jwfpsyznlw .gt_sourcenotes {
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

#jwfpsyznlw .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#jwfpsyznlw .gt_left {
  text-align: left;
}

#jwfpsyznlw .gt_center {
  text-align: center;
}

#jwfpsyznlw .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#jwfpsyznlw .gt_font_normal {
  font-weight: normal;
}

#jwfpsyznlw .gt_font_bold {
  font-weight: bold;
}

#jwfpsyznlw .gt_font_italic {
  font-style: italic;
}

#jwfpsyznlw .gt_super {
  font-size: 65%;
}

#jwfpsyznlw .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#jwfpsyznlw .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#jwfpsyznlw .gt_indent_1 {
  text-indent: 5px;
}

#jwfpsyznlw .gt_indent_2 {
  text-indent: 10px;
}

#jwfpsyznlw .gt_indent_3 {
  text-indent: 15px;
}

#jwfpsyznlw .gt_indent_4 {
  text-indent: 20px;
}

#jwfpsyznlw .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="5" class="gt_heading gt_title gt_font_normal" style>Fixed effects estimation results</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="5" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>Dependent variable: Total throughput in thousand TEU</td>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id=""></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Eq. 1">Eq. 1</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Eq. 2">Eq. 2</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Eq. 3">Eq. 3</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Eq. 4">Eq. 4</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <th colspan="5" class="gt_empty_group_heading" scope="colgroup" id=""></th>
    </tr>
    <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Ownership Chinese SOE</th>
<td headers="NA stub_1_1 spec1" class="gt_row gt_center">149,594.8* (71,111.5)</td>
<td headers="NA stub_1_1 spec2" class="gt_row gt_center">978.3 (1,340.0)</td>
<td headers="NA stub_1_1 spec3" class="gt_row gt_center">2,201.0*** (365.9)</td>
<td headers="NA stub_1_1 spec4" class="gt_row gt_center">1,158.7** (397.2)</td></tr>
    <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Ownership Chinese SOE x Origin China</th>
<td headers="NA stub_1_2 spec1" class="gt_row gt_center">  </td>
<td headers="NA stub_1_2 spec2" class="gt_row gt_center">47,775.6. (28,048.5)</td>
<td headers="NA stub_1_2 spec3" class="gt_row gt_center">18,889.9. (10,468.0)</td>
<td headers="NA stub_1_2 spec4" class="gt_row gt_center">18,574.7. (10,257.3)</td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="5" class="gt_group_heading" scope="colgroup" id="Fixed effects:">Fixed effects:</th>
    </tr>
    <tr class="gt_row_group_first"><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">Port</th>
<td headers="Fixed effects: stub_1_3 spec1" class="gt_row gt_center">yes</td>
<td headers="Fixed effects: stub_1_3 spec2" class="gt_row gt_center">yes</td>
<td headers="Fixed effects: stub_1_3 spec3" class="gt_row gt_center"></td>
<td headers="Fixed effects: stub_1_3 spec4" class="gt_row gt_center"></td></tr>
    <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">Period</th>
<td headers="Fixed effects: stub_1_4 spec1" class="gt_row gt_center">yes</td>
<td headers="Fixed effects: stub_1_4 spec2" class="gt_row gt_center">yes</td>
<td headers="Fixed effects: stub_1_4 spec3" class="gt_row gt_center"></td>
<td headers="Fixed effects: stub_1_4 spec4" class="gt_row gt_center"></td></tr>
    <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Reporter-Period</th>
<td headers="Fixed effects: stub_1_5 spec1" class="gt_row gt_center">yes</td>
<td headers="Fixed effects: stub_1_5 spec2" class="gt_row gt_center"></td>
<td headers="Fixed effects: stub_1_5 spec3" class="gt_row gt_center"></td>
<td headers="Fixed effects: stub_1_5 spec4" class="gt_row gt_center">yes</td></tr>
    <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">Partner</th>
<td headers="Fixed effects: stub_1_6 spec1" class="gt_row gt_center"></td>
<td headers="Fixed effects: stub_1_6 spec2" class="gt_row gt_center">yes</td>
<td headers="Fixed effects: stub_1_6 spec3" class="gt_row gt_center"></td>
<td headers="Fixed effects: stub_1_6 spec4" class="gt_row gt_center"></td></tr>
    <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">Port-Partner</th>
<td headers="Fixed effects: stub_1_7 spec1" class="gt_row gt_center"></td>
<td headers="Fixed effects: stub_1_7 spec2" class="gt_row gt_center"></td>
<td headers="Fixed effects: stub_1_7 spec3" class="gt_row gt_center">yes</td>
<td headers="Fixed effects: stub_1_7 spec4" class="gt_row gt_center">yes</td></tr>
    <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">Partner-Period</th>
<td headers="Fixed effects: stub_1_8 spec1" class="gt_row gt_center"></td>
<td headers="Fixed effects: stub_1_8 spec2" class="gt_row gt_center"></td>
<td headers="Fixed effects: stub_1_8 spec3" class="gt_row gt_center">yes</td>
<td headers="Fixed effects: stub_1_8 spec4" class="gt_row gt_center">yes</td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="5" class="gt_group_heading" scope="colgroup" id="Diagnostics:">Diagnostics:</th>
    </tr>
    <tr class="gt_row_group_first"><th id="stub_1_9" scope="row" class="gt_row gt_left gt_stub">S.E.: Clustered</th>
<td headers="Diagnostics: stub_1_9 spec1" class="gt_row gt_center">by: Port &amp; Period</td>
<td headers="Diagnostics: stub_1_9 spec2" class="gt_row gt_center">by: Port. &amp; Part.</td>
<td headers="Diagnostics: stub_1_9 spec3" class="gt_row gt_center">by: Port. &amp; Part.</td>
<td headers="Diagnostics: stub_1_9 spec4" class="gt_row gt_center">by: Port. &amp; Part.</td></tr>
    <tr><th id="stub_1_10" scope="row" class="gt_row gt_left gt_stub">Observations</th>
<td headers="Diagnostics: stub_1_10 spec1" class="gt_row gt_center">11,511</td>
<td headers="Diagnostics: stub_1_10 spec2" class="gt_row gt_center">381,992</td>
<td headers="Diagnostics: stub_1_10 spec3" class="gt_row gt_center">381,992</td>
<td headers="Diagnostics: stub_1_10 spec4" class="gt_row gt_center">381,992</td></tr>
    <tr><th id="stub_1_11" scope="row" class="gt_row gt_left gt_stub">R2</th>
<td headers="Diagnostics: stub_1_11 spec1" class="gt_row gt_center">0.91630</td>
<td headers="Diagnostics: stub_1_11 spec2" class="gt_row gt_center">0.23189</td>
<td headers="Diagnostics: stub_1_11 spec3" class="gt_row gt_center">0.80052</td>
<td headers="Diagnostics: stub_1_11 spec4" class="gt_row gt_center">0.80809</td></tr>
    <tr><th id="stub_1_12" scope="row" class="gt_row gt_left gt_stub">Within R2</th>
<td headers="Diagnostics: stub_1_12 spec1" class="gt_row gt_center">0.03579</td>
<td headers="Diagnostics: stub_1_12 spec2" class="gt_row gt_center">0.02595</td>
<td headers="Diagnostics: stub_1_12 spec3" class="gt_row gt_center">0.01154</td>
<td headers="Diagnostics: stub_1_12 spec4" class="gt_row gt_center">0.00733</td></tr>
  </tbody>
  
  
</table>
</div>
```

While the fixed effects identification strategy presented above is a common one in the literature, many authors criticize the model for its lack of interpretable results. In particular, it is often unclear how the coefficients in fixed effects models are obtained and which units have served as comparisons to treated units, especially when the treatment timing varies between units. @Chaisemartin.2020 and @Borusyak.2022 find that the treatment effect estimated by two-way fixed effects models (as in equation (2)) is a weighted average of time-specific treatment effects with some weights potentially being negative. In extreme cases, this can cause negative coefficients although all time-specific treatment effects are positive. @GoodmanBacon.2021 point out that the estimator can be seen as a weighted average of all possible comparisons between treated, untreated, and not-yet-treated units, with the weights depending on treatment timing and the number of observations and conclude that a fixed effects set should be avoided, when the treatment effect is likely to vary over time.  

Another common issue is finding reasonable counterfactuals when interpreting the coefficients from fixed effects models. @Mummolo.2018 notes that researchers tend to present unrealistic counterfactuals when using fixed effects regression. Since fixed effect models only use a fraction of the variance to estimate the coefficients, interpreting the model with counterfactuals that are drawn from the original distribution of the data often leads to unrealistically high effects that sometimes falsely imply economically relevant effect sizes. Additionally, the major benefit of fixed effects, the ability to control for unobserved covariates, critically depends on the linear additive assumption [@Imai.2021]. In cases where the variation can be attributed to several dimensions of fixed effects, the estimator is undefined [@Kropko.2020].

In the last couple of years, there has developed a growing literature that tries to circumvent the issues attached to staggered treatment adoption. Notably, @Sun.2021 and @Callaway.2021 propose to estimate the treatment effects on the disaggregated group-time level and aggregate them later to obtain average treatment effects or event study results. In this paper, we employ a similar approach by estimating the unit-time treatment effects and aggregating them at different levels to obtain the average treatment effects on the treated. We chose to deviate from estimating group-time effects, as we only have 18 treated ports, most which are treated at a different points in time. That leaves most treatment groups with a single port and a few treatment groups with a handful of ports with no obvious common attributes. In particular, we assume that for every treated port $i$ the following parallel trend assumption holds: 

$E[Y_{i,t}(0)-Y_{i,t^*(i)}(0)|G=1,X_{i}]=E[Y_{t}(0)-Y_{t^*(i)}(0)|G=0,X]$
with $t > t^*$

where $Y_{t}(0)$ stands for the potential untreated outcome at time $t$, $G$ is an indicator variable indicating treated units, $t^*(i)$ indicates the last period before treatment of unit $i$, and $X$ is a matrix of time-invariant covariates. This assumption allows us to estimate the unit-time treatment effects on the treated: 

$ATT(i,t)=E[Y_{i,t}(1)-Y_{i,t}(0)|X_{i}]=E[Y_{i,t}(1)-Y_{i,t^*(i)}(0)|G=1,X_{i}]-E[Y_{t}(0)-Y_{t^*(i)}(0)|G=0, X]$

where $Y_{i,t}(1)$ represents the treated outcome of unit $i$. We estimate the conditional unit-time ATTs by a simple regression procedure by Heckmann 1998: We first estimate the expected outcome trend of the untreated units at each $t$, regressing the difference in untreated outcomes on the time-invariant covarites $X$. That is, for all untreated units $j$ and time $t$, we estimate:

$Y_{j,t}(0)-Y_{j,t^*}(0)=\alpha_{t}+X_{j}\beta_{t}+\eta_{j,t}$

We then use the estimated coefficients to  predict the counterfactual outcome trend of the treated units. The unit-time ATT is then given by the difference between the observed trend in the treated outcome and the counterfactual trend. Note that the coefficients are reestimated for each unit-time observation. This means that we allow for a time-varying influence of the covariates on the outcome. 

Unfortunately, the separate estimation of many treatment effects with just one treated unit causes standard inference to be invalid with analytical standard errors clustered at the unit-level being overly optimistic [@Ferman.2019]. Against this backdrop, we implement the bootstrap procedure of @Alvarez.2023, which leads to confidence intervals of the correct size in situations with a fixed number of treated units and a large number of control units. Their method also allows for correlation within units over time and corrects for a known structure of heteroscedasticity between units, which is likely in our application. The main idea is to use the control units’ residuals of the outcome model to estimate the structural form of heteroscedasticity and the distribution of the treated units [@Conley.2011]. For this to be viable, two assumptions need to be made in addition to the regular DiD assumptions. First, the expected errors of the outcome model should be the same, regardless of the treatment status: $E[\eta_{j}|X_{j}]=E[\eta_{i}|X_{i}]=0$. This is equivalent to the parallel trend assumption above. Second, the errors of the outcome model should be represented by a known function $\eta_{j,t}=h_{i}(Z_{j}, \delta_{i})\epsilon_{j,t}$, where $h_{i}(.,.)$ is a known function, $Z_{j}$ is a set of covariates, $\delta_{i}$ is an unknown parameter, and $\epsilon_{j,t}$ is $iid$ for all $j$. @Ferman.2019 show that the variance of the errors from the outcome model can be described by a function $V(\eta_{j,t})=A+B/Z_{j}$ with $A,B>=0$ for wide range of error structures, including within-unit correlation in a panel setting. In detail, we apply the following protocol to estimate the 95 percent confidence intervals: *add algorithm table*

We track the errors of the control units when estimating the outcome model. These errors are then used to estimate the structure of heteroscedasticity between units by regressing the squared residuals on a constant and a set of control variables (in our case, their quay length). Then, the residuals are normalized by their variance estimate, and a bootstrap sample of normalized residuals is drawn at the unit level. In every bootstrap iteration, one untreated unit is drawn for each treated unit and the normalized residuals of that untreated unit are added to the bootstrap sample. Bootstrapping at the unit level ensures that the correlation structure within the bootstrapped units is persevered. All normalized residuals in the bootstrap sample are scaled by the estimated variance of the respective treated unit. Then, the confidence intervals are determined by the 95 percent quantile of the bootstrapped normalized errors. As recommended by @Alvarez.2021, we account for the multiple testing problem by reducing the bootstrap sample to the highest rescaled residuals for each parameter tested. Then, the uniform confidence interval is given by the 95 percent quantile of this reduced bootstrap sample.

To obtain the average treatment effect on each treated unit, we follow @Callaway.2021 by computing a simple average of all unit-time treatment effects for each treated unit. The 95 percent confidence intervals for each treated unit i is then given by the 95 quantile of the B averages of the rescaled residuals, respectively. Equivalently, we calculate an overall average treatment effect on the treated units by averaging all unit-time treatment effects over all units and periods. The 95 percent confidence intervals is given by the 95 percent quantile of the B averages obtained from the rescaled residuals.


# Difference in Differences

To address these shortcomings, we use recent advances in the DiD literature, and employ a staggered DiD estimator by @Callaway.2021. They formulate a unified approach to estimating average treatment effects in a DiD framework with multiple periods and varying treatment timing that avoids all above described interpretation issues. They define group-time average treatment effects, which measure the average treatment effect for a group of units that receive the treatment at the same point in time. In a later step, these group-time average treatment effects can be aggregated either by time period or group to derive an overall average treatment effect. Another advantage of their approach is that it gives the research the liberty to choose which comparison group should be used to calculate the treatment effects. That is, whether the comparison group includes only never-treated or not-yet-treated units. This translates to two parallel trend assumptions. When the comparison group is made up of never treated units:

$E[Y_{t}(0)-Y_{t-1}(0)|G=g]=E[Y_{t}(0)-Y_{t-1}(0)|C=1]$ 
with $g\leq t$ \left (6)

Where $Y_{t}(0)$ denotes the potential untreated outcome in period t, $G$ indicates the period a unit is first treated, and $C$ is an indicator that takes the value of one if a unit is never treated. Hence, the first term of the equation above denotes the difference between untreated outcomes of period t and period t-1 for units while they are treated, and the second term denotes the difference between potential outcomes of periods t and t-1 for units that are never treated. In a setting with staggered treatment, random sampling, and not treatment anticipation, the above parallel trend assumption leads the following group-time average treatment effects: 

$ATT(g,t)=E[Y_{t}(g)-Y_{t}(0)|G=g]=E[Y_{t}-Y_{g-1}|G=g]-E[Y_{t}-Y_{g-1}|C=1]$ \left (7)

Where $Y_{t}(g)$ denotes the treated outcome in period $t$, $Y_{t}$ denotes the observed outcome in period $t$. Hence, the average $ATT(g,t)$ represents the average effect of treatment in period t for units that are first treated in period g. To derive at an overall average treatment effect, we use a simple aggregation scheme as proposed by @Callaway.2021, which weights each ATT by the size of the group. 







```{=html}
<div id="cblvsmapoq" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#cblvsmapoq table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#cblvsmapoq thead, #cblvsmapoq tbody, #cblvsmapoq tfoot, #cblvsmapoq tr, #cblvsmapoq td, #cblvsmapoq th {
  border-style: none;
}

#cblvsmapoq p {
  margin: 0;
  padding: 0;
}

#cblvsmapoq .gt_table {
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

#cblvsmapoq .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#cblvsmapoq .gt_title {
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

#cblvsmapoq .gt_subtitle {
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

#cblvsmapoq .gt_heading {
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

#cblvsmapoq .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#cblvsmapoq .gt_col_headings {
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

#cblvsmapoq .gt_col_heading {
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

#cblvsmapoq .gt_column_spanner_outer {
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

#cblvsmapoq .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#cblvsmapoq .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#cblvsmapoq .gt_column_spanner {
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

#cblvsmapoq .gt_spanner_row {
  border-bottom-style: hidden;
}

#cblvsmapoq .gt_group_heading {
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

#cblvsmapoq .gt_empty_group_heading {
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

#cblvsmapoq .gt_from_md > :first-child {
  margin-top: 0;
}

#cblvsmapoq .gt_from_md > :last-child {
  margin-bottom: 0;
}

#cblvsmapoq .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 0px;
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

#cblvsmapoq .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 0px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#cblvsmapoq .gt_stub_row_group {
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

#cblvsmapoq .gt_row_group_first td {
  border-top-width: 2px;
}

#cblvsmapoq .gt_row_group_first th {
  border-top-width: 2px;
}

#cblvsmapoq .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#cblvsmapoq .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#cblvsmapoq .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#cblvsmapoq .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#cblvsmapoq .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#cblvsmapoq .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#cblvsmapoq .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#cblvsmapoq .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#cblvsmapoq .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#cblvsmapoq .gt_footnotes {
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

#cblvsmapoq .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#cblvsmapoq .gt_sourcenotes {
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

#cblvsmapoq .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#cblvsmapoq .gt_left {
  text-align: left;
}

#cblvsmapoq .gt_center {
  text-align: center;
}

#cblvsmapoq .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#cblvsmapoq .gt_font_normal {
  font-weight: normal;
}

#cblvsmapoq .gt_font_bold {
  font-weight: bold;
}

#cblvsmapoq .gt_font_italic {
  font-style: italic;
}

#cblvsmapoq .gt_super {
  font-size: 65%;
}

#cblvsmapoq .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#cblvsmapoq .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#cblvsmapoq .gt_indent_1 {
  text-indent: 5px;
}

#cblvsmapoq .gt_indent_2 {
  text-indent: 10px;
}

#cblvsmapoq .gt_indent_3 {
  text-indent: 15px;
}

#cblvsmapoq .gt_indent_4 {
  text-indent: 20px;
}

#cblvsmapoq .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="7" class="gt_heading gt_title gt_font_normal" style>Aggregation of group time treatment effects</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="7" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>Dependent variable: Total throughput in thousand TEU</td>
    </tr>
    <tr class="gt_col_headings gt_spanner_row">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id=""></th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="Never treated">
        <span class="gt_column_spanner">Never treated</span>
      </th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Not yet treated">
        <span class="gt_column_spanner">Not yet treated</span>
      </th>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="unconditional">unconditional</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="95% CI">95% CI</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="conditional">conditional</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="95% CI">95% CI</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="conditional">conditional</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="95% CI">95% CI</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <th colspan="7" class="gt_empty_group_heading" scope="colgroup" id=""></th>
    </tr>
    <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">simple average</th>
<td headers="NA stub_1_1 ATT" class="gt_row gt_right">  219,028*</td>
<td headers="NA stub_1_1 Conf" class="gt_row gt_left">[189,349, 248,706]</td>
<td headers="NA stub_1_1 ATT_cond" class="gt_row gt_right"> 106,083*</td>
<td headers="NA stub_1_1 Conf_cond" class="gt_row gt_left">[77,348; 134,818]</td>
<td headers="NA stub_1_1 ATT_cond_ny" class="gt_row gt_right"> 70,770*</td>
<td headers="NA stub_1_1 Conf_cond_ny" class="gt_row gt_left">[37,831; 103,709]</td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="7" class="gt_group_heading" scope="colgroup" id="by group:">by group:</th>
    </tr>
    <tr class="gt_row_group_first"><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Antwerpen</th>
<td headers="by group: stub_1_2 ATT" class="gt_row gt_right">  863,147*</td>
<td headers="by group: stub_1_2 Conf" class="gt_row gt_left">[796,213, 930,080]</td>
<td headers="by group: stub_1_2 ATT_cond" class="gt_row gt_right"> 203,251*</td>
<td headers="by group: stub_1_2 Conf_cond" class="gt_row gt_left">[103,646; 302,857]</td>
<td headers="by group: stub_1_2 ATT_cond_ny" class="gt_row gt_right">164,527*</td>
<td headers="by group: stub_1_2 Conf_cond_ny" class="gt_row gt_left">[2,479; 326,574]</td></tr>
    <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">Zeebrugge</th>
<td headers="by group: stub_1_3 ATT" class="gt_row gt_right"> -104,006</td>
<td headers="by group: stub_1_3 Conf" class="gt_row gt_left">[-231,028, 23,016]</td>
<td headers="by group: stub_1_3 ATT_cond" class="gt_row gt_right">-113,999</td>
<td headers="by group: stub_1_3 Conf_cond" class="gt_row gt_left">[-245,087; 17,088]</td>
<td headers="by group: stub_1_3 ATT_cond_ny" class="gt_row gt_right">-60,614</td>
<td headers="by group: stub_1_3 Conf_cond_ny" class="gt_row gt_left">[-198,639; 77,411]</td></tr>
    <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">Barcelona</th>
<td headers="by group: stub_1_4 ATT" class="gt_row gt_right">  213,581*</td>
<td headers="by group: stub_1_4 Conf" class="gt_row gt_left">[120,185, 306,977]</td>
<td headers="by group: stub_1_4 ATT_cond" class="gt_row gt_right"> 208,255</td>
<td headers="by group: stub_1_4 Conf_cond" class="gt_row gt_left">[-2,117; 418,626]</td>
<td headers="by group: stub_1_4 ATT_cond_ny" class="gt_row gt_right">176,910*</td>
<td headers="by group: stub_1_4 Conf_cond_ny" class="gt_row gt_left">[38,723; 315,097]</td></tr>
    <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Bilbao</th>
<td headers="by group: stub_1_5 ATT" class="gt_row gt_right">  -16,186</td>
<td headers="by group: stub_1_5 Conf" class="gt_row gt_left">[-69,569, 37,197]</td>
<td headers="by group: stub_1_5 ATT_cond" class="gt_row gt_right">  -9,566</td>
<td headers="by group: stub_1_5 Conf_cond" class="gt_row gt_left">[-81,932; 62,799]</td>
<td headers="by group: stub_1_5 ATT_cond_ny" class="gt_row gt_right"> -9,971</td>
<td headers="by group: stub_1_5 Conf_cond_ny" class="gt_row gt_left">[-74,316; 54,374]</td></tr>
    <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">Valencia</th>
<td headers="by group: stub_1_6 ATT" class="gt_row gt_right">   15,313</td>
<td headers="by group: stub_1_6 Conf" class="gt_row gt_left">[-62,546, 93,173]</td>
<td headers="by group: stub_1_6 ATT_cond" class="gt_row gt_right">   3,095</td>
<td headers="by group: stub_1_6 Conf_cond" class="gt_row gt_left">[-71,195; 77,384]</td>
<td headers="by group: stub_1_6 ATT_cond_ny" class="gt_row gt_right">  7,220</td>
<td headers="by group: stub_1_6 Conf_cond_ny" class="gt_row gt_left">[-67,007; 81,448]</td></tr>
    <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">Dunkerque</th>
<td headers="by group: stub_1_7 ATT" class="gt_row gt_right">   28,123</td>
<td headers="by group: stub_1_7 Conf" class="gt_row gt_left">[-48,790, 105,035]</td>
<td headers="by group: stub_1_7 ATT_cond" class="gt_row gt_right">  31,999</td>
<td headers="by group: stub_1_7 Conf_cond" class="gt_row gt_left">[-33,382; 97,380]</td>
<td headers="by group: stub_1_7 ATT_cond_ny" class="gt_row gt_right"> 32,191</td>
<td headers="by group: stub_1_7 Conf_cond_ny" class="gt_row gt_left">[-91,630; 156,012]</td></tr>
    <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">Le Havre</th>
<td headers="by group: stub_1_8 ATT" class="gt_row gt_right">  163,798*</td>
<td headers="by group: stub_1_8 Conf" class="gt_row gt_left">[73,231, 254,366]</td>
<td headers="by group: stub_1_8 ATT_cond" class="gt_row gt_right">  98,737*</td>
<td headers="by group: stub_1_8 Conf_cond" class="gt_row gt_left">[9,973; 187,502]</td>
<td headers="by group: stub_1_8 ATT_cond_ny" class="gt_row gt_right"> 49,880</td>
<td headers="by group: stub_1_8 Conf_cond_ny" class="gt_row gt_left">[-82,114; 181,875]</td></tr>
    <tr><th id="stub_1_9" scope="row" class="gt_row gt_left gt_stub">Marseille</th>
<td headers="by group: stub_1_9 ATT" class="gt_row gt_right">   59,848</td>
<td headers="by group: stub_1_9 Conf" class="gt_row gt_left">[-73,207, 192,903]</td>
<td headers="by group: stub_1_9 ATT_cond" class="gt_row gt_right">  35,638</td>
<td headers="by group: stub_1_9 Conf_cond" class="gt_row gt_left">[-95,329; 166,605]</td>
<td headers="by group: stub_1_9 ATT_cond_ny" class="gt_row gt_right"> 29,429</td>
<td headers="by group: stub_1_9 Conf_cond_ny" class="gt_row gt_left">[-59,860; 118,717]</td></tr>
    <tr><th id="stub_1_10" scope="row" class="gt_row gt_left gt_stub">Nantes Saint Nazaire</th>
<td headers="by group: stub_1_10 ATT" class="gt_row gt_right">  -21,215</td>
<td headers="by group: stub_1_10 Conf" class="gt_row gt_left">[-96,199, 53,769]</td>
<td headers="by group: stub_1_10 ATT_cond" class="gt_row gt_right"> -21,055</td>
<td headers="by group: stub_1_10 Conf_cond" class="gt_row gt_left">[-98,214; 56,103]</td>
<td headers="by group: stub_1_10 ATT_cond_ny" class="gt_row gt_right">-13,917</td>
<td headers="by group: stub_1_10 Conf_cond_ny" class="gt_row gt_left">[-136,799; 108,966]</td></tr>
    <tr><th id="stub_1_11" scope="row" class="gt_row gt_left gt_stub">Piraeus</th>
<td headers="by group: stub_1_11 ATT" class="gt_row gt_right">  705,923*</td>
<td headers="by group: stub_1_11 Conf" class="gt_row gt_left">[512,390, 899,456]</td>
<td headers="by group: stub_1_11 ATT_cond" class="gt_row gt_right"> 647,703*</td>
<td headers="by group: stub_1_11 Conf_cond" class="gt_row gt_left">[499,693; 795,713]</td>
<td headers="by group: stub_1_11 ATT_cond_ny" class="gt_row gt_right">414,728*</td>
<td headers="by group: stub_1_11 Conf_cond_ny" class="gt_row gt_left">[320,550; 508,906]</td></tr>
    <tr><th id="stub_1_12" scope="row" class="gt_row gt_left gt_stub">Thessaloniki</th>
<td headers="by group: stub_1_12 ATT" class="gt_row gt_right">  -10,277</td>
<td headers="by group: stub_1_12 Conf" class="gt_row gt_left">[-70,991, 50,437]</td>
<td headers="by group: stub_1_12 ATT_cond" class="gt_row gt_right"> -13,389</td>
<td headers="by group: stub_1_12 Conf_cond" class="gt_row gt_left">[-88,493; 61,714]</td>
<td headers="by group: stub_1_12 ATT_cond_ny" class="gt_row gt_right">-13,389</td>
<td headers="by group: stub_1_12 Conf_cond_ny" class="gt_row gt_left">[-113,361; 86,583]</td></tr>
    <tr><th id="stub_1_13" scope="row" class="gt_row gt_left gt_stub">Genova</th>
<td headers="by group: stub_1_13 ATT" class="gt_row gt_right">   60,045</td>
<td headers="by group: stub_1_13 Conf" class="gt_row gt_left">[-3,595, 123,685]</td>
<td headers="by group: stub_1_13 ATT_cond" class="gt_row gt_right">  41,952</td>
<td headers="by group: stub_1_13 Conf_cond" class="gt_row gt_left">[-71,342; 155,246]</td>
<td headers="by group: stub_1_13 ATT_cond_ny" class="gt_row gt_right"> 38,824</td>
<td headers="by group: stub_1_13 Conf_cond_ny" class="gt_row gt_left">[-55,068; 132,716]</td></tr>
    <tr><th id="stub_1_14" scope="row" class="gt_row gt_left gt_stub">Marsaxlokk</th>
<td headers="by group: stub_1_14 ATT" class="gt_row gt_right">  -17,388</td>
<td headers="by group: stub_1_14 Conf" class="gt_row gt_left">[-150,419, 115,643]</td>
<td headers="by group: stub_1_14 ATT_cond" class="gt_row gt_right"> -35,503</td>
<td headers="by group: stub_1_14 Conf_cond" class="gt_row gt_left">[-106,745; 35,739]</td>
<td headers="by group: stub_1_14 ATT_cond_ny" class="gt_row gt_right">-26,592</td>
<td headers="by group: stub_1_14 Conf_cond_ny" class="gt_row gt_left">[-97,127; 43,943]</td></tr>
    <tr><th id="stub_1_15" scope="row" class="gt_row gt_left gt_stub">Amsterdam</th>
<td headers="by group: stub_1_15 ATT" class="gt_row gt_right">   11,930</td>
<td headers="by group: stub_1_15 Conf" class="gt_row gt_left">[-48,779, 72,640]</td>
<td headers="by group: stub_1_15 ATT_cond" class="gt_row gt_right">  17,870</td>
<td headers="by group: stub_1_15 Conf_cond" class="gt_row gt_left">[-27,182; 62,923]</td>
<td headers="by group: stub_1_15 ATT_cond_ny" class="gt_row gt_right"> 17,870</td>
<td headers="by group: stub_1_15 Conf_cond_ny" class="gt_row gt_left">[-33,350; 69,091]</td></tr>
    <tr><th id="stub_1_16" scope="row" class="gt_row gt_left gt_stub">Moerdijk</th>
<td headers="by group: stub_1_16 ATT" class="gt_row gt_right">   -5,873</td>
<td headers="by group: stub_1_16 Conf" class="gt_row gt_left">[-61,509, 49,763]</td>
<td headers="by group: stub_1_16 ATT_cond" class="gt_row gt_right">  18,766</td>
<td headers="by group: stub_1_16 Conf_cond" class="gt_row gt_left">[-63,943; 101,475]</td>
<td headers="by group: stub_1_16 ATT_cond_ny" class="gt_row gt_right"> 23,736</td>
<td headers="by group: stub_1_16 Conf_cond_ny" class="gt_row gt_left">[-49,463; 96,934]</td></tr>
    <tr><th id="stub_1_17" scope="row" class="gt_row gt_left gt_stub">Rotterdam</th>
<td headers="by group: stub_1_17 ATT" class="gt_row gt_right">1,032,160*</td>
<td headers="by group: stub_1_17 Conf" class="gt_row gt_left">[953,172, 1,111,148]</td>
<td headers="by group: stub_1_17 ATT_cond" class="gt_row gt_right"> 381,716*</td>
<td headers="by group: stub_1_17 Conf_cond" class="gt_row gt_left">[328,779; 434,653]</td>
<td headers="by group: stub_1_17 ATT_cond_ny" class="gt_row gt_right">123,788</td>
<td headers="by group: stub_1_17 Conf_cond_ny" class="gt_row gt_left">[-635; 248,211]</td></tr>
    <tr><th id="stub_1_18" scope="row" class="gt_row gt_left gt_stub">Gdynia</th>
<td headers="by group: stub_1_18 ATT" class="gt_row gt_right">   43,410</td>
<td headers="by group: stub_1_18 Conf" class="gt_row gt_left">[-44,144, 130,964]</td>
<td headers="by group: stub_1_18 ATT_cond" class="gt_row gt_right">  28,988</td>
<td headers="by group: stub_1_18 Conf_cond" class="gt_row gt_left">[-128,759; 186,735]</td>
<td headers="by group: stub_1_18 ATT_cond_ny" class="gt_row gt_right"> 24,567</td>
<td headers="by group: stub_1_18 Conf_cond_ny" class="gt_row gt_left">[-87,070; 136,203]</td></tr>
    <tr><th id="stub_1_19" scope="row" class="gt_row gt_left gt_stub">Ambarli</th>
<td headers="by group: stub_1_19 ATT" class="gt_row gt_right">  -37,238</td>
<td headers="by group: stub_1_19 Conf" class="gt_row gt_left">[-113,214, 38,737]</td>
<td headers="by group: stub_1_19 ATT_cond" class="gt_row gt_right"> -74,743</td>
<td headers="by group: stub_1_19 Conf_cond" class="gt_row gt_left">[-165,250; 15,765]</td>
<td headers="by group: stub_1_19 ATT_cond_ny" class="gt_row gt_right">-61,344</td>
<td headers="by group: stub_1_19 Conf_cond_ny" class="gt_row gt_left">[-126,929; 4,241]</td></tr>
  </tbody>
  
  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="7"> Stars indicate that the confidence interval does not include zero.</td>
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





# Parallel trend assumption
## Event study
For the DiD framework to deliver unbiased results, the parallel trend assumptions needs to hold. While it is not possible to test this assumption directly, we conduct a few test to validate whether the pre-treatment trends run parallel or not. The following graph displays and event study type aggregation of the group-time average treatment effects calculated above. The aggregated average treatment effects before treatment (red) are all around zero, indicating that parallel trends holds in the pre-treatment period. The graphs clearly indicate a persistent positive treatment effect after the treatment. The point-wise estimates are only significant in a couple of periods, which is due to the fact that some ports experience a high positive treatment effect while others do not. In particular *insert portnames* show consistently higher throughputs after treatment than the control group. 

![](Estimation_files/figure-html/unnamed-chunk-7-1.png)<!-- -->






<!-- Due to the small number of treated ports, there exists the possibility that the treated ports are just coincidentally experiencing an increase in the throughput after treatment. To alleviate these concerns, we conduct a placebo test testing the sharp null of an average treatment effect of zero @Young.2019. We exclude all treated ports from the data and randomly assign 18 port to be treated at a random point in time and calculate the simple average treatment effect. Repeating this process for 100 times yields the empirical distribution of treatment effects depicted in the bar chart below. As expected, the distribution is centered around zero, indicating that there is no consistent average treatment effect, when the treatment is assigned randomly. The observed treatment effect of the actual treated ports (vertical line) clearly lies at the right end of the distribution. If the true treatment effect was in fact zero and the observed treatment effect was only due to a coincidental lucky pick of ports and time, that probability of the observed treatment to occur effect would be p_value*100 percent. -->











# References

