server <- function(input, output, session) {
  interventions_module_server(
    id = "interventions_tool",
    recommendations = recommendations
  )
}
