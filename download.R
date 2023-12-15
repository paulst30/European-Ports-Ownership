#install.packages("eurostat")
#install.packages("rmarkdown")
#install.packages("did")

library(tidyverse)
library(eurostat)
library(readxl)
library(rmarkdown)


######## AVAILABLE DATA ###################################

# check available data
#toc <- get_eurostat_toc()
#tables <- toc %>% filter(str_detect(code,"mar_go_qm_")) %>% select(title, code)

######## SET UP #################

############ COUNTRY CODES / ORIGINS #######
# country codes of reporters to loop over
reporter <- c("be", "bg", "dk", "de", "ee", "es", "ie", "el", "fr", "hr", "it",      
              "cy", "lv", "lt", "mt", "nl", "pl", "pt", "ro", "si", "fi", "se", 
              "uk", "no", "me", "tr")

# country and subregion codes (origins) for filtering and reference
origins <- data.frame(code= c("AGG_NSP", "AL", "DZ", "US_ISL", "AS", "AO", "AI", "AQ", "AG", "AR", "AW", "AU", "AZ", "BS", 
                              "BH", "BD", "BB", "BY", "BE", "BZ", "BJ", "BM", "BQ", "BA", "BV", "BR", "IO", "VG", "BN", "BG", 
                              "KH", "CM", "CA_1", "CA_2", "CA_9", "CA_3", "CA", "CV", "KY", "CL", "CN_X_HK", "CX", "CC", "CO_1", 
                              "CO_9", "CO_2", "CO", "KM", "CG", "CR", "CI", "HR", "CU", "CW", "CY", "CD", "DK", "DJ", "DM", "DO", 
                              "EC", "EG_1", "EG_2", "EG_9", "EG", "SV", "GQ", "ER", "EE", "FO", "FK", "FM", "FJ", "FI", "AN", 
                              "EX_YU", "FR_1", "FR_4", "FR_3", "FR_6", "FR_2", "FR_5", "FR_9", "FR", "PF", "TF", "GA", "GM", "GE", 
                              "DE_2", "DE_1", "DE_3", "DE_9", "DE", "GH", "GI", "EL", "GL", "GD", "GU", "GT", "GN", "GW", "GY", "HT", 
                              "HN", "HK", "IS", "IN", "ID", "IR", "IQ", "IE", "IL_1", "IL_2", "IL_9", "IL", "IT", "JM", "JP", "JO", 
                              "KZ", "KE", "KI", "KW", "LV", "LB", "LR", "LY", "LT", "MO", "MG", "MY", "MV", "MT", "MH", "MR", "MU", 
                              "YT", "MX_1", "MX_2", "MX_9", "MX", "MD", "MC", "ME", "MS", "MA_1", "MA_9", "MA_2", "MA", "MZ", "MM", 
                              "NA", "NR", "NL", "NC", "NZ", "NI", "NG", "NF", "KP", "MP", "NO", "OFF_NSP", "OM", "PK", "PW", "PS", 
                              "PA", "PG", "PE", "PH", "PN", "PL", "PT", "QA", "RO", "RU_3", "RU_6", "RU_5", "RU_2", "RU_4", "RU_1", 
                              "RU_7", "RU_9", "RU", "SH", "KN", "LC", "MF", "PM", "VC", "BL", "WS", "ST", "SA_2", "SA_1", "SA_9", 
                              "SA", "SN", "SC", "SL", "SG", "SX", "SI", "SB", "SO", "ZA", "KR", "ES_5", "ES_3", "ES_2", "ES_4", 
                              "ES_1", "ES_9", "ES", "LK", "SD", "SR", "SE_1", "SE_2", "SE_9", "SE", "SY", "TW", "TZ", "TH", "TL", 
                              "TG", "TK", "TO", "UNK_NSP", "TOTAL", "TT", "TN", "TR_1", "TR_2", "TR_9", "TR", "TM", "TC", "TV", 
                              "UA", "AE", "UK_1", "UK_3", "UK_2", "UK_9", "UK", "UM", "US_6", "US_3", "US_1", "US_5", "US_7", 
                              "US_2", "US_4", "US_9", "US", "UNK", "UY", "VI", "VE", "VN", "EH", "YE"),
             country_label = c("Aggregates extraction areas not elsewhere specified and other activities not elsewhere specified", 
                               "Albania", "Algeria", "American Oceania (US)", "American Samoa (US)", "Angola", "Anguilla (UK)", 
                               "Antarctica", "Antigua and Barbuda", "Argentina", "Aruba (NL)", "Australia", "Azerbaijan", "Bahamas", "Bahrain", 
                               "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda (UK)", "Bonaire, Saint Eustatius and Saba", 
                               "Bosnia and Herzegovina", "Bouvet Island (NO)", "Brazil", "British Indian Ocean Territory (UK)", "British Virgin Islands (UK)", 
                               "Brunei Darussalam", "Bulgaria", "Cambodia", "Cameroon", "Canada: Atlantic", 
                               "Canada: Great Lakes, Upper St Lawrence", "Canada: unspecified maritime coastal area", 
                               "Canada: West Coast", "Canada", "Cape Verde", "Cayman Islands (UK)", "Chile", "China (except Hong Kong)", 
                               "Christmas Island (AU)", "Cocos (Keeling) Islands (AU)", "Colombia: North Coast", 
                               "Colombia: unspecified maritime coastal area", "Colombia: West Coast", "Colombia", "Comoros", "Congo", 
                               "Costa Rica", "Côte d'Ivoire", "Croatia", "Cuba", "Curaçao", "Cyprus", "Democratic Republic of the Congo", 
                               "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt: Mediterranean", "Egypt: Red Sea", 
                               "Egypt: unspecified maritime coastal area", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", 
                               "Faeroe Islands (DK)", "Falkland Islands (UK)", "Federated States of Micronesia", "Fiji", "Finland", 
                               "Former Netherlands Antilles", "Former Yugoslavia (before 1992) / Total components of the former republic of Yugoslavia", 
                               "France: Atlantic / North Sea", "France: Guadeloupe and Martinique", "France: Guyane", "France: Mayotte", 
                               "France: Mediterranean", "France: Réunion", "France: unspecified maritime coastal area", "France", "French Polynesia (FR)", 
                               "French Southern Territories (FR)", "Gabon", "Gambia, The", "Georgia", "Germany: Baltic Sea", 
                               "Germany: North Sea", "Germany: Rhine", "Germany: unspecified maritime coastal area", "Germany", "Ghana", 
                               "Gibraltar (UK)", "Greece", "Greenland (DK)", "Grenada", "Guam (US)", "Guatemala", "Guinea", "Guinea-Bissau", 
                               "Guyana", "Haiti", "Honduras", "Hong Kong", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", 
                               "Israel: Mediterranean", "Israel: Red Sea", "Israel: unspecified maritime coastal area", "Israel", "Italy", 
                               "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Kuwait", "Latvia", "Lebanon", "Liberia", 
                               "Libya", "Lithuania", "Macao", "Madagascar", "Malaysia", "Maldives", "Malta", "Marshall Islands", "Mauritania", 
                               "Mauritius", "Mayotte (FR - part of EU as of 01.01.2014)", "Mexico: Atlantic", "Mexico: Pacific", 
                               "Mexico: unspecified maritime coastal area", "Mexico", "Moldova", "Monaco", "Montenegro", "Montserrat (UK)", 
                               "Morocco: Mediterranean", "Morocco: unspecified maritime coastal area", "Morocco: West Africa", 
                               "Morocco", "Mozambique", "Myanmar/Burma", "Namibia", "Nauru", "Netherlands", "New Caledonia (FR)", 
                               "New Zealand", "Nicaragua", "Nigeria", "Norfolk Island (AU)", "North Korea", "Northern Mariana Islands (US)", 
                               "Norway", "Offshore installations not elsewhere specified", "Oman", "Pakistan", "Palau", "Palestine", 
                               "Panama", "Papua New Guinea", "Peru", "Philippines", "Pitcairn Islands (UK)", "Poland", "Portugal", "Qatar", 
                               "Romania", "Russia: Asia", "Russia: Baltic Sea (excluding Gulf of Finland)", "Russia: Baltic Sea (Gulf of Finland only)", 
                               "Russia: Baltic Sea (unspecified)", "Russia: Barents and White Sea", "Russia: Black Sea", 
                               "Russia: European inland waterways, including Caspian Sea", "Russia: unspecified maritime coastal area", 
                               "Russia", "Saint Helena, Ascension and Tristan da Cunha (UK)", "Saint Kitts and Nevis", "Saint Lucia", 
                               "Saint Martin (FR)", "Saint Pierre and Miquelon (FR)", "Saint Vincent and the Grenadines", 
                               "Saint-Barthélemy (FR)", "Samoa", "São Tomé and Príncipe", "Saudi Arabia: Gulf", "Saudi Arabia: Red Sea", 
                               "Saudi Arabia: unspecified maritime coastal area", "Saudi Arabia", "Senegal", "Seychelles", "Sierra Leone", 
                               "Singapore", "Sint Maarten", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Korea", 
                               "Spain: Ceuta and Melilla", "Spain: Ceuta", "Spain: Mediterranean and South Atlantic", "Spain: Melilla", 
                               "Spain: North Atlantic", "Spain: unspecified maritime coastal area", "Spain", "Sri Lanka", "Sudan", "Suriname", 
                               "Sweden: Baltic Sea", "Sweden: North Sea", "Sweden: unspecified maritime coastal area", "Sweden", "Syria", "Taiwan", 
                               "Tanzania", "Thailand", "Timor-Leste", "Togo", "Tokelau (NZ)", "Tonga", "Total unspecified and unknown locations", 
                               "Total", "Trinidad and Tobago", "Tunisia", "Turkey: Black Sea", "Turkey: Mediterranean", 
                               "Turkey: unspecified maritime coastal area", "Turkey", "Turkmenistan", "Turks and Caicos Islands (UK)", 
                               "Tuvalu", "Ukraine", "United Arab Emirates", "United Kingdom: Great Britain and Northern Ireland", 
                               "United Kingdom: Guernsey and Jersey (Channel Islands)", "United Kingdom: Isle of Man", 
                               "United Kingdom: unspecified maritime coastal area", "United Kingdom", "United States Minor Outlying Islands (US)", 
                               "United States: Great Lakes", "United States: Gulf", "United States: North Atlantic", 
                               "United States: North Pacific", "United States: Puerto Rico", "United States: South Atlantic", 
                               "United States: South Pacific", "United States: unspecified maritime coastal area", "United States", "Unknown", 
                               "Uruguay", "US Virgin Islands (US)", "Venezuela", "Vietnam", "Western Sahara", "Yemen"))


