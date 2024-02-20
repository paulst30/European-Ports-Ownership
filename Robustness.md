---
title: "Robustness Checks"
author: "Paul Stricker"
date: "2024-01-22"
output: 
 html_document:
      keep_md: true
---







# Cosco terminal level robustness check

## Terminal-level Difference in Difference

In the previous estimations, we used port-level data to measure the effect of Chinese investments on port performance. While this approach allowed us to control for various confounding variables in the fixed effects approach and gave us a nearly exhaustive coverage for the difference in difference calculations, it also comes with a lack in precision. Most of the Chinese investments do not target the whole port, but just one operational unit (usually a terminal). Therefore, our results might be driven by other terminals, which are part of the respective port but are not owned by Chinese investors. Vice versa, potentially poor performance of non-chinese terminals might negatively affect the estimated treatment effect. To tackle this shortcoming, this robustness check explores the effect of Chinese investments using terminal-level throughput data. The terminal-level throughput data is published on the Cosco website and covers all investments terminals Cosco invested in overseas. (footnote: unfortunately, CMP and Hutison ports do not publish terminal-level throughput data. However, given that most of the significant effects were found for Cosco-controlled ports, this robustness check covers most of the relevant ports.) The graphs below display the terminal-level throughput reportet by Coscos in relation to the total throughput of the respective port as reported by Eurostat. (footnote: Zeebruegge and Antwerp, and Bilbao and Valencia had to be combined due to Cosco's reporting practice) Clearly, besides Piraeus, none of the ports are fully under controll of Cosco. In som cases, the throughput associated with Cosco's terminal only makes up a fraction of the total port throughput. 



![](Robustness_files/figure-html/unnamed-chunk-3-1.png)<!-- -->




To pair Cosco's terminal-level data with our port-level data, we normalize the throughput by port size. Naturally, larger ports should have higher throughput and should have a higher capacity for growth. To make the port- and terminal-level data comparable, we consider the number of berths of each port (including berths used for passenger traffic), the number of berths that are predominantly used for container shippings, and the total number of container ships that can dock at containter terminal(s) (measured by quay length divided by 300m. For ports without quay length, the number of ships was guesstimated on google maps.). The graphs below illustrate how good each measure explains the container throughput of the ports in year 2020.  


![](Robustness_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

The graph above indicates that the length of the quay measured in container ship length best explains the port-level throughput. Therefore, we will normalize the terminal-level throughput of cosco-controlled terminals and the port-level throughput by the number of container ships that can dock at all container terminals. The graph below plots the normalized throughput figures for all six ports that have received Cosco investments. The solid lines represents the throughput per ship slot of the Cosco's terminals, the dashed line represents throughput per ship slot of all terminals in the treated port (excluding those taken over by Cosco). As an additional reference, we also plot the average throughput per ship scored by all non-treated ports (dotted line). 



![](Robustness_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

The table below contrasts the throughput per ship slot of Cosco's terminals with the average throughput per ship slot of european port. While for some ports this might be a reasonable controlgroup, for others, it is not. In particular Valencia and Bilbao, and Ambarli expierenced much stronger growth in the periods before the Chinese investment. Therefore, other controlgroups might be a sensible option: 

- use the remaining, non-chinese terminals in the treated port as control group. 
- use only a specific subsample of equally developed ports as control group.
- use ports that experienced a high than average growth rate as control group. 






```{=html}
<div id="gzxcnkjpvz" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#gzxcnkjpvz table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#gzxcnkjpvz thead, #gzxcnkjpvz tbody, #gzxcnkjpvz tfoot, #gzxcnkjpvz tr, #gzxcnkjpvz td, #gzxcnkjpvz th {
  border-style: none;
}

#gzxcnkjpvz p {
  margin: 0;
  padding: 0;
}

#gzxcnkjpvz .gt_table {
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

#gzxcnkjpvz .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#gzxcnkjpvz .gt_title {
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

#gzxcnkjpvz .gt_subtitle {
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

#gzxcnkjpvz .gt_heading {
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

#gzxcnkjpvz .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#gzxcnkjpvz .gt_col_headings {
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

#gzxcnkjpvz .gt_col_heading {
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

#gzxcnkjpvz .gt_column_spanner_outer {
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

#gzxcnkjpvz .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#gzxcnkjpvz .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#gzxcnkjpvz .gt_column_spanner {
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

#gzxcnkjpvz .gt_spanner_row {
  border-bottom-style: hidden;
}

#gzxcnkjpvz .gt_group_heading {
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

#gzxcnkjpvz .gt_empty_group_heading {
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

#gzxcnkjpvz .gt_from_md > :first-child {
  margin-top: 0;
}

#gzxcnkjpvz .gt_from_md > :last-child {
  margin-bottom: 0;
}

#gzxcnkjpvz .gt_row {
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

#gzxcnkjpvz .gt_stub {
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

#gzxcnkjpvz .gt_stub_row_group {
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

#gzxcnkjpvz .gt_row_group_first td {
  border-top-width: 2px;
}

#gzxcnkjpvz .gt_row_group_first th {
  border-top-width: 2px;
}

#gzxcnkjpvz .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#gzxcnkjpvz .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#gzxcnkjpvz .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#gzxcnkjpvz .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#gzxcnkjpvz .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#gzxcnkjpvz .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#gzxcnkjpvz .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#gzxcnkjpvz .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#gzxcnkjpvz .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#gzxcnkjpvz .gt_footnotes {
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

#gzxcnkjpvz .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#gzxcnkjpvz .gt_sourcenotes {
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

#gzxcnkjpvz .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#gzxcnkjpvz .gt_left {
  text-align: left;
}

#gzxcnkjpvz .gt_center {
  text-align: center;
}

#gzxcnkjpvz .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#gzxcnkjpvz .gt_font_normal {
  font-weight: normal;
}

#gzxcnkjpvz .gt_font_bold {
  font-weight: bold;
}

#gzxcnkjpvz .gt_font_italic {
  font-style: italic;
}

#gzxcnkjpvz .gt_super {
  font-size: 65%;
}

#gzxcnkjpvz .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#gzxcnkjpvz .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#gzxcnkjpvz .gt_indent_1 {
  text-indent: 5px;
}

#gzxcnkjpvz .gt_indent_2 {
  text-indent: 10px;
}

#gzxcnkjpvz .gt_indent_3 {
  text-indent: 15px;
}

#gzxcnkjpvz .gt_indent_4 {
  text-indent: 20px;
}

#gzxcnkjpvz .gt_indent_5 {
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
<td headers="NA stub_1_1 ATT" class="gt_row gt_right">38,434.06<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="NA stub_1_1 lower" class="gt_row gt_right">12,263.25</td>
<td headers="NA stub_1_1 upper" class="gt_row gt_right">64,604.87</td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="4" class="gt_group_heading" scope="colgroup" id="by group:">by group:</th>
    </tr>
    <tr class="gt_row_group_first"><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Zeebrugge and Antwerp (36)</th>
<td headers="by group: stub_1_2 ATT" class="gt_row gt_right">37,149.11<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_2 lower" class="gt_row gt_right">33,260.33</td>
<td headers="by group: stub_1_2 upper" class="gt_row gt_right">41,037.89</td></tr>
    <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">Piraeus (53)</th>
<td headers="by group: stub_1_3 ATT" class="gt_row gt_right">86,165.12<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_3 lower" class="gt_row gt_right">80,765.54</td>
<td headers="by group: stub_1_3 upper" class="gt_row gt_right">91,564.69</td></tr>
    <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">Ambarli (78)</th>
<td headers="by group: stub_1_4 ATT" class="gt_row gt_right">14,208.92<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_4 lower" class="gt_row gt_right">9,835.81</td>
<td headers="by group: stub_1_4 upper" class="gt_row gt_right">18,582.03</td></tr>
    <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Rotterdam (81)</th>
<td headers="by group: stub_1_5 ATT" class="gt_row gt_right">1,208.66</td>
<td headers="by group: stub_1_5 lower" class="gt_row gt_right">−4,656.71</td>
<td headers="by group: stub_1_5 upper" class="gt_row gt_right">7,074.02</td></tr>
    <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">Genova (83)</th>
<td headers="by group: stub_1_6 ATT" class="gt_row gt_right">8,420.59<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_6 lower" class="gt_row gt_right">3,446.33</td>
<td headers="by group: stub_1_6 upper" class="gt_row gt_right">13,394.85</td></tr>
    <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">Valencia and Bilbao (85)</th>
<td headers="by group: stub_1_7 ATT" class="gt_row gt_right">34,842.36<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_7 lower" class="gt_row gt_right">30,056.96</td>
<td headers="by group: stub_1_7 upper" class="gt_row gt_right">39,627.77</td></tr>
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

The main disadvantage of this robustness check is that it cannot provide any indication of the validity of the PTA, since there is no terminal-level data before the Chinese investment available. To circumvent this, the first period of the treatment is used as the untreated throughput of each treated terminal. This assumption might be reasonable, considering that it is unlikely to see stark changes in infrastructure and management just one quarter after the take-over. On the other side, some might argue that the first period might a unfitting comparison, as ther port needs some adjustment time to the management change. This would cause an upward bias in the results. Additionally, in some cases, it appears likely that the investment targeted a more productive terminal of the port, which would result in an selection bias. To counteract this, either more information on port equipment (cranes or storage) could be used to construct counterfactuals. 

## The role of Chinese Containers

The previous analysis has shown that ports controlled by Chinese investors outperform other comparable European ports. One possible explanation is, that Chinese owned ports are the preferred destination of the Chinese container ships. That fits well with the literature on (add cosco line paper, maybe investment selection? Ports owned by a chinese company with a own fleet grow more that others. Media reports on "foot in the door strategy"). In this extension, we look into how much of the port growth after Chinese investment is indeed caused by more container arriving from China. To investigate this question, we return to the bilateral port-level data from Eurostat and estimate two additional DiD. In the first, we again aggregate the container throughput on port-quarter level but exclude all container traffic with China Mainland and Hong Kong. In the second, we use the share of chinese containers relative to containers from other origins in each port as dependent variable. With the help of these two setups, we can infer whether the growth in throughput has been carried primarily by Chinese container shipments and whether that growth came at the expense of container shipments from other origins. 





```{=html}
<div id="ktyjfjvleg" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#ktyjfjvleg table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#ktyjfjvleg thead, #ktyjfjvleg tbody, #ktyjfjvleg tfoot, #ktyjfjvleg tr, #ktyjfjvleg td, #ktyjfjvleg th {
  border-style: none;
}

#ktyjfjvleg p {
  margin: 0;
  padding: 0;
}

#ktyjfjvleg .gt_table {
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

#ktyjfjvleg .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#ktyjfjvleg .gt_title {
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

#ktyjfjvleg .gt_subtitle {
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

#ktyjfjvleg .gt_heading {
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

#ktyjfjvleg .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ktyjfjvleg .gt_col_headings {
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

#ktyjfjvleg .gt_col_heading {
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

#ktyjfjvleg .gt_column_spanner_outer {
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

#ktyjfjvleg .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#ktyjfjvleg .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#ktyjfjvleg .gt_column_spanner {
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

#ktyjfjvleg .gt_spanner_row {
  border-bottom-style: hidden;
}

