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

## Which ports are relevant? 



Most of the throughput concentrates in a few hundred ports. Limiting the sample to 121 ports that are responsible for 99 percent of the container shipments might be a sensible option (61 of these are aggregates of ports). Additionally, not all ports process Chinese goods. While all major ports do, especially small ports usually do not. 

![](Descriptives_files/figure-html/unnamed-chunk-4-1.png)<!-- -->




An alternative to filtering by the aggregated throughput could be filtering by the average throughput. The two graphs below display the cumulative total throughput relative to the average yearly throughput. The second graph indicates that possible cut-off thresholds of 50, 75, and 100 thousand to tonnes of yearly average container throughput are associated with a loss of 0.9, 1.3, and 1.8 percent of the cumulative total container throughput. In the following, the sample is constructed by applying a threshold of 100 thousand tonnes of average yearly container throughput.  

![](Descriptives_files/figure-html/unnamed-chunk-6-1.png)<!-- -->




# Sample

## Descriptives




The statistical units in the Eurostat data are a mixed list of actual ports and grouped ports (statistical ports) and geographic areas, which represent aggregates of many ports. While the port groups "usually" have one port management, this cannot be assumed for everyone. In addition, statistical ports that represent a group of ports make up the majority of the container shipments (64.8 percent). The definition of the statistical units (statistical ports and geographic aggregates) can be found in the [metadata](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv:OJ.L_.2018.180.01.0029.01.ENG&toc=OJ:L:2018:180:FULL), and in the [annex](https://ec.europa.eu/eurostat/cache/metadata/Annexes/mar_esms_an_2.xlsx). As of now, the sample is restricted to statistical ports (no geographic aggregates). The remaining sample includes:

- 26 reporting countries
- 120 ports (only 0 with zero throughput)
- 190 origin countries
- 107 time periods (quarters)




Table: National Statistical Groups combining many Ports

|port                         |nat_stat_group | count| container_2019| share|
|:----------------------------|:--------------|-----:|--------------:|-----:|
|Izmit                        |TRIZT          |    14|           6569|   469|
|Marseille                    |FRMRS          |     8|           4514|   564|
|Cork                         |IEORK          |     6|            871|   145|
|Rotterdam                    |NLRTM          |     6|          65487| 10914|
|Santa Cruz de Tenerife       |ESSCT          |     5|           1684|   337|
|Tallinn                      |EETLL          |     5|            813|   163|
|Ambarli                      |TRAMB          |     4|          14968|  3742|
|Amsterdam                    |NLAMS          |     4|            110|    28|
|Las Palmas                   |ESLPA          |     4|           5033|  1258|
|Palma de Mallorca            |ESPMI          |     4|            170|    42|
|Iskenderun, Hatay            |TRISK          |     3|           3412|  1137|
|Constanta                    |ROCND          |     2|           2580|  1290|
|Gioia Tauro                  |ITGIT          |     2|           9256|  4628|
|Helsinki                     |FIHEL          |     2|           1518|   759|
|Le Havre                     |FRLEH          |     2|           9674|  4837|
|Valencia                     |ESVLC          |     2|          21599| 10800|
|Venezia                      |ITVCE          |     2|           2079|  1040|
|Aalborg                      |DKAAL          |     1|            226|   226|
|Algeciras                    |ESALG          |     1|          26295| 26295|
|Aliaga                       |TRALI          |     1|           1747|  1747|
|Bari                         |ITBRI          |     1|            354|   354|
|Fredericia (Og Shell-Havnen) |DKFRC          |     1|            418|   418|
|Gdansk                       |PLGDN          |     1|           7797|  7797|
|Hamburg                      |DEHAM          |     1|          36153| 36153|
|Helsingborg                  |SEHEL          |     1|           1185|  1185|
|Kristiansand                 |NOKRS          |     1|            189|   189|
|Livorno                      |ITLIV          |     1|           9505|  9505|
|Lubeck                       |DELBC          |     1|            887|   887|
|Malmo                        |SEMMA          |     1|            112|   112|
|Marsaxlokk                   |MTMAR          |     1|            816|   816|
|Mersin                       |TRMER          |     1|           8922|  8922|
|Moerdijk                     |NLMOE          |     1|            341|   341|
|Mosjoen                      |NOMJF          |     1|            117|   117|
|Moss                         |NOMSS          |     1|            202|   202|
|Napoli                       |ITNAP          |     1|           1690|  1690|
|Savona                       |ITSVN          |     1|            307|   307|
|Tekirdag                     |TRTEK          |     1|           7637|  7637|
|Varna                        |BGVAR          |     1|            755|   755|
|Volos                        |GRVOL          |     1|            153|   153|



## Distribution of throughput by ports and origin





Port that process a relatively high share of cargo from China are generally large ports. Below are displayed the top 50 largest ports, their aggregate throughput and their throughput of Chinese container shipments (Mainland China + Hong Kong). The other graph displays the top 50 ports with the highest share of Chinese container throughput. Both lists are quite similar with 16 large ports which are not among the top 50 ports with high Chinese container throughput. 

![](Descriptives_files/figure-html/unnamed-chunk-12-1.png)<!-- -->![](Descriptives_files/figure-html/unnamed-chunk-12-2.png)<!-- -->


Above graphs indicate that the share of Chinese cargo is (surprisingly) low. The graph below plots the total cargo from China, the total cargo from origins other than China and the share of Chinese cargo in percent. Recent global crises, like the financial crisis in 2007-2009, the corona-pandemic in 2020, and the Ukraine war in 2023 have led to drops in total cargo shipments. Interestingly, they have affected Chinese cargo more than cargo from other origins, as the relative share of Chinese cargo mimics the movement of the total cargo shipments.

![](Descriptives_files/figure-html/unnamed-chunk-14-1.png)<!-- -->



![](Descriptives_files/figure-html/unnamed-chunk-15-1.png)<!-- -->

