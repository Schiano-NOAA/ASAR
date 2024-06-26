#' Convert Output
#'
#' Format stock assessment output files. Function is unfinished
#'
#' @param output.file name of the file(s) containing assessment model output
#' @param outdir output directory folder
#' @param model assessment model used in evaluation;
#'              "ss", "bam", "asap", "fims", "amak", "ms-java", "wham", "mas", "aspm"
#'
#' @author Samantha Schiano
#'
#' @return A reformatted and standardized version of assessment model results
#'         for application in building a stock assessment reports and to easily
#'         adapt results among regional assessments.
#'
#'
#' @export
#'
convert_output <- function(
    output.file = NULL,
    outdir = NULL,
    model = NULL) {



  # Convert SS3 output Report.sso file
  if (model == "ss") {

  }

  if (model == "bam") {
    dat <- dget(output.file)
    # dat_list <- list()

    # Extract data from list to make useable
    # Loop over all items to output each object/transform
    for (p in 1:length(dat)) {
      out <- dat[p]
      # is the object class double or list?
      if (is.double(out)) {
        # is the object a vector or matrix?
        if (is.vector(out)) {
          df <- data.frame(t(sapply(out, c))) |>
            tidyr::pivot_longer(cols = everything(), names_to = paste(names(out)), values_to = "value")
        } else if (is.matrix(out)) {
          df <- as.matrix(out)
        } # close if statement for checking if double obj is vector or matrix
        print(assign(names(dat[p]), df)) # print df from double class obj

      } else if (is.list(out)) {
        for (i in 1:length(out)){
          # if the object is a vector treat as such
          if (is.vector(out[[i]])){
            df <- data.frame(matrix(unlist(out[[i]]), nrow=length(out[[i]]), byrow=TRUE),stringsAsFactors=FALSE) |>
              dplyr::mutate(parm.cons = names(out[[i]]))
            # must add more proper call names - value of x will vary based on df
            colnames(df) <- c(names(out[i]), "x")

            # if the object is a matrix treat as such
          } else if (is.matrix(out[[i]])){
            # Turn the object into a matrix  - will need to be handled later when transforming the data
            df <- as.matrix(out[[i]])
          }
          print(assign(names(dat[p][i]), df))
        } # close loop for list objects after pulled
      } # close if statement for checking if objects from dat is double or list



    } # close loop over objects listed in dat file

    #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    # Specify what to do with the pulled data
    # Might need to rename some values
    #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

  } # close if output is from BAM

  if (model == "asap") {
    # This is how Bai read the ASAP output
    # asap_output conversion written by Bai Li
    # asap_output <- dget(file.path(casedir, "output", subdir, paste("s", keep_sim_id[om_sim], sep = ""), "asap3.rdat"))
    # setwd(file.path(casedir, "output", subdir, paste("s", keep_sim_id[om_sim], sep = "")))
    # asap_std <- readRep("asap3", suffix = ".std")
  }
}