############ PORT CODES AND NAMES ###############

# port names and codes (taken from an updated interim list (annex of metadata) and combined with official statistical list from 2018)
port_codebook <- read_xlsx("country_codes.xlsx", sheet = "EU_Meta") %>% 
                 rename(port = `Port name`, stat_port = `Statistical port`, aggregate = `Special aggregate`, nat_stat_code = `Nat. stat. group`) %>%
                 select(Locode, port, stat_port,nat_stat_code, aggregate)

port_codebook2 <- read_xlsx("mar_esms_an_2.xlsx", sheet = "1.  2024 extended list of ports")  %>% 
                  rename(port = `Country/Port Name`, stat_port = `Statistical Port`, Locode = `UNLocode`, nat_stat_code = `Nat. Stat. Group`) %>%
                  mutate(aggregate = NA) %>%
                  select(Locode, port, stat_port,nat_stat_code, aggregate)

port_codebook <- rbind(port_codebook2, port_codebook[!(port_codebook$Locode %in% port_codebook2$Locode),])  #final codebook

# manually adding missing entries to the codebook
missing_entries <-data.frame(Locode = c("FR001","SE88D","SE88C","SENOE", "NOGVL","NOKAS", 
                                        "NORNA","NOBRG","NOEGD","NOBRE","NOBRO","DEMAG", 
                                        "DEREC","DEIBB","DEFRA", "DELUE", "DKTHR", "GRKLS", "GBSTR", "GBBLR", "EE88C"),
                             port = c(  "Haropa (Le Havre and Rouen)", "Sweden - other ports", "Sweden (confidential)","Norrtälje", "Porsgrunn, Rafnes, Herøya, Brevik, Skien, Langesund, Voldsfjorden", 
                                        "Karmsund", "Rana", "Borg", "Eigersund", "Bremanger", "Brønnøy", "Magdeburg", "Recklinghausen",
                                        "Ibbenbüren", "Frankfurt am Main", "Lünen","Tunnel Port Rødby", "Kaloi Limenes Rethymnou", "Stranraer", "Ballylumford",
                                        "Estonia (confidential data aggregated by Eurostat)")) %>%
                  mutate(stat_port=case_when(Locode %in% c("FR001","SE88D") ~ NA,
                                             .default="X"),
                         nat_stat_code= NA,
                         aggregate=case_when(Locode %in% c("FR001","SE88D") ~ "X",
                                             .default=NA))
