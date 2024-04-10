library(igraph)

# Computes betweenness centrality for a graph, hiding the transformation
# DNSL = Duplicated Nodes with Self Loops
#

DNSLbetweenness_for_graph <- function( graph.with.self.loops ) {
  dup.graph <- dup.nodes.from.graph( graph.with.self.loops )
  betweenness <- betweenness(dup.graph)
  original.nodes <- .original_graph_nodes(dup.graph)
  return( betweenness[ original.nodes ] )
}
