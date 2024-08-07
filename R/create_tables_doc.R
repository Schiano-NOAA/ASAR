#' Create Quarto Document of Tables
#'
#' @param resdir directory where the results file is located
#' @param model_results name of the results file of assessment output
#' @param model stock assessment model
#' @param subdir subdirectory where the assessment report template is being stored
#' @param include_all include all default tables for a stock assessment report
#'
#' @return Create a quarto document as part of a stock assessment outline with
#' pre-loaded R chunk adding the stock assessment tables from the nmfs-ost/satf R package
#' @export
#'
create_tables_doc <- function(resdir = NULL,
                              model_results = NULL,
                              model = c("SS3", "BAM", "ASAP", "AMAK", "WHAM"),
                              subdir = NULL,
                              include_all = TRUE) {
  model <- match.arg(model, several.ok = FALSE)

  if (include_all) {
    # Create tables quarto doc - maybe should add this as separate fxn - same with figs
    tables_doc <- paste0(
      "## Tables \n \n",
      # Indices table
      add_chunk(
        paste0(
          "satf::table_indices(dat = '", resdir, "/", model_results, "', model = '", model, "')"
        ),
        label = "indices"
      )
    )

    # Add other tables follow the same above format
    # tables_doc <- paste0("/n",
    #                      tables_doc,
    #                      add_chunk(
    #                        paste0(
    #                          "satf::table_XX()"
    #                        )
    #                       )
    #                      )
  } else {
    # add option for only adding specified tables
  }

  # Save tables doc to template folder
  utils::capture.output(cat(tables_doc), file = paste0(subdir, "/", "tables.qmd"), append = FALSE)
}
