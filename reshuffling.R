##########################################
### Reshuffling of shipping activities ###
##########################################



library(dplyr)
library(writexl)
library(readxl)
library(ggplot2)
library(echoice2)
library(doBy)
library(zoo)
library(fixest)



##### datawork #####

load("port_data_TEU.RData")

port_data_TEU <- filter(port_data_TEU, aggregate==0,
                        stat_port==1,              #filter out non-stat ports (and geographic aggregates)
                        TEU_yrly >=20000,          #filter out small ports
                        port_code!="DEHAM") %>%    #exclude Hamburg due to very recent treatment
  mutate(s_china = ifelse(sender_code=="CN_X_HK" | sender_code=="HK", 1, 0)) %>%
  group_by(port_code, sender_code) %>%
  mutate(pair_id=cur_group_id()) %>% ungroup() %>%
  rename(container=total_TEU)


sum(port_data_TEU$container, na.rm=TRUE)
mean(port_data_TEU$container, na.rm=TRUE)

# get list of sender_codes and reporter_codes

listsender <- port_data_TEU %>%
  group_by(sender_code) %>%
  slice(1) %>%
  ungroup() %>%
  select(sender_code, sender)


listreporter <- port_data_TEU %>%
  group_by(reporter_code) %>%
  slice(1) %>%
  ungroup() %>%
  select(reporter_code, reporter)

write_xlsx(listsender, "listsender.xlsx")

# merge codes to add region information of sender and reporter 
sender_region <- read_xlsx("sender_region.xlsx", sheet = "Sheet1")

reporter_region <- merge(listreporter, sender_region, by.x = "reporter_code", by.y = "sender_code", all.x = T) %>% 
  select(reporter_code, sender_region) %>% 
  rename("reporter_region" = "sender_region")

port_data_TEU <- merge(port_data_TEU,sender_region, by = "sender_code") %>%
  relocate(sender_region, .after = sender_code)


port_data_TEU <- merge(port_data_TEU,reporter_region, by = "reporter_code") %>%
  relocate(reporter_region, .after = reporter_code) 

# generate the region pair variables
port_data_TEU$NENE_region <- ifelse(port_data_TEU$reporter_region == 'NE' & port_data_TEU$sender_region == 'NE', 1, 0)
sum(port_data_TEU$NENE_region)

port_data_TEU$SESE_region <- ifelse(port_data_TEU$reporter_region == 'SE' & port_data_TEU$sender_region == 'SE', 1, 0)
sum(port_data_TEU$SESE_region)

port_data_TEU$NESE_region <- ifelse(port_data_TEU$reporter_region == 'NE' & port_data_TEU$sender_region == 'SE', 1, 0)
sum(port_data_TEU$NESE_region)

port_data_TEU$SENE_region <- ifelse(port_data_TEU$reporter_region == 'SE' & port_data_TEU$sender_region == 'NE', 1, 0)
sum(port_data_TEU$SENE_region)

port_data_TEU$NEEX_region <- ifelse(port_data_TEU$reporter_region == 'NE' & port_data_TEU$sender_region == 'EX', 1, 0)
sum(port_data_TEU$NEEX_region)

port_data_TEU$SEEX_region <- ifelse(port_data_TEU$reporter_region == 'SE' & port_data_TEU$sender_region == 'EX', 1, 0)
sum(port_data_TEU$SEEX_region)

region_pair <- ec_undummy(port_data_TEU, c('NENE_region', 'SESE_region', 'NESE_region', 'SENE_region','NEEX_region','SEEX_region'), "region_pair", ref_level = "What") %>%
  select(port_code, sender_code, region_pair, year, quarter) 

port_data_TEU <- merge(port_data_TEU,region_pair, by.x=c("port_code", "sender_code", "year", "quarter"), by.y=c("port_code", "sender_code", "year", "quarter"))

rm(listreporter, region_pair, sender_region)


##### descriptives #####


# plots for development of container throughput 
#1) fraction of total throughputs over region pairs
throughput_development_regionpair_total <- port_data_TEU %>% group_by(region_pair) %>% summarise(throughput=sum(container, na.rm=TRUE)) %>% 
  arrange(desc(throughput)) %>% mutate(fraction = round(throughput/sum(throughput)*100))

ggplot(throughput_development_regionpair_total, aes(x="", y=fraction, fill=region_pair))+
  geom_bar(stat="identity", color="black")+
  coord_polar("y")+
  theme_void()+
  scale_fill_manual(values = c("darkblue", "blue", "green", "orange", "yellow", "red"))+
  geom_label(aes(label=fraction),
             position = position_stack(vjust = 0.5),
             color="black",
             label.size = 0,
             size=6,
             show.legend = FALSE)