#ktyjfjvleg .gt_group_heading {
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

#ktyjfjvleg .gt_empty_group_heading {
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

#ktyjfjvleg .gt_from_md > :first-child {
  margin-top: 0;
}

#ktyjfjvleg .gt_from_md > :last-child {
  margin-bottom: 0;
}

#ktyjfjvleg .gt_row {
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

#ktyjfjvleg .gt_stub {
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

#ktyjfjvleg .gt_stub_row_group {
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

#ktyjfjvleg .gt_row_group_first td {
  border-top-width: 2px;
}

#ktyjfjvleg .gt_row_group_first th {
  border-top-width: 2px;
}

#ktyjfjvleg .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ktyjfjvleg .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#ktyjfjvleg .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#ktyjfjvleg .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ktyjfjvleg .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ktyjfjvleg .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#ktyjfjvleg .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#ktyjfjvleg .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#ktyjfjvleg .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ktyjfjvleg .gt_footnotes {
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

#ktyjfjvleg .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#ktyjfjvleg .gt_sourcenotes {
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

#ktyjfjvleg .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#ktyjfjvleg .gt_left {
  text-align: left;
}

#ktyjfjvleg .gt_center {
  text-align: center;
}

#ktyjfjvleg .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#ktyjfjvleg .gt_font_normal {
  font-weight: normal;
}

