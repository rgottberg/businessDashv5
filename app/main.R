box::use(
    shiny[titlePanel,
          reactive,
          moduleServer, 
          NS, 
          renderUI, 
          tags, 
          uiOutput],
    bslib[bs_theme,
          page_fluid,
          navset_card_pill,
          sidebar,
          nav_panel,
          layout_column_wrap
          ],
    shinycssloaders[withSpinner],
    waiter[useWaiter,
           waiterPreloader]
)

box::use(app/view/sidebar)
box::use(app/view/plotly)


# Define UI --------------------Country# Define UI ---------------------------------------------------------------
#' @export
ui <- function(id) {
    ns <- NS(id)
    page_fluid(
        useWaiter(),
        waiterPreloader(),
        # app title ----
        titlePanel("Business-Oriented Dashboard"),
        # theme
        theme = bs_theme(
            bootswatch = "flatly",
            version = "5"),
        # sidebar layout with input and output definitions ----
        navset_card_pill(
            sidebar = sidebar(
                sidebar$ui(ns("sidebar1"))
            ),
            nav_panel(
                title = "Visualizations",
                layout_column_wrap(
                    # width = "400px",
                    plotly$ui(ns("chart1"))
                )
            )
        )
    )
}
# Define server logic -----------------------------------------------------

#' @export
server <- function(id){
    moduleServer(id, function(input,output,session){
        data <- rio::import("app/data/cleaned_data.csv")
        data2 <- sidebar$server("sidebar1",data) 
        plotly$server("chart1",data2)
        }
    )
}