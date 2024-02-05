\name{DNSL.betweenness}
\alias{DNSL.betweenness}
\title{Computed betweenness via duplication of nodes with self-loops (Duplicated Nodes with Self Loops)}
\description{
Computes the betweenness of nodes in a graph that includes self-loops directly.
}
\usage{
DNSL.betweenness(df,first.node = "V1",second.node = "V2")
}
\arguments{
\item{df}{A data frame that should include at least two columns with the names of the nodes}
\item{first.node}{The column that indicates the node that's linked}
\item{second.node}{The column that indicates the other node that's linked}
}
\details{
This method computes betweenness centrality of a social network included in a data frame. Use it when you want to just apply the method to a data set, without using the intermediate graph obtained by duplicating nodes.
}
\value{A list with betweenness values indexed by node name}

\references{
\insertAllCited{}
}

\examples{
library(igraph)
V1 <- c("A", "A","B","C","D","E")
V2 <- c("A", "B","C","D","E","A")
print(DNSL.betweenness(data.frame(V1,V2)))
}
\keyword{Social networks}
\keyword{Seudographs}
\keyword{Betweenness centrality}
\keyword{Self-loops}