#ktyjfjvleg .gt_font_bold {
  font-weight: bold;
}

#ktyjfjvleg .gt_font_italic {
  font-style: italic;
}

#ktyjfjvleg .gt_super {
  font-size: 65%;
}

#ktyjfjvleg .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#ktyjfjvleg .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#ktyjfjvleg .gt_indent_1 {
  text-indent: 5px;
}

#ktyjfjvleg .gt_indent_2 {
  text-indent: 10px;
}

#ktyjfjvleg .gt_indent_3 {
  text-indent: 15px;
}

#ktyjfjvleg .gt_indent_4 {
  text-indent: 20px;
}

#ktyjfjvleg .gt_indent_5 {
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
<td headers="NA stub_1_1 ATT" class="gt_row gt_right">159,926.35<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="NA stub_1_1 lower" class="gt_row gt_right">21,606.51</td>
<td headers="NA stub_1_1 upper" class="gt_row gt_right">298,246.20</td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="4" class="gt_group_heading" scope="colgroup" id="by group:">by group:</th>
    </tr>
    <tr class="gt_row_group_first"><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Moerdijk, Rotterdam (21)</th>
<td headers="by group: stub_1_2 ATT" class="gt_row gt_right">198,293.74</td>
<td headers="by group: stub_1_2 lower" class="gt_row gt_right">−131,078.85</td>
<td headers="by group: stub_1_2 upper" class="gt_row gt_right">527,666.32</td></tr>
    <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">Antwerpen (32)</th>
