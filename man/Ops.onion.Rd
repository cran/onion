\name{Ops.onion}
\alias{Ops.onion}
\alias{Ops}
\alias{OprodO}
\alias{HprodH}
\alias{R_OprodO}
\alias{R_HprodH}
\alias{AprodA}
\alias{AsumA}
\alias{AprodS}
\alias{Ainv}
\alias{Aneg}
\alias{AequalsA}
\alias{Apower}
\alias{Amassage}
\alias{harmonize}
\title{Arithmetic Ops Group Methods for Octonions}
\description{
  Allows arithmetic operators to be used for octonion calculations,
  such as addition, multiplication, division, integer powers, etc.
}
\usage{
Ops.onion(e1, e2)
OprodO(oct1,oct2)
HprodH(quat1,quat2)
R_OprodO(oct1,oct2)
R_HprodH(quat1,quat2)
AprodA(A,B, ur=getOption("use.R"))
AsumA(A, B)
Apower(A,B)
AequalsA(A,B)
AprodS(A,scalar)
Ainv(A)
Aneg(A)
Amassage(A,B)
harmonize(A,B)
}
\arguments{
  \item{e1}{an object of class \code{"onion"}.}
  \item{e2}{an object of class \code{"onion"}.}
  \item{A}{object of class \code{"onion"}}
  \item{B}{object of class \code{"onion"}}
  \item{oct1}{Octonionic vector}
  \item{oct2}{Octonionic vector}
  \item{quat1}{Quaternionic vector}
  \item{quat2}{Quaternionic vector}
  \item{scalar}{Scalar vector}
  \item{ur}{In function \code{AprodA()},  Boolean with default
    \code{FALSE} meaning to use the \code{c} implementation; and
    \code{TRUE} meaning to use the interpreted \code{R} function.  See
    details section.}
}
\details{
  The function \code{Ops.onion()} passes \dQuote{\code{*}} to function
  \code{AprodA()}.  This function is sensitive to the value of option
  \code{use.R}.  If this is \code{FALSE}, then 
  arguments are passed, via \code{Amassage()}, to either
  \code{R_HprodH()} (for quaternions), or
  \code{R_OprodO()} (for octonions).  If option \code{use.R} is
  anything other than \code{FALSE} (including being unset, which is the
  default), the massaged arguments are passed to
  \code{R_HprodH()} or \code{R_OprodO()}.

  The relative performance of, say, \code{OprodO()} vs
  \code{R_OprodO()}, will be system dependent but on my little Linux
  system (Fedora; 256MB) \code{OprodO()} runs more than three hundred
  times faster than \code{R_OprodO()}.  Your mileage may vary; see
  examples section for using \code{options()} to set argument \code{ur}.
}
\value{
  Return an object of the appropriate (ie biggest) class as went in,
  qua \code{harmonize()}.

  The only non obvious ones are \code{Amassage()}, which is used by the
  other functions to massage the two arguments into being the same
  length, thus emulating recycling.

  The other one is \code{harmonize()} that coerces scalars into
  quaternions and quaternions into octonions if necessary, returning a
  list of two octonions or two quaternions of the same length, for
  passing to functions like \code{AprodA()}.

  None of these functions are really intended for the end
  user: use the ops as shown in the examples section.
}
\note{
  The \dQuote{\code{A}} at the function means \strong{A}ny onion.  Thus
  \code{Ainv()} takes quaternionic or octonionic arguments, but
  \code{OprodO()} takes only octonions.
  
} 
\examples{
x <- octonion(Re=1  , il=1:3, k=3:1)
y <- octonion(Re=1:3,  i=1  ,il=3:1)
z <- octonion(Re=3:1,  j=1  ,jl=1:3)
x*9
x+y
x*y
x/y

}
\keyword{symbolmath}
