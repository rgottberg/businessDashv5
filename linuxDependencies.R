libraries <- c("dplyr","lubridate",
               "plotly","rhino","rio",
               "shinycssloaders","shinyWidgets",
               "treesitter","treesitter.r","waiter")

pak::pkg_sysreqs(libraries,sysreqs_platform = "ubuntu")
