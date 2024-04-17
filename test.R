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


recommendation_data <- recommendations %>%
  filter(
    `Impact Category` == "Environmental" &
      WF_type == "Offshore" &
      Factor == "Seafloor integrity"
  )

datatable(
  data = recommendation_data %>% select(Recommendation),
  class = "hover row-border",
  selection = "none",
  colnames = "",
  options = list(
    dom = "rt",
    paging = FALSE,
    ordering = FALSE
  ),
  fillContainer = TRUE
)

datatable(
  data = recommendation_data %>% select(`Country/Region`),
  class = "hover row-border",
  selection = "none",
  colnames = "",
  options = list(
    dom = "rt",
    paging = FALSE,
    ordering = FALSE,
    columnDefs = list(
      list(className = 'dt-left', targets = 0, width = "15px"),
      list(className = 'dt-left', targets = 1)
    )
  ),
  fillContainer = TRUE
)

datatable(
  data = recommendation_data %>% select(Reference),
  class = "hover row-border",
  selection = "none",
  colnames = "",
  options = list(
    dom = "rt",
    paging = FALSE,
    ordering = FALSE
  ),
  fillContainer = TRUE,
  escape = FALSE
)



library(stringr)

# Example vector with URLs
text <- c("Visit our website at https://www.example.com/",
          "Check out this cool article: http://blog.example.com/post",
          "No links here.")

# Regular expression to match URLs
url_pattern <- "https?://\\S+"

# Function to replace URLs with a tags
replace_url <- function(text) {
  str_replace_all(text, url_pattern, "<a href=\"\\0\">\\0</a>")
}

# Apply the function to each element in the vector
text_with_links <- lapply(text, replace_url)

# Print the modified vector
print(text_with_links)

