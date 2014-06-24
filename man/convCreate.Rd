\name{convCreate}
\alias{convCreate}
\title{Create Converter}
\usage{
  convCreate(dim = list(row = c(58, 37), col = c(58)),
    agg.row1 = c(1:10), agg.row2 = c(1:2), agg.col1 = c(5),
    horiz = FALSE, dimnames = NULL)
}
\arguments{
  \item{dim}{a list with two non-empty elements specifying
  the dimensions of the converter.}

  \item{aggdim1}{a numeric vector with two elements
  specifying the first aggregation dimension.}

  \item{aggrng1}{a numeric vector with two elements
  specifying the aggregation range selected by
  \code{aggdim1}.}

  \item{aggdim2}{a numeric vector with two elements
  specifying the second aggregation dimension.}

  \item{aggrng2}{a numeric vector with two elements
  specifying the aggregation range selected by
  \code{aggdim2}.}

  \item{fixed}{a numeric vector specifying the members to
  aggregate in dimension other than \code{aggdim1}.}

  \item{horiz}{logical specifying if the converter shall be
  applied horizontally.}

  \item{dimnames}{a list with as many items as dimensions,
  each item as many elements as dimension members.}
}
\description{
  Create Matrix Aggregation Converters
}
\details{
  Create converters for the aggregation of matrices. Tested
  with two cascaded row dimensions and one column
  dimension.
}
\examples{
convCreate(dim=list(row=c(10,5),col=c(10)),agg.row1=c(1:10),agg.row2=c(1:2),agg.col1=c(5),horiz=FALSE,dimnames=NULL)
}
\author{
  OECD STAN
}
\seealso{
  \code{\link{indAggregate}}
}
\keyword{IO}
