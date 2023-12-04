#install.packages("eurostat")
#install.packages("rmarkdown")
#install.packages("did")

library(tidyverse)
library(eurostat)
library(readxl)
library(rmarkdown)


##### download cargo data ######

# check available data
#toc <- get_eurostat_toc()
#tables <- toc %>% filter(str_detect(code,"mar_go_qm_")) %>% select(title, code)

reporter <- c("be", "bg", "dk", "de", "ee", "es", "ie", "el", "fr", "hr", "it",
              "cy", "lv", "lt", "mt", "nl", "pl", "pt", "ro", "si", "fi", "se", 
              "uk", "no", "me", "tr")

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

# list of geographical aggregates are taken from the official list of statistical units from 2018 (no updated version available). 
aggregates_list <- read_xlsx("country_codes.xlsx", sheet = "Tabelle3") %>% rename(port = `Port name`, stat_port = `Statistical port`, aggregate = `Special aggregate`) %>%
  filter(!is.na(aggregate)) %>% pull(port)

# list of ports are taken from an updated interim list (annex of metadata).
port_list <- read_xlsx("mar_esms_an_2.xlsx", sheet = "1.  2022 extended list of ports")  %>% 
             rename(port = `Country/Port Name`, stat_port = `Statistical Port`) %>%
             filter(!is.na(stat_port)) %>% pull(port)

#list of ports that are a statistical port but are an aggregate of many small ports
nat_stat_code <- read_xlsx("mar_esms_an_2.xlsx", sheet = "1.  2022 extended list of ports")  %>% 
                 rename(port = `Country/Port Name`, stat_port = `Statistical Port`, nat_stat_group = `Nat. Stat. Group`) %>%
                 filter(!is.na(nat_stat_group)) %>% pull(nat_stat_group) %>% unique()

nat_stat_group <- read_xlsx("mar_esms_an_2.xlsx", sheet = "1.  2022 extended list of ports")  %>% 
                  rename(port = `Country/Port Name`, stat_port = `Statistical Port`) %>% 
                  filter(UNLocode %in% nat_stat_code) %>% pull(port) %>% unique()


# list of ports is not exhaustive. Some are aggregated in geological areas. 
# See https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv:OJ.L_.2018.180.01.0029.01.ENG&toc=OJ:L:2018:180:FULL

cargo_list <- c("Dry bulk goods", "Dry bulk - coal", "Dry bulk - ores", "Dry bulk - other", "Dry bulk - agricultural products", 
                "Liquid bulk goods", "Liquid bulk - other", "Liquid bulk - refined oil products",
                "Large containers", "Large containers - 20-ft freight units", 
                "Large containers - freight units over 20-ft and less than 40-ft", 
                "Large containers - 40-ft freight units", "Large containers - freight units > 40-ft",                                                             
                "Other cargo not elsewhere specified", "Other cargo - other general cargo", "Other cargo - iron and steel products",
                "Ro-Ro - mobile non-self-propelled units", "Ro-Ro - mobile self-propelled units", "Ro-Ro - road goods vehicles and accompanying trailers",
                "Ro-Ro - unaccompanied road goods trailers and semi-trailers", "Ro-Ro - trade vehicles (incl. import/export motor vehicles)", "Total", 
                "Ro-Ro - rail wagons engaged in goods transport", "Ro-Ro - passenger cars, motorcycles and accompanying trailers/caravans", "Ro-Ro - passenger buses", 
                "Ro-Ro - unaccompanied caravans and other road agricultural and industrial vehicles", 
                "Ro-Ro - rail wagons, shipborne port-to-port trailers, and shipborne barges engaged in goods transport", "Liquid bulk - crude oil", 
                "Liquid bulk - liquified gas", "Other cargo - forestry products", "Large containers - unspecified size", 
                "Ro-Ro - unspecified mobile self-propelled units", "Ro-Ro - unspecified mobile non-self-propelled units")

container <- c("Large containers")
roro <- c("Ro-Ro - mobile self-propelled units",
          "Ro-Ro - mobile non-self-propelled units")
bulk <- c("Dry bulk goods", "Liquid bulk goods")
other <- c("Other cargo not elsewhere specified")
total <- c("Total")
list <- c(container, roro, bulk, other)


#selection and filter criteria

direction <- "Inwards"                                                            # select the direction: "Inward", "Outward", or "Total"
origins_filtered <- c(origins$country_label[str_length(origins$code) == 2], "China (except Hong Kong)")  # list containing only countries, no sub-regions
cargo_type <- c("Large containers", "Large containers - 20-ft freight units", 
                "Large containers - freight units over 20-ft and less than 40-ft", 
                "Large containers - 40-ft freight units", 
                "Large containers - freight units > 40-ft",
                "Large containers - unspecified size")                            # select cargo type: see cargo_list for all possible categories
#min_tonnes <-  c()


######################

for (i in 1:length(reporter)) {                                                   # loop over all reporter
  
x <- get_eurostat(paste0("mar_go_qm_", reporter[i]),                              # download table for the reporter
                  type = "label") %>%
        filter(direct == direction,                                               # apply filters
               cargo %in% list,
               par_mar %in% origins_filtered,                                            # keep only countries, no sub regions
               rep_mar != origins$country_label[origins$code==toupper(reporter[i])]) %>% # drop country aggregates and keep only ports
        mutate(type = case_match(cargo, 
                                container ~ "container",
                                roro ~ "roro",
                                bulk ~ "bulk",
                                total ~ "total",
                                other ~ "other"),
               reporter = origins$country_label[origins$code==toupper(reporter[i])]) %>%
        group_by(par_mar, rep_mar, type, time, reporter) %>%
        summarize(values=sum(values)) %>%
        ungroup() %>%
        #select(-cargo, -direct, -unit) %>%                                               # drop unnecessary variables
        rename(sender = par_mar,                                                        # rename variables
               port = rep_mar,
               throughput = values) %>% 
        mutate(time=as.Date(time),                                                # format time variables
               year = year(time), 
               quarter=quarter(time))

x$stat_port <- (x$port %in% port_list)
x$aggregate <- (x$port %in% aggregates_list)
x$nat_stat_group <- (x$port %in% nat_stat_group)

if (i==1){
  port_data <- x                                                                  # save and append to previous tables
} else {
  port_data <- rbind(port_data, x)
}
}

port_data <- pivot_wider(port_data, values_from = "throughput", names_from = "type") 

save(list = "port_data", file = "port_data.RData")                                # save in current directory
rm(list = setdiff(ls(), "port_data"))                                             #delete all helper objects