port_codebook <- rbind(port_codebook, missing_entries)


# list of ports that are statistical ports
port_list <- port_codebook %>% filter(!is.na(stat_port)) %>% pull(Locode)

#list of ports that are a statistical port but are an aggregate of many small ports
nat_stat_code <- port_codebook %>% filter(!is.na(nat_stat_code)) %>% pull(nat_stat_code) %>% unique()

#list of geographic aggregates 
aggregates_list <- port_codebook %>% filter(!is.na(aggregate)) %>% pull(Locode)

# table of port groups and the number of included ports
port_groups <- port_codebook %>% group_by(nat_stat_code) %>% summarize(inc_ports_n=n()) %>% filter(!is.na(nat_stat_code))

# NOTE: list of ports is not exhaustive. Some are aggregated in geological areas. 
# See https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv:OJ.L_.2018.180.01.0029.01.ENG&toc=OJ:L:2018:180:FULL


############ CARGO CODES AND NAMES ###############

cargo_list <- data.frame( cargo_code = c("TOTAL", "LBK", "LBK_LGAS", "LBK_COIL", "LBK_ROIL", "LBK_OTH", "DBK", "DBK_ORES", "DBK_COAL", 
                                         "DBK_PAGR", "DBK_OTH", "LCNT", "LCNT_20", "LCNT_40", "LCNT_21-39", "LCNT_GT40", "LCNT_NSP", 
                                         "RO_MSP", "RO_RVEH", "RO_CM", "RO_PBUS", "RO_TVEH", "RO_MSP_NSP", "RO_MNSP", "RO_TRL_STRL", 
                                         "RO_CVAN_OTH", "RO_RWS", "RO_RW", "RO_MNSP_NSP", "OTH", "OTH_FOR", "OTH_IS", "OTH_GN"),
                          cargo_label = c("Total", "Liquid bulk goods", "Liquid bulk - liquified gas", "Liquid bulk - crude oil", 
                                          "Liquid bulk - refined oil products", "Liquid bulk - other", "Dry bulk goods", "Dry bulk - ores", 
                                          "Dry bulk - coal", "Dry bulk - agricultural products", "Dry bulk - other", "Large containers", 
                                          "Large containers - 20-ft freight units", "Large containers - 40-ft freight units", 
                                          "Large containers - freight units over 20-ft and less than 40-ft", "Large containers - freight units > 40-ft", 
                                          "Large containers - unspecified size", "Ro-Ro - mobile self-propelled units", "Ro-Ro - road goods vehicles and accompanying trailers", 
                                          "Ro-Ro - passenger cars, motorcycles and accompanying trailers/caravans", "Ro-Ro - passenger buses", 
                                          "Ro-Ro - trade vehicles (incl. import/export motor vehicles)", "Ro-Ro - unspecified mobile self-propelled units", 
                                          "Ro-Ro - mobile non-self-propelled units", "Ro-Ro - unaccompanied road goods trailers and semi-trailers", 
                                          "Ro-Ro - unaccompanied caravans and other road agricultural and industrial vehicles", 
                                          "Ro-Ro - rail wagons, shipborne port-to-port trailers, and shipborne barges engaged in goods transport", 
                                          "Ro-Ro - rail wagons engaged in goods transport", "Ro-Ro - unspecified mobile non-self-propelled units", 
                                          "Other cargo not elsewhere specified", "Other cargo - forestry products", "Other cargo - iron and steel products", 
                                          "Other cargo - other general cargo"))

