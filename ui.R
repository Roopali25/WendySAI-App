ui <- page_navbar(
  # site title -----------------------------------------------------------------
  title = div(
    class = "branding",
    a(
      href = "https://wendy-project.eu/",
      target = "_blank",
      img(class = "logo", src = "img/wendy-logo-light.png")
    )
  ),

  window_title = "Wendy - Social Acceptance Interventions Tool",

  # add custom theme
  theme = custome_theme,

  tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "css/styles.css")),

  # main body ------------------------------------------------------------------
  nav_panel(
    title = "Home",
    value = "home",
    home_module_ui(id = "home_page")
  ),

  nav_panel(
    title = "Social Acceptance Interventions Tool",
    value = "tool",
    interventions_module_ui(id = "interventions_tool")
  ),

  nav_panel(
    title = "About",
    value = "about",
    about_module_ui(id = "about_page")
  ),

  nav_spacer(),

  # footer ---------------------------------------------------------------------
  footer = create_footer(),

  # other options --------------------------------------------------------------
  fillable = FALSE
)
