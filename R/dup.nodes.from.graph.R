library(igraph)

# Duplicate nodes with self-loops from a existing graph

dup.nodes.from.graph <- function( graph.with.self.loops ) {
  if ( !any_loop(graph.with.self.loops) ) {
    return( graph.with.self.loops )
  }
  modified.graph <- graph.with.self.loops
  original.edges <- as_edgelist(modified.graph)
  self.edges <- original.edges[ which_loop(modified.graph),]

  if (length(self.edges) == 2) {
    nodes.with.self.loops <- self.edges[1]
  } else {
    nodes.with.self.loops <- unique(self.edges[,1])
  }
  # First add nodes
  for ( node in nodes.with.self.loops ) {
    new.node <- paste0(node,"'")
    modified.graph <- add_vertices(modified.graph,1,name=new.node)
  }

  # Then add edges to nodes
  for ( node in nodes.with.self.loops ) {
    new.node <- paste0(node,"'")
    for ( vertex in original.edges[ original.edges[,1] == node,2] ) {
      if ( vertex != node ) {
        modified.graph <- add_edges(modified.graph, c(vertex,new.node))
        if ( vertex %in% nodes.with.self.loops ) {
          modified.graph <- add_edges(modified.graph, c(paste0(vertex,"'"),new.node))
        }
      }
    }
    for ( vertex in original.edges[ original.edges[,2] == node,1] ) {
      if ( vertex != node ) {
        modified.graph <- add_edges(modified.graph, c(new.node,vertex))
      }
    }
  }

  if (length(self.edges) == 2) {
    new.node <- paste0(self.edges[1],"'")
    modified.graph <- add_edges(modified.graph, c(self.edges[1],new.node))
    modified.graph <- delete_edges(modified.graph, paste0(self.edges[1],"|",self.edges[2]))

  } else {
    for ( node in  self.edges[,1]) {
      new.node <- paste0(node,"'")
      modified.graph <- add_edges(modified.graph, c(node,new.node))
      modified.graph <- delete_edges(modified.graph, paste0(node,"|",node))
    }
  }

  return( modified.graph )
}
