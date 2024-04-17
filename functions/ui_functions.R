create_footer <- function() {
  div(
    class = "main-footer",
    div(
      class = "container",
      div(
        class = "d-flex flex-column flex-md-row justify-content-between",
        div(
          class = "footer-left",
          img(
            class = "mb-5",
            src = "img/wndy-logo-dark.png",
            alt = "logo of windy"
          ),
          p(
            "This project has received funding from the European Union’s Horizon
          Europe Research and Innovation Programme under the Grant Agreement
          No 101084137"
          )
        ),
        div(
          class = "footer-middle",
          div(
            class = "social-links",
            tags$ul(
              class = "d-flex justify-content-between",
              tags$li(a(
                href = "https://twitter.com/WENDYprojectEU",
                target = "_blank",
                HTML(
                  "
                <svg class = 'social-icon'>
                  <use xlink:href = 'img/social_icons.svg#twitter_icon'></use>
                </svg>
                "
                )
              )),
              tags$li(a(
                href = "https://www.linkedin.com/company/92935129/",
                target = "_blank",
                HTML(
                  "
                <svg class = 'social-icon'>
                  <use xlink:href = 'img/social_icons.svg#linkedin_icon'></use>
                </svg>
                "
                )
              )),
              tags$li(a(
                href = "https://www.youtube.com/channel/UC3Hx-uKQ_JHOU2qLBCfqW-g",
                target = "_blank",
                HTML(
                  "
                <svg class = 'social-icon'>
                  <use xlink:href = 'img/social_icons.svg#youtube_icon'></use>
                </svg>
                "
                )
              ))
            )
          )
        ),
        div(
          class = "footer-right",
          h2("EU Funded", class = "widget-title"),
          img(
            class = "alignnone mb-2",
            src = "img/flag_of_eu.png",
            alt = "flag of EU",
            width = 99, height = 66
          ),
          p("Funded by the European Union"),
          p(
            style = "font-size:67%",
            "Views and opinions expressed are however those of the author(s) only
          and do not necessarily reflect those of the European Union. Neither the
          European Union nor the granting authority can be held responsible for them."
          )
        )
      ),
      div(
        class = "text-center",
        "Copyright © 2024 · Copenhagen Business School"
      )
    )
  )
}

get_home_page_slider <- function() {
  div(
    id = "home_page_slider",
    class = "carousel slide",
    `data-bs-ride` = "carousel",

    div(
      class = "carousel-indicators",
      tags$button(
        type = "button", `data-bs-target` = "#home_page_slider",
        `data-bs-slide-to` = "0", class = "active", `aria-current` = "true",
        `aria-label` = "Slide 1"
      ),
      tags$button(
        type = "button", `data-bs-target` = "#home_page_slider",
        `data-bs-slide-to` = "1", `aria-label` = "Slide 2"
      ),
      tags$button(
        type = "button", `data-bs-target` = "#home_page_slider",
        `data-bs-slide-to` = "2", `aria-label` = "Slide 3"
      )
    ),

    div(
      class = "carousel-inner",
      div(
        class = "carousel-item active",
        tags$img(src = "img/windfarm-1.jpg", class = "d-block w-100", alt = "windfarm image"),
        div(
          class = "carousel-caption d-none d-md-block",
          h2("ACCEPTANCE")
        )
      ),

      div(
        class = "carousel-item",
        tags$img(src = "img/windfarm-4.jpg", class = "d-block w-100", alt = "windfarm image"),
        div(
          class = "carousel-caption d-none d-md-block",
          h2("SUPPORT")
        )
      ),

      div(
        class = "carousel-item",
        tags$img(src = "img/windfarm-7.jpg", class = "d-block w-100", alt = "windfarm image"),
        div(
          class = "carousel-caption d-none d-md-block",
          h2("COLLABORATION")
        )
      )
    ),

    tags$button(
      class = "carousel-control-prev", type = "button", `data-bs-target`="#home_page_slider", `data-bs-slide` = "prev",
      span(class = "carousel-control-prev-icon", `aria-hidden` = TRUE),
      span(class = "visually-hidden", "Previous")
    ),
    tags$button(
      class = "carousel-control-next", type = "button", `data-bs-target`="#home_page_slider", `data-bs-slide` = "next",
      span(class = "carousel-control-next-icon", `aria-hidden` = TRUE),
      span(class = "visually-hidden", "Next")
    )
  )
}

get_info_graphic <- function() {
  tags$figure(
    class = "info-graphic",

    div(
      class = "info-top",
      tags$label(class = "fw-bold", `for` = "ul1", "Socio-political:"),
      tags$ul(
        id = "ul1",
        tags$li("Of technologies & policies"),
        tags$li("By the public"),
        tags$li("By key stakeholders"),
        tags$li("By policy makers")
      )
    ),

    div(
      class = "triangle",
      p("Social Acceptance")
    ),

    div(
      class = "info-bottom",
      div(
        tags$label(class = "fw-bold", `for` = "ul2", "Community"),
        tags$ul(
          id = "ul2",
          tags$li("Procedural justice"),
          tags$li("Distributional justice"),
          tags$li("Trust")
        )
      ),
      div(
        tags$label(class = "fw-bold", `for` = "ul3", "Market"),
        tags$ul(
          id = "ul3",
          tags$li("Consumers"),
          tags$li("Investors"),
          tags$li("Intra-firm")
        )
      )
    ),

    tags$figcaption(
      class = "text-center",
      "Social acceptance of renewable energy innovation",
      br(),
      "Source: (",
      tags$a(
        href = "https://doi.org/10.1016/j.enpol.2006.12.001",
        target = "_blank",
        "Wüstenhagen et al., 2007"
      ),
      ")"
    )
  )
}

image_copyright_notice <- function() {
  div(
    class = "img-copyright-notice container py-1 text-center",
    "All images used on the website are free from copyright."
  )
}
