library(igraph)

# Utility function that retrieves just the original nodes.
# These were marked with a `'` at the end of their name.
# Avoid node names that have that marking, thus.
# They will be returned in the original order, too.

.original_graph_nodes <- function( dup.graph ) {

  return( V(dup.graph)[ !grepl("'$", V(dup.graph)$name) ] )
}
