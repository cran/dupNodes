library(igraph)

# Computes betweenness centrality in a graph with duplicates nodes, returning only values for original ones
#

betweenness.with.duplicated.nodes <- function( dup.graph ) {
  betweenness <- betweenness(dup.graph)
  original.nodes <- V(dup.graph)[ !grepl("'", V(dup.graph)$name) ]
  return( betweenness[ original.nodes ] )
}