# 51% of total throughput takes place in north ports, 8% between North and South in equal shares with respect to direction, 40% takes place in South ports.

summaryBy(container ~ region_pair, data=port_data_TEU, na.rm=TRUE)
# mean container throughput is suggeested to be highest for South European ports transfers. Can this be true?????


#2) development of total throughputs per region pair over years
throughput_development_regionpair_year <- port_data_TEU %>% 
  group_by(region_pair, year) %>% 
  summarise(throughput=sum(container, na.rm=TRUE)) %>% 
  ungroup() %>%
  group_by(year) %>%
  mutate(fraction = (throughput/sum(throughput)*100))


#2.1) line chart
ggplot(data=throughput_development_regionpair_year, aes(x=year, y=throughput, group=region_pair))+
  geom_line(aes(color=region_pair))+
  scale_color_manual(values = c("darkblue", "blue", "green", "orange", "yellow", "red"))

#2.2) area chart

throughput_development_regionpair_year$group <- factor(throughput_development_regionpair_year$region_pair, levels=c("NEEX_region", "NENE_region", "SEEX_region", "SESE_region", "SENE_region", "NESE_region"))


ggplot(throughput_development_regionpair_year, aes(x=year, y=fraction, fill=group)) + 
  geom_area( size=0.5, colour="black")+
  scale_fill_manual(values = c("darkblue", "blue", "orange", "red", "yellow", "green"))


#3) development of total throughputs per region pair over years and quaters
throughput_development_regionpair_yearquater <- port_data_TEU %>% group_by(region_pair, year, quarter, period) %>% summarise(throughput=sum(container, na.rm=TRUE))  %>% 
  arrange(desc(throughput))

throughput_development_regionpair_yearquater$yq <- as.yearqtr(paste0(throughput_development_regionpair_yearquater$year, "-", throughput_development_regionpair_yearquater$quarter))

# entire period
ggplot(data=throughput_development_regionpair_yearquater, aes(x= yq, y=throughput, group=region_pair))+
  geom_line(aes(color=region_pair))+
  scale_color_manual(values = c("darkblue", "blue", "green", "orange", "yellow", "red"))

#period 2007-1 to 2013-1
throughput_development_regionpair_yearquater %>% 
  filter(period >= 41 & period <= 65) %>%
  ggplot(aes(x= yq, y=throughput, group=region_pair))+
  geom_line(aes(color=region_pair))+
  scale_color_manual(values = c("darkblue", "blue", "green", "orange", "yellow", "red"))

#period 2013-1 to 2018-1
throughput_development_regionpair_yearquater %>% 
  filter(period >= 65 & period <= 85) %>%
  ggplot(aes(x= yq, y=throughput, group=region_pair))+
  geom_line(aes(color=region_pair))+
  scale_color_manual(values = c("darkblue", "blue", "green", "orange", "yellow", "red"))

#period 2018-1 to 2023-1
throughput_development_regionpair_yearquater %>% 
  filter(period >= 85 & period <= 107) %>%
  ggplot(aes(x= yq, y=throughput, group=region_pair))+
  geom_line(aes(color=region_pair))+
  scale_color_manual(values = c("darkblue", "blue", "green", "orange", "yellow", "red"))


rm(throughput_development_regionpair_yearquater, throughput_development_regionpair_year, throughput_development_regionpair_total)


##### estimation #####


# Baseline FE regression with region_pair interaction

spec1 <- feols(container ~ ownership_china + ownership_china*s_china | port^sender + sender^period,
               data = port_data_TEU)

spec2 <- feols(container ~ ownership_china + ownership_china*SEEX_region + ownership_china*SESE_region + ownership_china*NENE_region + ownership_china*NESE_region + ownership_china*NEEX_region | port^sender + sender^period,
               data = port_data_TEU)

spec3 <- feols(container ~ ownership_china + ownership_china*SESE_region | port^sender + sender^period,
               data = port_data_TEU)

spec4 <- feols(container ~ ownership_china + ownership_china*SENE_region | port^sender + sender^period,
               data = port_data_TEU)

spec5 <- feols(container ~ ownership_china + ownership_china*NESE_region | port^sender + sender^period,
               data = port_data_TEU)

spec6 <- feols(container ~ ownership_china + ownership_china*NEEX_region | port^sender + sender^period,
               data = port_data_TEU)

spec7 <- feols(container ~ ownership_china + ownership_china*SEEX_region | port^sender + sender^period,
               data = port_data_TEU)

spec8 <- feols(container ~ ownership_china + ownership_china*NENE_region | port^sender + sender^period,
               data = port_data_TEU)


