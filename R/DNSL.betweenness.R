library(igraph)

# Computes betweenness centrality in a graph with duplicated nodes, returning only values for original ones.
# DNSL = Duplicated Nodes with Self Loops
#

DNSL.betweenness <- function( df, first.node="V1", second.node="V2" ) {
  dup.graph <- dup.nodes.from.data.frame(df, first.node, second.node)
  betweenness <- betweenness(dup.graph)
  original.nodes <- .original_graph_nodes(dup.graph)
  return( betweenness[ original.nodes ] )
}
