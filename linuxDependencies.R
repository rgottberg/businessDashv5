libraries <- c("dplyr","DT","highcharter","leaflet","lubridate",
                        "plotly","reactable","rhino","rio","shinycssloaders","shinyWidgets",
                        "treesitter","treesitter.r","waiter")

pak::pkg_sysreqs(libraries,sysreqs_platform = "ubuntu")
