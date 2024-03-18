# testing functions

# Example script that allows the user to try out creating stock assessment report templates
# In development
# Last edited: 03/14/24

### PLEASE DO NOT PUSH ANY TEMPLATES THAT YOU MAKE TESTING OUT THIS FUNCTION###
# More guidance for saving scripts will be provided in the future

# Functions
source(here::here('R', 'create_template.R'))
source(here::here('R', 'write_title.R'))
source(here::here('R', 'paste_child.R'))
source(here::here('R', 'chunkr.R'))

# test generating new template
create_template(
    new_template = TRUE,
    format = "pdf",
    office = "NEFSC",
    region = "GB",
    species = "Bluefish",
    year = 2024,
    author = c("John Snow", "Danny Phantom", "Patrick Star"),
    include_affiliation = TRUE,
    parameters = TRUE,
    param_names = c("fleet1", "fleet2", "model"),
    param_values = c("Commercial", "Recreational", "Woods Hole Assessment Model"),
    type = "RT"
)


# new_template = TRUE
# format = "pdf"
# office = "NEFSC"
# region = "GB"
# species = "Bluefish"
# year = 2024
# author = c("John Snow", "Danny Phantom", "Patrick Star")
# parameters = TRUE
# param_names = c("office","region","species")
# param_values = c("NEFSC","Georges Bank", "Bluefish")
# add_section = FALSE
# type = "RT"

# Author affiliation reference
  # cat(paste("format: \n",
  #           "  " , "pdf", ": \n",
  #           "  ", "  ", "keep-tex: ", "true \n",
  #           "  " , "  ", "template-partials: \n",
  #           "  ", "  ", "  ", " - title.tex \n",
  #           "  ", "  ", "  ", " - sadraft.tex \n",
  #           "  ", "  ", "include-in-header: \n",
  #           "  ", "  ", "  ", "text: | \n",
  #           "  ", "  ", "  ", "  ", "\\usepackage[noblocks]{authblk} \n",
  #           "  ", "  ", "  ", "  ", "\\renewcommand*{\\Authsep}{, } \n",
  #           "  ", "  ", "  ", "  ", "\\renewcommand*{\\Authand}{, } \n",
  #           "  ", "  ", "  ", "  ", "\\renewcommand*{\\Authands}{, } \n",
  #           "  ", "  ", "  ", "  ", "\\renewcommand\\Affilfont{\\small} \n",
  #           sep = ""))

# Test template pull from previous assessment
# build "old template"
create_template(
  new_template = TRUE,
  format = "pdf",
  office = "SEFSC",
  region = "Gulf of Mexico",
  species = "Red Snapper",
  year = 2021,
  author = c("John Snow", "Danny Phantom", "Patrick Star"),
  include_affiliation = TRUE,
  parameters = FALSE,
  type = "RT"
)

# Pull new one
create_template(new_template = FALSE,
                prev_year = 2021,
                year = 2024,
                office = "SEFSC",
                region = "Gulf of Mexico",
                species = "Red Snapper",
                type = "RT"
                )

# new_template = FALSE
# prev_year = 2021
# year = 2024
# office = "SEFSC"
# region = "Gulf of Mexico"
# species = "Red Snapper"
# type = "RT"

title1 <- write_title(
  office = "NEFSC",
  species = "Red Snapper",
  spp_latin = "Lutjanus campechanus",
  region = "Gulf of Mexico",
  type = "RT")

cat(generate_citation(
  title = title1,
  author = c("John Snow", "Danny Phantom", "Patrick Star"),
  year = 2021,
  office = "NEFSC"
))