#selection and filter criteria

container <- c("LCNT")
roro <- c("RO_MSP",
          "RO_MNSP")
bulk <- c("DBK", "LBK")
other <- c("OTH")
total <- c("TOTAL")
list <- c(container, roro, bulk, other)

direction <- "IN"                                                            # select the direction: "IN", "OUT", or "TOTAL"
origins_filtered <- c(origins$code[str_length(origins$code) == 2], "CN_X_HK")  # list containing only countries, no sub-regions



######## DOWNLOAD LOOP #####################

for (i in 1:length(reporter)) {                                                   # loop over all reporter
  
x <- get_eurostat(paste0("mar_go_qm_", reporter[i]),                              # download table for the reporter
                  type = "code") %>%
        filter(direct == direction,                                               # apply filters
               cargo %in% list,
               par_mar %in% origins_filtered,                                            # keep only countries, no sub regions
               rep_mar != origins$code[origins$code==toupper(reporter[i])]
               ) %>% # drop country aggregates and keep only ports
        mutate(type = case_match(cargo, 
                                container ~ "container",
                                roro ~ "roro",
                                bulk ~ "bulk",
                                total ~ "total",
                                other ~ "other"),
               reporter = origins$country_label[origins$code==toupper(reporter[i])],
               port_code = substr(rep_mar,5,nchar(rep_mar))) %>%
        group_by(par_mar, port_code, rep_mar, type, time, reporter) %>%
        summarize(values=sum(values)) %>%
        ungroup() %>%
        #select(-cargo, -direct, -unit) %>%                                               # drop unnecessary variables
        rename(sender_code = par_mar,                                                        # rename variables
               rep_mar = rep_mar,
               port_code = port_code,
               throughput = values) %>% 
        mutate(time=as.Date(time),                                                # format time variables
               year = year(time), 
               quarter=quarter(time))



x$stat_port <- (x$port_code %in% port_list)
x$aggregate <- (x$port_code %in% aggregates_list)
x$nat_stat_group <- (x$port_code %in% nat_stat_code)

if (i==1){
  port_data <- x                                                                  # save and append to previous tables
} else {
  port_data <- rbind(port_data, x)
}
}