<td headers="by group: stub_1_3 ATT" class="gt_row gt_right">774,003.48<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_3 lower" class="gt_row gt_right">760,793.74</td>
<td headers="by group: stub_1_3 upper" class="gt_row gt_right">787,213.23</td></tr>
    <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">Gdynia (38)</th>
<td headers="by group: stub_1_4 ATT" class="gt_row gt_right">43,000.53<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_4 lower" class="gt_row gt_right">29,065.96</td>
<td headers="by group: stub_1_4 upper" class="gt_row gt_right">56,935.09</td></tr>
    <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Piraeus (52)</th>
<td headers="by group: stub_1_5 ATT" class="gt_row gt_right">530,618.85<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_5 lower" class="gt_row gt_right">513,176.81</td>
<td headers="by group: stub_1_5 upper" class="gt_row gt_right">548,060.90</td></tr>
    <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">Barcelona (63)</th>
<td headers="by group: stub_1_6 ATT" class="gt_row gt_right">164,129.07<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_6 lower" class="gt_row gt_right">148,259.36</td>
<td headers="by group: stub_1_6 upper" class="gt_row gt_right">179,998.78</td></tr>
    <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">Dunkerque, Le Havre, Marsaxlokk, Marseille, Nantes Saint Nazaire, Zeebrugge (66)</th>
<td headers="by group: stub_1_7 ATT" class="gt_row gt_right">5,375.86</td>
<td headers="by group: stub_1_7 lower" class="gt_row gt_right">−47,867.24</td>
<td headers="by group: stub_1_7 upper" class="gt_row gt_right">58,618.96</td></tr>
    <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">Ambarli (76)</th>
<td headers="by group: stub_1_8 ATT" class="gt_row gt_right">−23,060.17<span class="gt_footnote_marks gt_asterisk" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>*</sup></span></td>
<td headers="by group: stub_1_8 lower" class="gt_row gt_right">−40,692.64</td>
<td headers="by group: stub_1_8 upper" class="gt_row gt_right">−5,427.69</td></tr>
    <tr><th id="stub_1_9" scope="row" class="gt_row gt_left gt_stub">Genova (81)</th>
<td headers="by group: stub_1_9 ATT" class="gt_row gt_right">5,896.62</td>
<td headers="by group: stub_1_9 lower" class="gt_row gt_right">−13,276.75</td>
<td headers="by group: stub_1_9 upper" class="gt_row gt_right">25,069.99</td></tr>
    <tr><th id="stub_1_10" scope="row" class="gt_row gt_left gt_stub">Bilbao, Valencia (84)</th>
<td headers="by group: stub_1_10 ATT" class="gt_row gt_right">21,218.84</td>
<td headers="by group: stub_1_10 lower" class="gt_row gt_right">−54,049.91</td>
<td headers="by group: stub_1_10 upper" class="gt_row gt_right">96,487.59</td></tr>
    <tr><th id="stub_1_11" scope="row" class="gt_row gt_left gt_stub">Amsterdam, Thessaloniki (85)</th>
<td headers="by group: stub_1_11 ATT" class="gt_row gt_right">−4,058.38</td>
<td headers="by group: stub_1_11 lower" class="gt_row gt_right">−32,226.07</td>
<td headers="by group: stub_1_11 upper" class="gt_row gt_right">24,109.31</td></tr>
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

