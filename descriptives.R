library(dplyr)

##### descriptives #####

# number of ports
n_ports <- as.numeric(length(unique(port_data$port)))

# number of sending countries
n_sender <- as.numeric(length(unique(port_data$s_iso2c)))

# number of periods
n_quarters <- as.numeric(length(unique(port_data$time)))

# number of non_missing observations
nm_obs <- as.numeric(sum(!is.na(port_data$throughput)))

# number of non-missing, non-zero observations

nm_nz_obs <- as.numeric(sum(!is.na(port_data$throughput) & port_data$throughput!=0))

# number of ports with zero throughput
n_ports_nz <- port_data %>% group_by(port) %>% 
              summarise(throughput = sum(throughput)) %>% 
              filter(throughput>0) %>% nrow() %>%
              as.numeric()


##### distribution of throughput by port #####

port_data %>% group_by(port) %>% summarise(throughput=sum(throughput)) %>% ungroup() %>%
         mutate(throughput = throughput/sum(throughput)) %>% arrange(desc(throughput)) %>% mutate(n=row_number()) %>%
         ggplot( aes(x=n, y=cumsum(throughput))) + geom_point() + 
         ylab("cummulative share of throughput") +
         xlab("number of ports") +
         theme_minimal()
# 223 ports make up for 95 percent of shipments

top50 <- 
