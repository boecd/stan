#' detail
#'
#' Add detailed shares
#'
#' Add industry detail to time series using shares from secondary sources
#'
#' @param data a dataframe object.
#' @param namesou a character vector specifying the main source and secondary source(s).
#'
#' @author OECD STAN
#' @keywords estimate
#' @seealso \code{\link{extend}}
#' @export
#' @examples
#' data table: cou, var, ind, year, value
#' detail(data=data.det.start, namesou=namesou.det, ind.parent=ind.parent[1], ind.peers=ind.peers)

detail <- function(data, namesou, ind.parent, ind.peers)
{
    data.main <- data[data$sou==namesou[1], colnames(data)%in%c("year", "ind", "value")]
    data.main.parent <- data.main[data.main$ind==ind.parent, ]
    ## data.main.noparent <- data.main[data.main$ind!=ind.parent, ]
    ## data.main.merge <- dimMerge(data = data.main, dim = "ind", dim.A = ind.peers, dim.B = ind.parent)
    ## data.main.ratio <- mergeCalc(data = data.main.merge, diff = FALSE)
    ## data.main.ratio
    for (sou in 2:length(namesou))
    {
        data.det <- data[data$sou==namesou[sou], colnames(data)%in%c("year", "ind", "value")]
        data.det.merge <- dimMerge(data = data.det, dim = "ind", dim1 = ind.peers, dim2 = ind.parent)
        data.det.ratio <- mergeCalc(data = data.det.merge, diff = FALSE)
        data.det.ratio <- data.det.ratio[,colnames(data.det.ratio)%in%c("year", "dim.x", "value")]
        data.det.merge <- merge(data.main.parent, data.det.ratio, by = "year")
        data.det.merge$value <- data.det.merge$value.x * data.det.merge$value.y
        data.det.merge <- data.det.merge[,colnames(data.det.merge)%in%c("year", "dim.x", "value")]
        names(data.det.merge) <- sub("dim.x", "ind", names(data.det.merge))
        ## ".noparent" -> ""
        data.combine <- rbind(data.main, data.det.merge) # take values from main source first - change with "preserve" type switch
        data.combine <- data.combine[!duplicated(data.combine[,colnames(data.combine)%in%c("year","ind")]),] # remove duplicates
        data.main <- data.combine[!is.nan(data.combine$value) & !is.na(data.combine$value),] #  & !is.inf(data.combine$value)
    }
    return(data.main)
}

## by industry and variable: take data from main source and secondary source
##   - for selected industry
##   - for parent industry
##   - for peer industries
##   if parent industry is present in main source and
##   if all peer industries are present in secondary source
##   - calculate share of selected industry and peer industries in parent industry of secondary source
##   - multiply value value of parent industry in main source with shares to obtain value of selected industry and peer industries
##   - calculate difference between parent industry and sum of child industries for both source
##   - for each industry not in main source, calculate industry value as share between the calculated differences of both sources applied to the industry in the secondary source
##
## graphical display:
##   - show industry value
##   - show parent value
##   - show shares of industry and peer industries


