---
title: "Descriptives"
author: "Paul Stricker"
date: "2023-11-21"
output: 
   html_document:
      keep_md: true
---






# What is the relevant sample? 

## Which type of cargo?

Most throughput of energy commodities (transported in bulks) and Ro-Ro comes from countries other than China. The highest share of Chinese products is shipped with container cargo. Therefore, the sample is restricted to container cargo only.

![](Descriptives_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

## Container weight versus volume 

![](Descriptives_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

Container processing can be measured with two variables: Container weight or volume (TEU). Above graph shows, that the relation between the two is mostly linear. To make the results of our analysis more comparable to other studies and data sources, we will proceed using data on container TEUs. 


## Which ports are relevant? 



Most of the throughput concentrates in a few hundred ports. Limiting the sample to 129 ports that are responsible for 99 percent of the container shipments might be a sensible option (65 of these are aggregates of ports). Additionally, not all ports process Chinese goods. While all major ports do, especially small ports usually do not. 

![](Descriptives_files/figure-html/unnamed-chunk-5-1.png)<!-- -->




An alternative to filtering by the aggregated throughput could be filtering by the average throughput. The graph below display the cumulative total throughput relative to the average yearly throughput. The graph indicates that possible cut-off thresholds of 10, 20, and 30 thousand TEUs of yearly average container throughput are associated with a loss of 0.8, 1.4, and 2.9 percent of the cumulative total container throughput. In the following, the sample is constructed by applying a threshold of 20 thousand TEUs of average yearly container throughput.  

![](Descriptives_files/figure-html/unnamed-chunk-7-1.png)<!-- -->




# Sample

## Descriptives




The statistical units in the Eurostat data are a mixed list of actual ports and grouped ports (statistical ports) and geographic areas, which represent aggregates of many ports. While the port groups "usually" have one port management, this cannot be assumed for everyone. In addition, statistical ports that represent a group of ports make up the majority of the container shipments (49.1 percent). The definition of the statistical units (statistical ports and geographic aggregates) can be found in the [metadata](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv:OJ.L_.2018.180.01.0029.01.ENG&toc=OJ:L:2018:180:FULL), and in the [annex](https://ec.europa.eu/eurostat/cache/metadata/Annexes/mar_esms_an_2.xlsx). As of now, the sample is restricted to statistical ports (no geographic aggregates). The remaining sample includes:

- 26 reporting countries
- 139 ports 
- 194 origin countries
- 26 years (1997-2023, covering 107 quarters)







## Distribution of throughput by ports and origin





Port that process a relatively high share of cargo from China are generally large ports. Below are displayed the top 50 largest ports, their aggregate throughput and their throughput of Chinese container shipments (Mainland China + Hong Kong). The other graph displays the top 50 ports with the highest share of Chinese container throughput. Both lists are rather similar with 18 large ports which are not among the top 50 ports with high Chinese container throughput. 

![](Descriptives_files/figure-html/unnamed-chunk-13-1.png)<!-- -->![](Descriptives_files/figure-html/unnamed-chunk-13-2.png)<!-- -->


Above graphs indicate that the share of Chinese cargo is (surprisingly) low. The graph below plots the total container shipments from China, the total container shipments from origins other than China and the share of Chinese containers in percent. Recent global crises, like the financial crisis in 2007-2009, the corona-pandemic in 2020, and the Ukraine war in 2023 have led to drops in total cargo shipments. Interestingly, despite the narrative of the ever increasing dependency on Chinese goods, the share of Chinese container shipments is on a declining path since 2012. 

![](Descriptives_files/figure-html/unnamed-chunk-15-1.png)<!-- -->



![](Descriptives_files/figure-html/unnamed-chunk-16-1.png)<!-- -->

## Chinese ownership treatment



Originally, we found 26 ports which were at some point at least partly owned by a Chinese company. The selected sample contains 18 treated ports. Eight ports dropped out of the sample due to various reasons:

- One port does not report any data (Willebroek)
- One falls into an aggregate of many ports (Venlo, is included in an aggregate of 96 ports)
- One falls below the average throughput threshold of 20 million TEUs (Stockholm)
- Four ports were always treated (Duisburg, Felixtowe, Thamesport, Harwich)
- On is excluded due to being treated only very recently (Hamburg)

The following graph display all 18 treated ports and their annual container throughput as a share of their mean container throughput. The vertical lines indicate treatment time. Solid line represent the container throughput of the respective port. The dashed line represents the average throughput of the control group. Note that not all ports report the throughput for every period. This might influence the average.

![](Descriptives_files/figure-html/unnamed-chunk-18-1.png)<!-- -->




```r
# generate latex table

# Insert multirow cell into the appropriate position in the LaTeX code
addtorow <- list()
addtorow$pos <- list(nrow(sumstats))
addtorow$command <- c("[2ex] \\hline \\hline \\multicolumn{6}{l}{\\shortstack[l]{\\small Note: $\\Delta$ refers to average quarterly changes. Ports recieved equal \\\\ weights in the calculation of means and average changes.}}\\\\")

# Modify the LaTeX code
latex_code <- print.xtable(xtable(sumstats, caption = "Summary statistics"),
                           label = "tab:sumstats",
                           caption.placement = "top",
                           include.rownames = FALSE,
                           add.to.row = addtorow,
                           hline.after = c(-1,-1,0),
                           size = "\\begin{adjustbox}{max width=\\textwidth}")
```

```
## % latex table generated in R 4.2.2 by xtable 1.8-4 package
## % Fri Apr 26 10:54:25 2024
## \begin{table}[ht]
## \centering
## \caption{Summary statistics} 
## \begingroup\begin{adjustbox}{max width=\textwidth}
## \begin{tabular}{llllll}
##   \hline
## \hline
## vars & mean.x & agrate & mean.y & agrate0 & agrate1 \\ 
##   \hline
## container & 115,335 & 845 & 490,538 & 5,030 & 5,861 \\ 
##    [2ex] \hline \hline \multicolumn{6}{l}{\shortstack[l]{\small Note: $\Delta$ refers to average quarterly changes. Ports recieved equal \\ weights in the calculation of means and average changes.}}\\\end{tabular}
## \endgroup
## \end{table}
```

```r
latex_code <- gsub("\\\\end\\{tabular\\}", "\\\\end{tabular} \n \\\\end{adjustbox}", latex_code)
latex_code <- gsub("vars & mean.x & agrate & mean.y & agrate0 & agrate1"," & \\\\multicolumn{2}{c}{Control group [n=XX]} & \\\\multicolumn{3}{c}{Treatment group [n=XX]} \\\\\\\\\n \\\\cmidrule(lr){2-3} \\\\cmidrule(lr){4-6}  Var. & mean & $\\\\Delta$ & mean & $\\\\Delta$ [$t \\\\leq t^*$] & $\\\\Delta$ [$t>t^*$]", latex_code)

# Save modified LaTeX code to a .tex file
cat(latex_code, file = file.path(getwd(), "results_tables", "sumstats.tex"))


# generate a gt table
sumstats_gt <- gt(sumstats, rowname_col = "vars") |>
              tab_header(
                title = "Summary statistics") |>
              cols_label(
                mean.x="mean",
                agrate="av. delta",
                mean.y="mean",
                agrate0="av.delta (t<t*)",
                agrate1="av.delta (t>t*)"
              ) |>
              tab_spanner(label = "Control group",
                          columns = c("mean.x", "agrate")) |>
              tab_spanner(label = "Treated",
                          columns = c("mean.y", "agrate0", "agrate1")) |>
              sub_missing(columns = everything(),
                          rows = everything(),
                          missing_text = "") |>
              tab_footnote(footnote = "") |>
              tab_options(stub.border.width = 0,
                          table_body.hlines.width = 0
              )

sumstats_gt
```

```{=html}
<div id="mgybqnhgtm" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#mgybqnhgtm table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#mgybqnhgtm thead, #mgybqnhgtm tbody, #mgybqnhgtm tfoot, #mgybqnhgtm tr, #mgybqnhgtm td, #mgybqnhgtm th {
  border-style: none;
}

#mgybqnhgtm p {
  margin: 0;
  padding: 0;
}

#mgybqnhgtm .gt_table {
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

#mgybqnhgtm .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#mgybqnhgtm .gt_title {
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

#mgybqnhgtm .gt_subtitle {
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

#mgybqnhgtm .gt_heading {
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

#mgybqnhgtm .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#mgybqnhgtm .gt_col_headings {
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

#mgybqnhgtm .gt_col_heading {
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

#mgybqnhgtm .gt_column_spanner_outer {
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

#mgybqnhgtm .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#mgybqnhgtm .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#mgybqnhgtm .gt_column_spanner {
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

#mgybqnhgtm .gt_spanner_row {
  border-bottom-style: hidden;
}

#mgybqnhgtm .gt_group_heading {
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

#mgybqnhgtm .gt_empty_group_heading {
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

#mgybqnhgtm .gt_from_md > :first-child {
  margin-top: 0;
}

#mgybqnhgtm .gt_from_md > :last-child {
  margin-bottom: 0;
}

#mgybqnhgtm .gt_row {
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

#mgybqnhgtm .gt_stub {
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

#mgybqnhgtm .gt_stub_row_group {
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

#mgybqnhgtm .gt_row_group_first td {
  border-top-width: 2px;
}

#mgybqnhgtm .gt_row_group_first th {
  border-top-width: 2px;
}

#mgybqnhgtm .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#mgybqnhgtm .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#mgybqnhgtm .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#mgybqnhgtm .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#mgybqnhgtm .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#mgybqnhgtm .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#mgybqnhgtm .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#mgybqnhgtm .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#mgybqnhgtm .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#mgybqnhgtm .gt_footnotes {
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

#mgybqnhgtm .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#mgybqnhgtm .gt_sourcenotes {
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

#mgybqnhgtm .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#mgybqnhgtm .gt_left {
  text-align: left;
}

#mgybqnhgtm .gt_center {
  text-align: center;
}

#mgybqnhgtm .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#mgybqnhgtm .gt_font_normal {
  font-weight: normal;
}

#mgybqnhgtm .gt_font_bold {
  font-weight: bold;
}

#mgybqnhgtm .gt_font_italic {
  font-style: italic;
}

#mgybqnhgtm .gt_super {
  font-size: 65%;
}

#mgybqnhgtm .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#mgybqnhgtm .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#mgybqnhgtm .gt_indent_1 {
  text-indent: 5px;
}

#mgybqnhgtm .gt_indent_2 {
  text-indent: 10px;
}

#mgybqnhgtm .gt_indent_3 {
  text-indent: 15px;
}

#mgybqnhgtm .gt_indent_4 {
  text-indent: 20px;
}

#mgybqnhgtm .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="6" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Summary statistics</td>
    </tr>
    
    <tr class="gt_col_headings gt_spanner_row">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id=""></th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Control group">
        <span class="gt_column_spanner">Control group</span>
      </th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="Treated">
        <span class="gt_column_spanner">Treated</span>
      </th>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mean">mean</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="av. delta">av. delta</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="mean">mean</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="av.delta (t&amp;lt;t*)">av.delta (t&lt;t*)</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="av.delta (t&amp;gt;t*)">av.delta (t&gt;t*)</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">container</th>
<td headers="stub_1_1 mean.x" class="gt_row gt_right">115,335</td>
<td headers="stub_1_1 agrate" class="gt_row gt_right">845</td>
<td headers="stub_1_1 mean.y" class="gt_row gt_right">490,538</td>
<td headers="stub_1_1 agrate0" class="gt_row gt_right">5,030</td>
<td headers="stub_1_1 agrate1" class="gt_row gt_right">5,861</td></tr>
  </tbody>
  
  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="6"> </td>
    </tr>
  </tfoot>
</table>
</div>
```




## Data availability for treated ports

The DiD approach is sensible to missing data in the timeseries of treated units. In the best case, there are no missing values in each treated unit. There are two options to achieve this: First, trim the time horizon at the front an end to make sure all treated ports start and end at the same time. Second, missing values in the middle of the time series could be imputed. 

![](Descriptives_files/figure-html/unnamed-chunk-22-1.png)<!-- -->


