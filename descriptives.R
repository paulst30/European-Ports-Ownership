library(dplyr)
library(patchwork)

##### descriptives #####

# statistical ports versus geographic areas
share_geo_area <- port_data %>% mutate(stat_port_thrput = case_when(stat_port==1 ~ throughput,
                                                  stat_port==0 ~ 0),
                     geo_area_thrput = case_when(stat_port==0 ~ throughput,
                                                 stat_port==1 ~ 0)) %>% 
                   summarise(share=round(sum(geo_area_thrput)/(sum(geo_area_thrput)+sum(stat_port_thrput))*100), digits=0) %>% pull(share)

# filter out geographical areas
port_data <- filter(port_data, stat_port==1)

# number of ports
n_ports <- as.numeric(length(unique(port_data$port)))

# number of sending countries
n_sender <- as.numeric(length(unique(port_data$sender)))

# number of periods
n_quarters <- as.numeric(length(unique(port_data$time)))

# number of non_missing observations
nm_obs <- as.numeric(sum(!is.na(port_data$throughput)))

# number of non-missing, non-zero observations

nm_nz_obs <- as.numeric(sum(!is.na(port_data$throughput) & port_data$throughput!=0))

# number of ports with zero throughput
n_ports_nz <- port_data %>% group_by(port) %>% 
              summarise(throughput = sum(throughput)) %>% 
              filter(throughput==0) %>% nrow() %>%
              as.numeric()



#### distribution of throughput by port ####
theme_set(theme_minimal() + theme(legend.position = 'none'))

port_data %>% filter(year>=2010) %>% mutate(china = ((sender == "Hong Kong" | sender == "China (except Hong Kong)") & throughput>0)) %>%
         group_by(port) %>% summarise(throughput=sum(throughput), china=max(china)) %>% ungroup() %>%
         mutate(throughput = throughput/sum(throughput)) %>% arrange(desc(throughput)) %>% mutate(n=row_number()) %>%
         ggplot( aes(x=n, y=cumsum(throughput))) + geom_point(aes(colour = china)) + 
         ylab("cummulative share of throughput") +
         xlab("number of ports") +
         labs(title = "Cumulative throughput by ports (2010-2023)", caption = "Blue dots are ports that process chinese goods.") 
# 223 ports make up for 95 percent of shipments

### top 50 port (measured by overall throughput) ####
top50 <- port_data %>% filter(year>2010) %>% group_by(port) %>% summarise(throughput=sum(throughput)) %>% ungroup() %>% 
         arrange(desc(throughput)) %>% head(n=50) %>% pull(port)

port_data %>% filter(year>=2010, port %in% top50) %>%  mutate(china = ((sender == "Hong Kong" | sender == "China (except Hong Kong)") & throughput>0)) %>%
              group_by(port, china) %>% summarise(throughput=sum(throughput)) %>% ungroup() %>%  
              ggplot(aes(x=reorder(port,desc(throughput)), y=throughput, fill=china)) + 
              geom_bar(stat="identity", position = "stack") +
              labs(title="Total throughput of the 50 largest ports (2010-2023)", caption = "Blue bars represent throughput of chinese goods.")+
              theme(axis.text.x = element_text(angle = 45, hjust = 1),
                    axis.title.x = element_blank())

### top 50 ports with highest share of chinese throughput ###
top50_china <- port_data %>% filter(year>2010) %>% mutate(china = ((sender == "Hong Kong" | sender == "China (except Hong Kong)") & throughput>0),
                                                    throughput_others = case_when(china==1 ~ 0,
                                                                                  china==0 ~ throughput),
                                                    throughput_china = case_when(china==1 ~ throughput,
                                                                                 china==0 ~ 0)) %>%
         group_by(port) %>% summarise(throughput_others=sum(throughput_others),
                                      throughput_china=sum(throughput_china),
                                      share = throughput_china/throughput_others) %>% arrange(desc(share)) %>% 
         head(n=50) %>% pull(port)

port_data %>% filter(year>=2010, port %in% top50_china) %>%  mutate(china = ((sender == "Hong Kong" | sender == "China (except Hong Kong)") & throughput>0)) %>%
              group_by(port, china) %>% summarise(throughput=sum(throughput)) %>% ungroup() %>%  
              ggplot(aes(x=reorder(port,desc(throughput)), y=throughput, fill=china)) + 
              geom_bar(stat="identity", position = "stack") +
              labs(title="Total throughput of the 50 ports with the highest share of chinese throughput (2010-2023)", caption = "Blue bars represent throughput of chinese goods.")+
              theme(axis.text.x = element_text(angle = 45, hjust = 1),
                    axis.title.x = element_blank())
              
### Evolution of throughput over the years ###
china_share <- port_data %>% mutate(china = ((sender == "Hong Kong" | sender == "China (except Hong Kong)") & throughput>0),
                                        throughput_others = case_when(china==1 ~ 0,
                                                                      china==0 ~ throughput),
                                        throughput_china = case_when(china==1 ~ throughput,
                                                                     china==0 ~ 0)) %>%
  group_by(year) %>% summarise(throughput_others=sum(throughput_others),
                               throughput_china=sum(throughput_china),
                               share = throughput_china/throughput_others*100*500000)

port_data   %>% mutate(china = ((sender == "Hong Kong" | sender == "China (except Hong Kong)") & throughput>0)) %>%
                group_by(year, china) %>% summarise(throughput=sum(throughput)) %>% ungroup() %>%
                ggplot(aes(x=year)) + 
                geom_line(aes(y=throughput, color = china)) +
                geom_line(data=china_share, aes(x=year,y=share)) + 
                scale_y_continuous(
                  name = "throughput",
                  sec.axis = sec_axis( trans=~./500000, name="share in percent")) + 
                labs(title = "Aggregate throughput over time", 
                caption = "Blue line represents throughput of chinese goods. 
                           Red line represents throughput from all other countries.
                           Black line represents share in percent.") +
                theme(axis.title.y.right = element_text(angle = 90))

### Major origins of cargo shipments ###

port_data %>% mutate(china = ((sender == "Hong Kong" | sender == "China (except Hong Kong)") & throughput>0),
                     sender = case_when(china==0 ~ sender,
                                        china==1 ~ "China")) %>%
              group_by(sender) %>% summarize(throughput=sum(throughput), china=max(china)) %>% ungroup() %>% 
              arrange(desc(throughput)) %>% head(n=50) %>%
              ggplot(aes(x=reorder(sender, desc(throughput)), y=throughput)) + 
              geom_bar(stat="identity", aes(fill=china)) +
              labs(title = "Top 50 origins of cargo shipments (2010-2023)") +
              theme(axis.text.x = element_text(angle = 45, hjust = 1),
                    axis.title.x = element_blank())
