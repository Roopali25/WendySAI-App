# loading packages -------------------------------------------------------------
library(shiny)
library(bslib)
library(readxl)
library(dplyr)
library(tidyr)
library(stringr)
library(DT)

# loading functions ------------------------------------------------------------
source("functions/ui_functions.R")

# loading modules --------------------------------------------------------------
source("modules/interventaions_tool_module.R")
source("modules/home_page_module.R")
source("modules/about_page_module.R")

# loading data -----------------------------------------------------------------
sheets <- excel_sheets("data/Social_Acceptance_Interventions_Dashboard.xlsx")

recommendations <- lapply(sheets, function(sheet_name) {
  read_excel("data/Social_Acceptance_Interventions_Dashboard.xlsx", sheet = sheet_name)
}) %>%
  bind_rows() %>%
  select(`Impact Category`, WF_type, Factor, Recommendation, `Country/Region`, Reference) %>%
  mutate(
    `Impact Category` = ifelse(`Impact Category` == "Individual", "Psychological", `Impact Category`),
    Recommendation = str_replace(Recommendation, "^[[:digit:]]*[.] ", ""),
    Reference = str_replace_all(
      string = str_replace_all(Reference, "[;]", "</br>"),
      pattern = "(http|ftp|https):\\/\\/([\\w_-]+(?:(?:\\.[\\w_-]+)+))([\\w.,@?^=%&:\\/~+#-]*[\\w@?^=%&\\/~+#-])",
      replacement = "<a href=\"\\0\" target=\"_blank\">\\0</a>"
    )
  )

custome_theme <- bs_theme(
  version = 5,
  "primary" = "#9CBF43",
  bg = "#FFFFFF",
  fg = "#000000",
  base_font = font_google("Roboto", local = FALSE),
  heading_font = font_google("Asap", local = FALSE)
) %>%
  bs_add_variables(
    "navbar-branding-height" = "55px",
    "navbar-light-hover-color" = "$primary",
    "navbar-light-active-color" = "$primary",
    "navbar-light-brand-color" = "$black",
    "navbar-light-brand-hover-color" = "$black",
    "input-btn-padding-y" = "0.5rem",
    "input-btn-padding-x" = "1rem",
    "btn-padding-x" = "$input-btn-padding-x",
    "btn-padding-y" = "$input-btn-padding-y",
    .where = "declarations"
  ) %>%
  bs_add_rules(sass::sass_file("www/css/styles.scss"))
