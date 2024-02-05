\name{betweenness.with.duplicated.nodes}
\alias{betweenness.with.duplicated.nodes}
\title{Computed betweenness of an igraph object that already has duplicated nodes}
\description{
This is an implementation of the method published in the paper "Intra-family links in the analysis of marital networks", which proposed a duplication of nodes that includes self-loops to get a reflect better (and include all information about) the status of all nodes in the network, computing betweenness ignoring the duplicated nodes.
}
\usage{
betweenness.with.duplicated.nodes(dup.graph)
}
\arguments{
\item{dup.graph}{A graph object that has already duplicated nodes with self-loops. Essentially, it will recognize duplicated nodes as those with a prime at the end. Will not return betweenness value for these (it will be exactly the same as the other one).}
}
\details{
This method computes betweenness centrality in the regular way; it will only return values for the "original" nodes, however.
}
\value{A list with betweenness values indexed by node name}

\references{
\insertAllCited{}
}

\examples{
library(igraph)
V1 <- c("A", "A","B","C","D","E")
V2 <- c("A", "B","C","D","E","A")
df <- data.frame(V1, V2)

dup.graph <- dup.nodes.from.data.frame(df)
print(betweenness.with.duplicated.nodes(dup.graph))
}
\keyword{Social networks}
\keyword{Seudographs}
\keyword{Betweenness centrality}
\keyword{Self-loops}