port_data <- pivot_wider(port_data, values_from = "throughput", names_from = "type") %>%
             merge(port_codebook[,c("Locode", "port")], by.x="port_code", by.y="Locode", all.x =T) %>%
             merge(origins, by.x="sender_code", by.y="code", all.x=T) %>%
             rename(sender = country_label)

############ CLEANING ################

# Some geographic aggregates that went undetected
missing_entries2 <- data.frame(rep_mar = c("DE_1", "DE_2", "DE_3", "DE_9", "ES_1", "ES_2", 
                                           "ES_3", "ES_4", "FR_1", "FR_2", "FR_4", "FR_5", 
                                           "SE_1", "SE_2", "SE_9", "TR_1", "TR_2", "TR_9", "UK_1"),
                               port = c("Germany: North Sea", "Germany: Baltic Sea", "Germany: Inland", 
                                        "Germany: unspecified martime coastal area", "Spain: North Atlantic", 
                                        "Spain: Mediterranean and South Atlantic", "Spain: Ceuta", "Spain: Melilla", 
                                        "France: Atlantic/North Sea", "France: Mediterranean", "France: Guadeloupe and Martinique", 
                                        "France: Reunion", "Sweden: Baltic Sea", "Sweden: North Sea", "Sweden: unspecified maritime coastal area", 
                                        "Turkey: Back Sea", "Turkey: Mediterranean", "Turkey: unspecified maritime coastal area", "UK: GBR and North Ireland")) %>%
                     mutate(aggregate = case_when(rep_mar %in% c("ES_3", "ES_4", "FR_4", "FR_5") ~ FALSE,
                                                  .default = TRUE),
                            stat_port = case_when(rep_mar %in% c("ES_3", "ES_4", "FR_4", "FR_5") ~ TRUE,
                                                  .default = FALSE))
