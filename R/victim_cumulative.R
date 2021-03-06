#' Victimisation distribution cumulative percentages
#'
#' A function to generate cumulative percentages from the
#' distribution provided by \code{\link{victim_table}}.
#' @param x a data frame generated by \code{\link{victim_table}}
#' @export
#' @examples
#' vt <- victim_table("extortions_nas", data = testdata)
#' victim_cumulative(vt)
#'
#' # Batch mode
#' vl <- lapply(c("extortions", "bribes"), victim_table, data = testdata)
#' lapply(vl, victim_cumulative)

victim_cumulative <- function(data)
{
    inds <- 5:8
    intfun <- function(x) rev(cumsum(rev(x)))

    columns <- sapply(data[,inds], intfun)
    columns <- as.data.frame(columns)
    names(columns) <- c("All targets", "Victims", "Incidents", "Repeats")
    columns <- cbind(Events = data[,1], columns)
    columns <- rbind(columns, rep(0, ncol(columns)))

    return(columns)
}
