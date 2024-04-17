# module ui section ------------------------------------------------------------
interventions_module_ui <- function(id) {
  ns <- NS(id)
  uiOutput(ns("main_output"))
}

# module server section --------------------------------------------------------
interventions_module_server <- function(id, recommendations) {
  ns <- NS(id)
  moduleServer(id, function(input, output, session) {
    # about tool section -------------------------------------------------------
    output$about_tool <- renderUI({
      div(
        class = "container",
        h2("How to use the social acceptance interventions (SAI) tool"),
        p(
          "Based on an extensive review of the academic literature, the SAI
          tool provides recommendations, guidelines, and potential interventions
          for wind energy stakeholders on how to improve and enhance social
          acceptance of wind farms. These recommendations have been tested and
          implemented in different countries and can be modified to suit specific
          contexts."
        ),
        p(
          "The recommendations have been divided into overall impact categories
          (i.e., environmental, institutional, landscape, psychological,
          socio-economic, and technical) for different types of wind farms
          (onshore, offshore) and different factors. The user can first select the 'impact category',
          and then the 'windfarm type' and 'factor' on the left side, and corresponding recommendations,
          their country or region of implementation and the published academic
          reference will be displayed."
        ),
        p(
          "Please note that not all categories (or subcategories) may have
          existing recommendations or that some recommendations may apply to
          more than one category (or subcategories). More details about the
          recommendations can be found at the reference link provided."
        )
      )
    })

    # inputs section -----------------------------------------------------------
    output$user_inputs <- renderUI({
      tagList(
        selectizeInput(
          inputId = ns("impact_category"),
          label = "Select Impact Category:",
          choices = sort(unique(recommendations$`Impact Category`)),
          options = list(
            placeholder = '---',
            onInitialize = I('function() { this.setValue(""); }')
          ),
          width = "100%"
        ),
        selectizeInput(
          inputId = ns("windfarm_type"),
          label = "Select Windfarm Type:",
          choices = NULL,
          options = list(
            placeholder = '---',
            onInitialize = I('function() { this.setValue(""); }')
          ),
          width = "100%"
        ),
        selectizeInput(
          inputId = ns("factor"),
          label = "Select Factor:",
          choices = NULL,
          options = list(
            placeholder = '---',
            onInitialize = I('function() { this.setValue(""); }')
          ),
          width = "100%"
        )
      )
    })

    observeEvent(
      input$impact_category,
      {
        updateSelectizeInput(
          inputId = "windfarm_type",
          choices = sort(
            unique(
              recommendations$WF_type[recommendations$`Impact Category` == input$impact_category]
            )
          ),
          options = list(
            placeholder = '---',
            onInitialize = I('function() { this.setValue(""); }')
          )
        )
      }
    )

    observeEvent(
      input$windfarm_type,
      {
        updateSelectizeInput(
          inputId = "factor",
          choices = sort(
            unique(
              recommendations$Factor[recommendations$`Impact Category` == input$impact_category & recommendations$WF_type == input$windfarm_type]
            )
          ),
          options = list(
            placeholder = '---',
            onInitialize = I('function() { this.setValue(""); }')
          )
        )
      }
    )

    # recommendation data ------------------------------------------------------
    recommendation_data <- reactive({
      req(input$impact_category, input$windfarm_type, input$factor)

      recommendations %>%
        filter(
          `Impact Category` == input$impact_category &
            WF_type == input$windfarm_type &
            Factor == input$factor
        )
    })

    # tables section -----------------------------------------------------------
    output$recommendation_table <- renderDT({
      req(recommendation_data())

      datatable(
        data = recommendation_data() %>% select(Recommendation),
        class = "hover row-border",
        selection = "none",
        colnames = "",
        options = list(
          dom = "rt",
          paging = FALSE,
          ordering = FALSE,
          columnDefs = list(
            list(className = 'dt-left', targets = 0, width = "20px"),
            list(className = 'dt-left', targets = 1)
          )
        ),
        fillContainer = TRUE
      )
    })

    output$implementation_table <- renderDT({
      req(recommendation_data())

      datatable(
        data = recommendation_data() %>% select(`Country/Region`),
        class = "hover row-border",
        selection = "none",
        colnames = "",
        options = list(
          dom = "rt",
          paging = FALSE,
          ordering = FALSE,
          columnDefs = list(
            list(className = 'dt-left', targets = 0, width = "20px"),
            list(className = 'dt-left', targets = 1)
          )
        ),
        fillContainer = TRUE
      )
    })

    output$reference_table <- renderDT({
      req(recommendation_data())

      datatable(
        data = recommendation_data() %>% select(Reference),
        class = "hover row-border",
        selection = "none",
        colnames = "",
        options = list(
          dom = "rt",
          paging = FALSE,
          ordering = FALSE,
          columnDefs = list(
            list(className = 'dt-left', targets = 0, width = "20px"),
            list(className = 'dt-left', targets = 1)
          )
        ),
        fillContainer = TRUE,
        escape = FALSE
      )
    })

    # results section ----------------------------------------------------------
    output$results <- renderUI({
      req(recommendation_data())

      tagList(
        card(
          calss = "my-3",
          card_header(
            class = "bg-primary text-white",
            h2(class = "my-0", "Recommendations")
          ),
          card_body(
            DTOutput(ns("recommendation_table")),
            max_height = 600
          )
        ),
        card(
          calss = "my-3",
          card_header(
            class = "bg-primary text-white",
            h2(class = "my-0", "Implementation Country/Region")
          ),
          card_body(
            DTOutput(ns("implementation_table")),
            max_height = 200
          )
        ),
        card(
          calss = "my-3",
          card_header(
            class = "bg-primary text-white",
            h2(class = "my-0", "Reference")
          ),
          card_body(
            DTOutput(ns("reference_table")),
            max_height = 200
          )
        )
      )
    })

    # tool section -------------------------------------------------------------
    output$tool <- renderUI({
      div(
        class = "container",
        fluidRow(
          column(
            width = 4,
            uiOutput(ns("user_inputs"))
          ),
          column(
            width = 8,
            uiOutput(ns("results"))
          )
        )
      )
    })

    # main output section ------------------------------------------------------
    output$main_output <- renderUI({
      tagList(
        div(class = "spacer"),
        uiOutput(ns("about_tool")),
        div(class = "spacer"),
        uiOutput(ns("tool")),
        div(class = "spacer"),
        image_copyright_notice()
      )
    })
  })
}
