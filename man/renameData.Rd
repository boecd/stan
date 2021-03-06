% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/renameData.R
\name{renameData}
\alias{renameData}
\title{Rename Data}
\usage{
renameData(file = file.path(dbpath, "GitHub", "stanData", "data",
  "STANNAi3.rda"), from = c("DATA.STAN", "DATA.BTD"), to = c("DATA.STANi3",
  "DATA.BTDi3"))
}
\arguments{
\item{file}{the exported \code{rdata} file.}

\item{from}{character vector with old dataset names.}

\item{to}{character vector with new dataset names.}
}
\description{
Modify names of objects contained in in \code{rdata} file
}
\details{
Conveniently rename existing objects within an \code{rdata} file
}
\examples{
renameData(file = file.path(dbpath, "GitHub", "stanData", "data", "STANNAi3.rda"), from = c("DATA.STAN", "DATA.BTD"), to = c("DATA.STANi3", "DATA.BTDi3"))
}
\author{
OECD STAN
}
\seealso{
\code{\link{packageData}}
}
\keyword{package}

