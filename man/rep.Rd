\name{rep.onion}
\alias{rep.onion}
\title{Replicate elements of onionic vectors}
\description{
  Replicate elements of onionic vectors
}
\usage{
\method{rep}{onion}(x, times, ...)
}
\arguments{
  \item{x}{Onionic vector}
  \item{times}{number of times to repeat \code{x}}
  \item{...}{Further arguments passed to  \code{seq.defauilt()}}
}
\author{Robin K. S. Hankin}
\examples{
a <- roct(3)
rep(a,2) + a[1]
rep(a,each=2)
rep(a,length.out=5)
}
\keyword{array}
