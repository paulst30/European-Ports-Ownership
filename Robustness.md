---
title: "Robustness Checks"
author: "Paul Stricker"
bibliography: literature_list.bib
date: "2024-01-22"
output: 
 html_document:
      keep_md: true
---







# Cosco terminal level robustness check

## Terminal-level Difference in Difference

In the previous estimations, we used port-level data to measure the effect of Chinese investments on port performance. While this approach allowed us to control for various confounding variables in the fixed effects approach and gave us a nearly exhaustive coverage for the difference in difference calculations, it also comes with a lack in precision. Most of the Chinese investments do not target the whole port, but just one operational unit (usually a terminal). Therefore, our results might be driven by other terminals, which are part of the respective port but are not owned by Chinese investors. Vice versa, potentially poor performance of non-chinese terminals might negatively affect the estimated treatment effect. To tackle this shortcoming, this robustness check explores the effect of Chinese investments using terminal-level throughput data. The terminal-level throughput data is published on the Cosco website and covers all investments terminals Cosco invested in overseas. (footnote: unfortunately, CMP and Hutison ports do not publish terminal-level throughput data. However, given that most of the significant effects were found for Cosco-controlled ports, this robustness check covers most of the relevant ports.) The graphs below display the terminal-level throughput reportet by Coscos in relation to the total throughput of the respective port as reported by Eurostat. (footnote: Zeebruegge and Antwerp, and Bilbao and Valencia had to be combined due to Cosco's reporting practice) Clearly, besides Piraeus, none of the ports are fully under controll of Cosco. In som cases, the throughput associated with Cosco's terminal only makes up a fraction of the total port throughput. 



<img src="Robustness_files/figure-html/unnamed-chunk-3-1.png" style="display: block; margin: auto;" />




To pair Cosco's terminal-level data with our port-level data, we normalize the throughput by port size. Naturally, larger ports should have higher throughput and should have a higher capacity for growth. To make the port- and terminal-level data comparable, we consider the number of berths of each port (including berths used for passenger traffic), the number of berths that are predominantly used for container shippings, and the total number of container ships that can dock at containter terminal(s) (measured by quay length divided by 300m. For ports without quay length, the number of ships was guesstimated on google maps.). The graphs below illustrate how good each measure explains the container throughput of the ports in year 2020.  


<img src="Robustness_files/figure-html/unnamed-chunk-4-1.png" style="display: block; margin: auto;" />

The graph above indicates that the length of the quay measured in container ship length best explains the port-level throughput. Therefore, we will normalize the terminal-level throughput of cosco-controlled terminals and the port-level throughput by the number of container ships that can dock at all container terminals. The graph below plots the normalized throughput figures for all six ports that have received Cosco investments. The solid lines represents the throughput per ship slot of the Cosco's terminals, the dashed line represents throughput per ship slot of all terminals in the treated port (excluding those taken over by Cosco). As an additional reference, we also plot the average throughput per ship scored by all non-treated ports (dotted line). 



<img src="Robustness_files/figure-html/unnamed-chunk-5-1.png" style="display: block; margin: auto;" />

The table below contrasts the throughput per ship slot of Cosco's terminals with the average throughput per ship slot of european port. While for some ports this might be a reasonable controlgroup, for others, it is not. In particular Valencia and Bilbao, and Ambarli expierenced much stronger growth in the periods before the Chinese investment. Therefore, other controlgroups might be a sensible option: 

- use the remaining, non-chinese terminals in the treated port as control group. 
- use only a specific subsample of equally developed ports as control group.
- use ports that experienced a high than average growth rate as control group. 






```{=html}
<div id="vhhoizgosl" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#vhhoizgosl table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#vhhoizgosl thead, #vhhoizgosl tbody, #vhhoizgosl tfoot, #vhhoizgosl tr, #vhhoizgosl td, #vhhoizgosl th {
  border-style: none;
}

#vhhoizgosl p {
  margin: 0;
  padding: 0;
}

#vhhoizgosl .gt_table {
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

#vhhoizgosl .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#vhhoizgosl .gt_title {
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

#vhhoizgosl .gt_subtitle {
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

#vhhoizgosl .gt_heading {
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

#vhhoizgosl .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#vhhoizgosl .gt_col_headings {
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

#vhhoizgosl .gt_col_heading {
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

#vhhoizgosl .gt_column_spanner_outer {
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

#vhhoizgosl .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#vhhoizgosl .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#vhhoizgosl .gt_column_spanner {
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

#vhhoizgosl .gt_spanner_row {
  border-bottom-style: hidden;
}

#vhhoizgosl .gt_group_heading {
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

#vhhoizgosl .gt_empty_group_heading {
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

#vhhoizgosl .gt_from_md > :first-child {
  margin-top: 0;
}

#vhhoizgosl .gt_from_md > :last-child {
  margin-bottom: 0;
}

#vhhoizgosl .gt_row {
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

#vhhoizgosl .gt_stub {
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

#vhhoizgosl .gt_stub_row_group {
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

#vhhoizgosl .gt_row_group_first td {
  border-top-width: 2px;
}

#vhhoizgosl .gt_row_group_first th {
  border-top-width: 2px;
}

#vhhoizgosl .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#vhhoizgosl .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#vhhoizgosl .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#vhhoizgosl .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#vhhoizgosl .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#vhhoizgosl .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#vhhoizgosl .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#vhhoizgosl .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#vhhoizgosl .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#vhhoizgosl .gt_footnotes {
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

#vhhoizgosl .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#vhhoizgosl .gt_sourcenotes {
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

#vhhoizgosl .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#vhhoizgosl .gt_left {
  text-align: left;
}

#vhhoizgosl .gt_center {
  text-align: center;
}

#vhhoizgosl .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#vhhoizgosl .gt_font_normal {
  font-weight: normal;
}

#vhhoizgosl .gt_font_bold {
  font-weight: bold;
}

#vhhoizgosl .gt_font_italic {
  font-style: italic;
}

#vhhoizgosl .gt_super {
  font-size: 65%;
}

#vhhoizgosl .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#vhhoizgosl .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#vhhoizgosl .gt_indent_1 {
  text-indent: 5px;
}

#vhhoizgosl .gt_indent_2 {
  text-indent: 10px;
}

#vhhoizgosl .gt_indent_3 {
  text-indent: 15px;
}

#vhhoizgosl .gt_indent_4 {
  text-indent: 20px;
}

#vhhoizgosl .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="3" class="gt_heading gt_title gt_font_normal" style>Aggregation of group time average treatment effects</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="3" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>Control group: Never treated</td>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id=""></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="ATT">ATT</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="95% CI">95% CI</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <th colspan="3" class="gt_empty_group_heading" scope="colgroup" id=""></th>
    </tr>
    <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">simple average</th>
<td headers="NA stub_1_1 ATT" class="gt_row gt_right">37,457*</td>
<td headers="NA stub_1_1 Conf" class="gt_row gt_left">[21,613; 53,301]</td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="3" class="gt_group_heading" scope="colgroup" id="by group:">by group:</th>
    </tr>
    <tr class="gt_row_group_first"><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Zeebrugge and Antwerp</th>
<td headers="by group: stub_1_2 ATT" class="gt_row gt_right">37,315*</td>
<td headers="by group: stub_1_2 Conf" class="gt_row gt_left">[5,129; 69,500]</td></tr>
    <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">Valencia and Bilbao</th>
<td headers="by group: stub_1_3 ATT" class="gt_row gt_right">32,534*</td>
<td headers="by group: stub_1_3 Conf" class="gt_row gt_left">[3,692; 61,376]</td></tr>
    <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">Piraeus</th>
<td headers="by group: stub_1_4 ATT" class="gt_row gt_right">85,856*</td>
<td headers="by group: stub_1_4 Conf" class="gt_row gt_left">[58,534; 113,178]</td></tr>
    <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Genova</th>
<td headers="by group: stub_1_5 ATT" class="gt_row gt_right"> 6,082</td>
<td headers="by group: stub_1_5 Conf" class="gt_row gt_left">[-20,457; 32,621]</td></tr>
    <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">Rotterdam</th>
<td headers="by group: stub_1_6 ATT" class="gt_row gt_right">  -604</td>
<td headers="by group: stub_1_6 Conf" class="gt_row gt_left">[-19,256; 18,047]</td></tr>
    <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">Ambarli</th>
<td headers="by group: stub_1_7 ATT" class="gt_row gt_right">12,343</td>
<td headers="by group: stub_1_7 Conf" class="gt_row gt_left">[-21,181; 45,866]</td></tr>
  </tbody>
  
  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="3"> Confidence intervals are based on bootstrapped errors.</td>
    </tr>
  </tfoot>
</table>
</div>
```

The main disadvantage of this robustness check is that it cannot provide any indication of the validity of the PTA, since there is no terminal-level data before the Chinese investment available. To circumvent this, the first period of the treatment is used as the untreated throughput of each treated terminal. This assumption might be reasonable, considering that it is unlikely to see stark changes in infrastructure and management just one quarter after the take-over. On the other side, some might argue that the first period might a unfitting comparison, as ther port needs some adjustment time to the management change. This would cause an upward bias in the results. Additionally, in some cases, it appears likely that the investment targeted a more productive terminal of the port, which would result in an selection bias. To counteract this, either more information on port equipment (cranes or storage) could be used to construct counterfactuals. 

## The role of Chinese Containers

The previous analysis has shown that ports controlled by Chinese investors outperform other comparable European ports. One possible explanation is, that Chinese owned ports are the preferred destination of the Chinese container ships. That fits well with the literature on (add cosco line paper, maybe investment selection? Ports owned by a chinese company with a own fleet grow more that others. Media reports on "foot in the door strategy"). In this extension, we look into how much of the port growth after Chinese investment is indeed caused by more container arriving from China. To investigate this question, we return to the bilateral port-level data from Eurostat and estimate two additional DiD. In the first, we again aggregate the container throughput on port-quarter level but exclude all container traffic with China Mainland and Hong Kong. In the second, we use the share of chinese containers relative to containers from other origins in each port as dependent variable. In the latter case, the identifying parallel trends assumption that needs to hold is that the relative throughput of Chinese containers in treated ports trend in the same way as the relative throughput of Chinese containers in untreated ports @Olden.2022. (footnote: This setup has a number of advantages over a simple difference in difference using Chinese container throughput in levels as the outcome variable. In particular, the triple difference setup helps reducing potential bias that could be in a difference in difference estimation of Chinese container throughput versus container throughput of other origins for treated ports and untreated ports.) With the help of these two setups, we can infer whether the growth in throughput has been carried primarily by Chinese container shipments and whether that growth came at the expense of container shipments from other origins. 





```{=html}
<div id="jvzrkdiido" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#jvzrkdiido table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#jvzrkdiido thead, #jvzrkdiido tbody, #jvzrkdiido tfoot, #jvzrkdiido tr, #jvzrkdiido td, #jvzrkdiido th {
  border-style: none;
}

#jvzrkdiido p {
  margin: 0;
  padding: 0;
}

#jvzrkdiido .gt_table {
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

#jvzrkdiido .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#jvzrkdiido .gt_title {
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

#jvzrkdiido .gt_subtitle {
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

#jvzrkdiido .gt_heading {
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

#jvzrkdiido .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#jvzrkdiido .gt_col_headings {
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

#jvzrkdiido .gt_col_heading {
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

#jvzrkdiido .gt_column_spanner_outer {
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

#jvzrkdiido .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#jvzrkdiido .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#jvzrkdiido .gt_column_spanner {
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

#jvzrkdiido .gt_spanner_row {
  border-bottom-style: hidden;
}

#jvzrkdiido .gt_group_heading {
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

#jvzrkdiido .gt_empty_group_heading {
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

#jvzrkdiido .gt_from_md > :first-child {
  margin-top: 0;
}

#jvzrkdiido .gt_from_md > :last-child {
  margin-bottom: 0;
}

#jvzrkdiido .gt_row {
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

#jvzrkdiido .gt_stub {
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

#jvzrkdiido .gt_stub_row_group {
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

#jvzrkdiido .gt_row_group_first td {
  border-top-width: 2px;
}

#jvzrkdiido .gt_row_group_first th {
  border-top-width: 2px;
}

#jvzrkdiido .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#jvzrkdiido .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#jvzrkdiido .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#jvzrkdiido .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#jvzrkdiido .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#jvzrkdiido .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#jvzrkdiido .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#jvzrkdiido .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#jvzrkdiido .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#jvzrkdiido .gt_footnotes {
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

#jvzrkdiido .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#jvzrkdiido .gt_sourcenotes {
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

#jvzrkdiido .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#jvzrkdiido .gt_left {
  text-align: left;
}

#jvzrkdiido .gt_center {
  text-align: center;
}

#jvzrkdiido .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#jvzrkdiido .gt_font_normal {
  font-weight: normal;
}

#jvzrkdiido .gt_font_bold {
  font-weight: bold;
}

#jvzrkdiido .gt_font_italic {
  font-style: italic;
}

#jvzrkdiido .gt_super {
  font-size: 65%;
}

#jvzrkdiido .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#jvzrkdiido .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#jvzrkdiido .gt_indent_1 {
  text-indent: 5px;
}

#jvzrkdiido .gt_indent_2 {
  text-indent: 10px;
}

#jvzrkdiido .gt_indent_3 {
  text-indent: 15px;
}

#jvzrkdiido .gt_indent_4 {
  text-indent: 20px;
}

#jvzrkdiido .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="5" class="gt_heading gt_title gt_font_normal" style>Aggregated average treatment effects on container throughput from different origins</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="5" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>Control group: Never treated</td>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Dependent variable:">Dependent variable:</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="TEU without China">TEU without China</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="95% CI">95% CI</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Share of chinese TEU">Share of chinese TEU</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="95% CI">95% CI</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <th colspan="5" class="gt_empty_group_heading" scope="colgroup" id=""></th>
    </tr>
    <tr class="gt_row_group_first"><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">simple average</th>
<td headers="NA stub_1_1 ATT" class="gt_row gt_right">  42,393*</td>
<td headers="NA stub_1_1 Conf" class="gt_row gt_left">[9,667; 75,119]</td>
<td headers="NA stub_1_1 ATT1" class="gt_row gt_right"> 0.0079</td>
<td headers="NA stub_1_1 Conf1" class="gt_row gt_left">[-0.0107; 0.0265]</td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="5" class="gt_group_heading" scope="colgroup" id="by group:">by group:</th>
    </tr>
    <tr class="gt_row_group_first"><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Antwerpen</th>
<td headers="by group: stub_1_2 ATT" class="gt_row gt_right"> 320,875*</td>
<td headers="by group: stub_1_2 Conf" class="gt_row gt_left">[150,243; 491,507]</td>
<td headers="by group: stub_1_2 ATT1" class="gt_row gt_right">-0.0071</td>
<td headers="by group: stub_1_2 Conf1" class="gt_row gt_left">[-0.0685; 0.0543]</td></tr>
    <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">Zeebrugge</th>
<td headers="by group: stub_1_3 ATT" class="gt_row gt_right"> -77,901</td>
<td headers="by group: stub_1_3 Conf" class="gt_row gt_left">[-178,523; 22,720]</td>
<td headers="by group: stub_1_3 ATT1" class="gt_row gt_right">-0.0540*</td>
<td headers="by group: stub_1_3 Conf1" class="gt_row gt_left">[-0.0631; -0.0448]</td></tr>
    <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">Barcelona</th>
<td headers="by group: stub_1_4 ATT" class="gt_row gt_right"> 165,888*</td>
<td headers="by group: stub_1_4 Conf" class="gt_row gt_left">[25,424; 306,353]</td>
<td headers="by group: stub_1_4 ATT1" class="gt_row gt_right"> 0.0107</td>
<td headers="by group: stub_1_4 Conf1" class="gt_row gt_left">[-0.0050; 0.0264]</td></tr>
    <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Bilbao</th>
<td headers="by group: stub_1_5 ATT" class="gt_row gt_right">  -9,878</td>
<td headers="by group: stub_1_5 Conf" class="gt_row gt_left">[-79,419; 59,664]</td>
<td headers="by group: stub_1_5 ATT1" class="gt_row gt_right"> 0.0040</td>
<td headers="by group: stub_1_5 Conf1" class="gt_row gt_left">[-0.0028; 0.0107]</td></tr>
    <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">Valencia</th>
<td headers="by group: stub_1_6 ATT" class="gt_row gt_right">  60,168</td>
<td headers="by group: stub_1_6 Conf" class="gt_row gt_left">[-17,210; 137,547]</td>
<td headers="by group: stub_1_6 ATT1" class="gt_row gt_right">-0.0425*</td>
<td headers="by group: stub_1_6 Conf1" class="gt_row gt_left">[-0.0500; -0.0350]</td></tr>
    <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">Dunkerque</th>
<td headers="by group: stub_1_7 ATT" class="gt_row gt_right">  12,559</td>
<td headers="by group: stub_1_7 Conf" class="gt_row gt_left">[-66,039; 91,158]</td>
<td headers="by group: stub_1_7 ATT1" class="gt_row gt_right"> 0.1075*</td>
<td headers="by group: stub_1_7 Conf1" class="gt_row gt_left">[0.1001; 0.1149]</td></tr>
    <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">Le Havre</th>
<td headers="by group: stub_1_8 ATT" class="gt_row gt_right"> 109,637*</td>
<td headers="by group: stub_1_8 Conf" class="gt_row gt_left">[4,427; 214,847]</td>
<td headers="by group: stub_1_8 ATT1" class="gt_row gt_right">-0.0594*</td>
<td headers="by group: stub_1_8 Conf1" class="gt_row gt_left">[-0.0694; -0.0493]</td></tr>
    <tr><th id="stub_1_9" scope="row" class="gt_row gt_left gt_stub">Marseille</th>
<td headers="by group: stub_1_9 ATT" class="gt_row gt_right">  24,460</td>
<td headers="by group: stub_1_9 Conf" class="gt_row gt_left">[-80,660; 129,580]</td>
<td headers="by group: stub_1_9 ATT1" class="gt_row gt_right">-0.0180*</td>
<td headers="by group: stub_1_9 Conf1" class="gt_row gt_left">[-0.0250; -0.0109]</td></tr>
    <tr><th id="stub_1_10" scope="row" class="gt_row gt_left gt_stub">Nantes Saint Nazaire</th>
<td headers="by group: stub_1_10 ATT" class="gt_row gt_right"> -19,312</td>
<td headers="by group: stub_1_10 Conf" class="gt_row gt_left">[-119,857; 81,234]</td>
<td headers="by group: stub_1_10 ATT1" class="gt_row gt_right">-0.0614*</td>
<td headers="by group: stub_1_10 Conf1" class="gt_row gt_left">[-0.0710; -0.0518]</td></tr>
    <tr><th id="stub_1_11" scope="row" class="gt_row gt_left gt_stub">Piraeus</th>
<td headers="by group: stub_1_11 ATT" class="gt_row gt_right"> 488,244*</td>
<td headers="by group: stub_1_11 Conf" class="gt_row gt_left">[304,827; 671,660]</td>
<td headers="by group: stub_1_11 ATT1" class="gt_row gt_right"> 0.0639*</td>
<td headers="by group: stub_1_11 Conf1" class="gt_row gt_left">[0.0171; 0.1108]</td></tr>
    <tr><th id="stub_1_12" scope="row" class="gt_row gt_left gt_stub">Thessaloniki</th>
<td headers="by group: stub_1_12 ATT" class="gt_row gt_right"> -13,936</td>
<td headers="by group: stub_1_12 Conf" class="gt_row gt_left">[-57,632; 29,760]</td>
<td headers="by group: stub_1_12 ATT1" class="gt_row gt_right">-0.0002</td>
<td headers="by group: stub_1_12 Conf1" class="gt_row gt_left">[-0.0073; 0.0069]</td></tr>
    <tr><th id="stub_1_13" scope="row" class="gt_row gt_left gt_stub">Genova</th>
<td headers="by group: stub_1_13 ATT" class="gt_row gt_right">     867</td>
<td headers="by group: stub_1_13 Conf" class="gt_row gt_left">[-94,222; 95,955]</td>
<td headers="by group: stub_1_13 ATT1" class="gt_row gt_right"> 0.0688*</td>
<td headers="by group: stub_1_13 Conf1" class="gt_row gt_left">[0.0666; 0.0711]</td></tr>
    <tr><th id="stub_1_14" scope="row" class="gt_row gt_left gt_stub">Marsaxlokk</th>
<td headers="by group: stub_1_14 ATT" class="gt_row gt_right"> -26,892</td>
<td headers="by group: stub_1_14 Conf" class="gt_row gt_left">[-122,057; 68,274]</td>
<td headers="by group: stub_1_14 ATT1" class="gt_row gt_right"> 0.0197*</td>
<td headers="by group: stub_1_14 Conf1" class="gt_row gt_left">[0.0096; 0.0297]</td></tr>
    <tr><th id="stub_1_15" scope="row" class="gt_row gt_left gt_stub">Amsterdam</th>
<td headers="by group: stub_1_15 ATT" class="gt_row gt_right">  15,045</td>
<td headers="by group: stub_1_15 Conf" class="gt_row gt_left">[-58,989; 89,079]</td>
<td headers="by group: stub_1_15 ATT1" class="gt_row gt_right"> 0.0053*</td>
<td headers="by group: stub_1_15 Conf1" class="gt_row gt_left">[0.0004; 0.0102]</td></tr>
    <tr><th id="stub_1_16" scope="row" class="gt_row gt_left gt_stub">Moerdijk</th>
<td headers="by group: stub_1_16 ATT" class="gt_row gt_right">  15,121</td>
<td headers="by group: stub_1_16 Conf" class="gt_row gt_left">[-35,333; 65,574]</td>
<td headers="by group: stub_1_16 ATT1" class="gt_row gt_right">-0.0212</td>
<td headers="by group: stub_1_16 Conf1" class="gt_row gt_left">[-0.0919; 0.0495]</td></tr>
    <tr><th id="stub_1_17" scope="row" class="gt_row gt_left gt_stub">Rotterdam</th>
<td headers="by group: stub_1_17 ATT" class="gt_row gt_right">-321,952*</td>
<td headers="by group: stub_1_17 Conf" class="gt_row gt_left">[-429,307; -214,597]</td>
<td headers="by group: stub_1_17 ATT1" class="gt_row gt_right"> 0.0730</td>
<td headers="by group: stub_1_17 Conf1" class="gt_row gt_left">[-0.0135; 0.1594]</td></tr>
    <tr><th id="stub_1_18" scope="row" class="gt_row gt_left gt_stub">Gdynia</th>
<td headers="by group: stub_1_18 ATT" class="gt_row gt_right">  39,396</td>
<td headers="by group: stub_1_18 Conf" class="gt_row gt_left">[-87,738; 166,531]</td>
<td headers="by group: stub_1_18 ATT1" class="gt_row gt_right">-0.0061</td>
<td headers="by group: stub_1_18 Conf1" class="gt_row gt_left">[-0.0936; 0.0814]</td></tr>
    <tr><th id="stub_1_19" scope="row" class="gt_row gt_left gt_stub">Ambarli</th>
<td headers="by group: stub_1_19 ATT" class="gt_row gt_right"> -46,518</td>
<td headers="by group: stub_1_19 Conf" class="gt_row gt_left">[-159,495; 66,460]</td>
<td headers="by group: stub_1_19 ATT1" class="gt_row gt_right">-0.0266*</td>
<td headers="by group: stub_1_19 Conf1" class="gt_row gt_left">[-0.0467; -0.0065]</td></tr>
  </tbody>
  
  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="5"> Confidence intervals are based on bootstrapped errors. </td>
    </tr>
  </tfoot>
</table>
</div>
```

# References
