# module ui --------------------------------------------------------------------
home_module_ui <- function(id) {
  tagList(
    get_home_page_slider(),

    div(
      id = "home-block-1",
      class = "bg-primary text-white overflow-hidden",
      div(
        class = "container py-5",
        p(
          "There is currently a knowledge gap on how behavioural interventions
        could be used to reshape current perceptions and bring positive change
        on wind farms social acceptance. Under task 4.1 of the WENDY project, we have developed an evaluation
        methodology (",
        tags$a(
          "deliverable 4.1",
          href = "https://wendy-project.eu/documentation/#1677243653849-68fd5a43-9e0c",
          target = "_blank",
          class = "text-white"
        ),
        ") and this online tool to present behavioural
        interventions and other recommendations to enhance social acceptance of
        wind energy projects. Various studies have employed behavioural insights
        and interventions to increase social acceptance of renewable energy
        projects. We conducted a comprehensive review and selected the best
        practices that have been tested and implemented in wind farm projects
        and communities across the world."
        ),

        p(
          "Through this tool, we aim to present these best practices in the form
        of recommendations for improved community acceptance and energy citizenship,
        in response to specific user input criteria (category of impact, type of
        windfarm, other classification factors). For each recommendation, we also
        provide the academic reference that the user can read for detailed
        information. We expect that this tool will help wind farm actors, regional
        authorities and citizens to improve their understanding of social
        acceptance and ways to enhance it."
        )
      )
    ),

    div(
      id = "home-block-2",
      div(
        class = "container py-5",
        div(
          class = "row align-items-center",
          div(
            class = "col-md-4",
            get_info_graphic()
          ),
          div(
            class = "col-md-8",
            p(
              style = "font-size: 1.25rem;",
              "Social acceptance is a pre-requisite for successful implementation
              of novel technology, especially in the renewable energy sector. But
              social acceptance is not just the study of public opinion, but 'also
              a matter of public, political and regulatory acceptance'",
              tags$a(href = "#footnote-1", tags$sup("1")),
              ". Since this early definition, social acceptance, in the context
              of renewable energy (RE), has largely been understood as encompassing
              three interdependent dimensions: socio-political acceptance, community
              acceptance and market acceptance",
              tags$a(href = "#footnote-2", tags$sup("2")), "."
            ),

            p(
              style = "font-size: 1.25rem;",
              "While socio-political acceptance is the general support for RE
              technologies and policies by the public, key stakeholders, and the
              policy makers; market acceptance concerns the market adoption of an
              RE innovation by supply side actors and demand side users. Lastly,
              and more relevant to this report, community acceptance is seen as
              the acceptance of siting decisions and energy projects by local
              stakeholders, specifically citizens living in the vicinity of proposed
              or existing RE projects and local authorities. This categorization
              has been widely adopted by wind industry, practitioners and researchers."
            ),

            tags$ol(
              class = "footnotes",
              tags$li(
                id = "footnote-1",
                "Carlman, I. (1984). The views of politicians and decision-makers
                on planning for the use of wind power in Sweden. European Wind
                Energy Conference, 339–343."
              ),
              tags$li(
                id = "footnote-2",
                "Wüstenhagen, R., Wolsink, M., & Bürer, M. J. (2007). Social
                acceptance of renewable energy innovation: An introduction to
                the concept. Energy Policy, 35(5), 2683–2691. ",
                tags$a(
                  href = "https://doi.org/10.1016/j.enpol.2006.12.001",
                  target = "_blank",
                  "https://doi.org/10.1016/j.enpol.2006.12.001."
                )
              )
            )
          )
        )
      )
    ),

    image_copyright_notice()
  )
}

# # module server ----------------------------------------------------------------
# home_module_server <- function(id) {
#   id
# }
