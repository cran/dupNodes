\name{dup.nodes.from.graph}
\alias{dup.nodes.from.graph}
\title{Creates an igraph object from a igraph some of whose nodes have self-loops}
\description{
This is an implementation of the method published in the paper "Intra-family links in the analysis of marital networks", which proposed a duplication of nodes that includes self-loops to get a reflect better (and include all information about) the status of all nodes in the network.
}
\usage{
dup.nodes.from.graph(graph.with.self.loops)
}
\arguments{
\item{graph.with.self.loops}{An igraph object that includes some nodes with self-loops}
}
\details{
This method duplicates nodes with self-loops, and links the duplicated nodes with the original with a weight that is equal to the number of self-loops; it also duplicates all connections from the original node to other node, including the new ones created.

This can be applied to matrimonial networks where there are marriages among members of the same family, or any other type of network with self-loops, and allows to apply centrality (and other) measures, obtaining a meaningful and more accurate result
}
\value{An igraph object with all nodes with self-loops duplicated, and edges to the original nodes duplicated in the same way. These newly created nodes will have the same name as the original, with a "'" added.}

\references{
\insertAllCited{}
}

\examples{
library(igraph)
V1 <- c("A", "A","B","C","D","E")
V2 <- c("A", "B","C","D","E","A")

graph.with.self.loops <- graph_from_data_frame(data.frame(V1, V2), directed=FALSE)

dup.graph <- dup.nodes.from.graph(graph.with.self.loops)
print(incident(dup.graph,"A"))
}
\keyword{Social networks}
\keyword{Seudographs}
\keyword{Betweenness centrality}
\keyword{Self-loops}
