\name{florentine.sn}
\alias{florentine.sn}
\title{Data on matrimonial and commercial links of Florentine families}

\description{
Florentine matrimonial links as an \code{igraph} object; it includes marriages as well as commercial links between families as recorded by Padgett and Ansell \cite{padgett1993robust} and published by \cite{Wang2022}. It has been enriched with the Medici family genealogy, adding a single self-loop to the Medici family.
}

\usage{
data("florentine.sn")
}

\details{
This is an igraph object where vertices are Florentine families, and edges link two families that have some kind of relationship, either matrimonial or commercial.
}

\value{
A list that can be used as an igraph object, with noble family names as vertices and edges indicating links
}

\references{
\insertAllCited{}
}
\author{J. J. Merelo}
\note{
Data originally from the Wikipedia page on the Medici family, and the Padgett and Ansell paper.
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