for (i in 1:nrow(missing_entries2)) {
  port_data$port[port_data$rep_mar==missing_entries2$rep_mar[i]] <- missing_entries2$port[i]
  port_data$aggregate[port_data$rep_mar==missing_entries2$rep_mar[i]] <- missing_entries2$aggregate[i]
  port_data$stat_port[port_data$rep_mar==missing_entries2$rep_mar[i]] <- missing_entries2$stat_port[i]
  port_data$port_code[port_data$rep_mar==missing_entries2$rep_mar[i]] <- missing_entries2$rep_mar[i]
}

# port_codes with figures as the third character are mostly aggregates. Some of them are incorrectly label as such:
incorrect_aggregates <- data.frame(port_code = c("NL888", "SE88D", "BE003", "FR001", "TR888", "NO888", 
                                                 "SE023", "IT88P", "SE88C", "FI002", "GB221", "FI001", 
                                                 "EE88C", "GB203", "DE017", "SE022", "DE888", "SE021", 
                                                 "SE020", "IT888", "DE88N", "DE8PN", "DE76Y", "DE116", 
                                                 "DE8PO", "GR909", "GR88R", "FI888", "IT004", "SE888"),
                                   aggregate = c(TRUE, TRUE, FALSE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 
                                                 TRUE, FALSE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, TRUE, 
                                                 TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, 
                                                 TRUE, FALSE, TRUE),
                                   stat_port = c(TRUE, TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, TRUE,
                                                 TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 
                                                 TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE, 
                                                 TRUE, TRUE, TRUE))

for (i in 1:nrow(incorrect_aggregates)) {
  port_data$aggregate[port_data$port_code==incorrect_aggregates$port_code[i]] <- incorrect_aggregates$aggregate[i]
  port_data$stat_port[port_data$port_code==incorrect_aggregates$port_code[i]] <- incorrect_aggregates$stat_port[i]
}

######## ADD INFOMATION ON PORT GROUPS ########
averages <- port_data %>% group_by(port_code, year) %>% summarize(container_yrly=sum(container, na.rm = T)) %>% ungroup() %>%
                      merge(port_groups, by.x = "port_code", by.y = "nat_stat_code", all.x = T) %>%
                      group_by(port_code, inc_ports_n) %>%
                      summarize(average_yrly = mean(container_yrly, na.rm=T)) %>% ungroup() %>%
                      mutate(average_yrly = case_when(!is.na(inc_ports_n) ~ average_yrly/inc_ports_n,
                                                 .default = average_yrly))

port_data <- merge(port_data, averages, by.x = "port_code", by.y = "port_code", all.x = T)

######## ADD INFORMATION ON TREATMENT ########



######## SAVE ############

save(list = "port_data", file = "port_data.RData")                                # save in current directory
rm(list = setdiff(ls(), "port_data"))                                             #delete all helper objects
