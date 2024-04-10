\name{DNSLbetweenness_for_graph}
\alias{DNSLbetweenness_for_graph}
\title{Computes betweenness via duplication of nodes with self-loops for a graph}
\description{
Computes the betweenness of nodes in a graph that includes self-loops directly.
}
\usage{
DNSLbetweenness_for_graph(graph.with.self.loops)
}
\arguments{
\item{graph.with.self.loops}{An \code{igraph} object some of whose nodes have connections with themselves (self-loops).}
}
\details{
This method computes betweenness centrality via the duplicated nodes method \insertCite{mm24:intra_family_links}{dupNodes} for a `igraph` object. Use it when you want to just apply the DNSLbetweenness method to an already built graph. The intermediate graph obtained by duplicating nodes is hidden and discarded.
}
\value{A list with DNSLbetweenness values for the nodes in the graph.}

\references{
\insertAllCited{}
}

\examples{
library(igraph)
V1 <- c("A", "A","B","C","D","E")
V2 <- c("A", "B","C","D","E","A")
print(DNSLbetweenness_for_graph(graph_from_data_frame(data.frame(V1,V2))))
}
\keyword{Social networks}
\keyword{Seudographs}
\keyword{Betweenness centrality}
\keyword{Self-loops}
