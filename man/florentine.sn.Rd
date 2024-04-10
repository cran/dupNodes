\name{florentine.sn}
\alias{florentine.sn}
\title{Data on matrimonial and commercial links of Florentine families}

\description{
Florentine matrimonial links as an \code{igraph} object; it includes marriages as well as commercial links between Florentine families.
}

\usage{
data("florentine.sn")
}

\details{
Florentine matrimonial links as an \code{igraph} object; it includes marriages as well as commercial links between Florentine families as recorded by Padgett and Ansell \insertCite{padgett1993robust}{dupNodes} and published by \insertCite{Wang2022}{dupNodes}. It has been enriched with the Medici family genealogy, adding a single self-loop to it.

This is an \code{igraph} object where vertices are Florentine families, and edges link two families that have some kind of relationship, either matrimonial or commercial.
}

\value{
A list that can be used as an \code{igraph} object, with noble family names as vertices and edges indicating links.
}

\references{
\insertAllCited{}
}
\author{J. J. Merelo}
\note{
Data originally from the Wikipedia page on the Medici family, and the Padgett and Ansell paper as codified in the Wang dataset.
}

\seealso{
\code{link{doges}}
}

\examples{
library(dupNodes)
library(igraph)
data("florentine.sn")

# All families linked to the Medici
incident(florentine.sn,as.numeric(V(florentine.sn)["MEDICI"]))

# Self loops
E(florentine.sn)[which_loop(florentine.sn)]
}

\keyword{ Florence }
\keyword{ Social Networks }
\keyword{ Digital Humanities}
