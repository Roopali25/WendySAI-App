# module ui --------------------------------------------------------------------
about_module_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      id = "about-page-banner"
    ),

    div(
      id = "about-block-1",
      div(
        class = "container py-5",
        p(
          "This tool was developed under ",
          tags$a(
            "WP4 (Task 4.1)",
            href = "https://wendy-project.eu/documentation/#1677243653849-68fd5a43-9e0c",
            target = "_blank"
          ),
          "of the WENDY project and builds on the",
          tags$a(
            "outcomes of WP2",
            href = "https://wendy-project.eu/documentation/#1677243558064-be1a3d59-8436",
            target = "_blank"
          ),
          ". The underlying methodology of this tool can be found in deliverable
          4.1. The tool is a result of a collaboration between the task partners (",
          tags$a(
            "Copenhagen Business School",
            href = "https://www.cbs.dk/en",
            target = "_blank"
          ),
          ", ",
          tags$a(
            "White Research",
            href = "https://white-research.eu/",
            target = "_blank"
          ),
          " and ",
          tags$a(
            "Q-Plan",
            href = "https://qplan-intl.gr/",
            target = "_blank"
          ),
          ")."
        ),
        p(
          "WENDY is a Horizon Europe project aiming to unravel the factors
          triggering social acceptance of wind farms. Further, this project hopes
          to guide local communities to move from a NIMBY (‘not-in-my-backyard’)
          to (‘please-in-my-backyard’) approach. This will be done by proving that
          social opposition and rejection depends on multiple, possibly interlinked
          factors at social, environmental and technical level, which can be
          addressed by case-specific interventions."
        ),
        p(
          "For further details, please visit our project website - ",
          tags$a(
            "https://wendy-project.eu/",
            href = "https://wendy-project.eu/",
            target = "_blank"
          ),
          ". ",
          "You can also participate by joining our WENDY Network of Interest - ",
          tags$a(
            "https://wendy-kep.eu/",
            href = "https://wendy-kep.eu/",
            target = "_blank"
          ),
          "."
        )
      )
    ),

    div(
      id = "about-block-2",
      div(
        class = "bg-primary text-white",
        div(
          class = "container py-5",
          div(
            class = "d-flex flex-column flex-lg-row justify-content-lg-between align-items-center align-items-lg-start gap-3",
            div(
              class = "text-center text-lg-start",
              span(
                class = "display-6",
                "Have something to say? Send us a message!"
              )
            ),
            div(
              tags$a(
                class = "btn btn-dark",
                "Send a message",
                href = "https://wendy-project.eu/contact-us/",
                target = "_blank"
              )
            )
          )
        )
      )
    ),

    image_copyright_notice()
  )
}