fe1_results<- etable(spec1, spec2, spec3, spec4, spec5, spec7, spec8,
                    headers = c( "Eq. 2", "Eq. 3", "Eq.4", "Eq.5", "Eq.6", "Eq.7", "Eq.8"),
                    style.df = style.df(fixef.title = "Fixed Effects",
                                        fixef.suffix = "", yesNo = "yes"),
                    vcov = "twoway")

View(fe1_results)

# Interpretation of results of Eq.4: Chinese investments fostered intra-regional trade in both Northern and Southern Europe.



# Daten aggregieren auf Portebene (throughput all;  throughput_South sender; ownership_china)
port_data_agg <- port_data_TEU %>% mutate(origin_china = ifelse(!is.na(container) & (sender_code=="CN_X_HK" | sender_code=="HK"),container,0)) %>%
  group_by(port, port_code, period, reporter_code) %>% 
  summarize(container = sum(container, na.rm=T),
            real_gdp_reporter = mean(real_gdp_reporter),
            origin_china = sum(origin_china),
            group = max(group),
            group_operation = max(group_operation),
            ownership_china = max(ownership_china),
            operation = max(operation)) %>% ungroup() %>%
  group_by(port_code) %>% 
  mutate(port_id = cur_group_id(),
         mean_container = mean(container, na.rm=T)) %>% ungroup()


# declare Bulgaria(BG) and Rumania (RO) as EX
#port_data_TEU <- port_data_TEU %>% 
#mutate(sender_region = replace(sender_region, sender_code == "BG", "EX")) %>% 
#mutate(sender_region = replace(sender_region, sender_code == "RO", "EX")) %>% 
#mutate(reporter_region = replace(reporter_region, reporter_code == "BG", "EX")) %>% 
#mutate(reporter_region = replace(reporter_region, reporter_code == "RO", "EX"))
                                                                

subsample <- subset(port_data_TEU, sender_region == "SE") %>%
  group_by(port_code, period) %>% 
  summarize(container = sum(container, na.rm=T)) %>% 
  rename("container_south" = "container")

port_data_agg_final <- merge(port_data_agg,subsample, by = c("port_code", "period"), all.x=T) %>%
  mutate(container_south = ifelse(is.na(container_south), 0, container_south)) %>%
  mutate(fraction_south_container = container_south/container)

mean(port_data_agg_final$fraction_south_container, na.rm=T)
max(port_data_agg_final$fraction_south_container, na.rm=T)
min(port_data_agg_final$fraction_south_container, na.rm=T)

# TEST if fraction is rightly constructed
subsample2 <- subset(port_data_TEU, sender_region == "EX" | sender_region == "NE") %>%
  group_by(port_code, period) %>% 
  summarize(container = sum(container, na.rm=T)) %>% 
  rename("container_other" = "container") 

port_data_agg_final <- merge(port_data_agg_final,reporter_region, by = "reporter_code") %>%
  relocate(reporter_region, .after = reporter_code) 

port_data_agg_final <- merge(port_data_agg_final,subsample2, by = c("port_code", "period"), all.x=T) %>%
  mutate(container_other = ifelse(is.na(container_other), 0, container_other)) %>%
  mutate(container_total = container_other + container_south)

port_data_agg_final$SE <- ifelse(port_data_agg_final$reporter_region == 'SE', 1, 0)
mean(port_data_agg_final$SE)


# FE regression for China effect on container throughput fraction of containers from Southern European countries

spec11 <- feols(container ~ ownership_china  | port_code + period + reporter_code^period,
               data = port_data_agg_final)

spec12 <- feols(fraction_south_container ~ ownership_china  | port_code + period + reporter_code^period,
                data = port_data_agg_final)

spec13 <- feols(fraction_south_container ~  ownership_china*SE | port_code + period + reporter_code^period,
                data = port_data_agg_final)



fe2_results<- etable(spec11, spec12, spec13,
                     headers = c( "Eq. 1", "Eq. 2", "Eq. 3"),
                     style.df = style.df(fixef.title = "Fixed Effects",
                                         fixef.suffix = "", yesNo = "yes"),
                     vcov = "twoway")

View(fe2_results)

# Im ersten Wurf finde ich keinen "Reshuffling Effekt" gefundne --- geprüft an höheren Containeranteil aus südeuropäischen Häfen nach China Investition. 
# Das bleibt auch so wenn ich Häfen in Rumänien und Bulgarien nicht als südeuropäische Häfen deklariere.

# Ich hake da nächste Woche nochmal rein.


# 2 Ansätze:
# - Überlegen ob ich die abhängige Variable richtig spezifiziert habe und was es für Alternativen gibt.
# - Anderes Sample der SE und RE Gruppen versuchen und/oder eine andere regionale Gruppierungen überlegen.