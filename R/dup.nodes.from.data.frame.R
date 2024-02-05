library(igraph)
# Duplicates nodes using as input a data frame with nodes in two columns

dup.nodes.from.data.frame <- function( df, first.node="V1", second.node="V2" ) {
  names(df)[ names(df) == first.node ] <- "first.node"
  names(df)[ names(df) == second.node ] <- "second.node"

  self.loops <- df[ df$first.node == df$second.node, ]
  if ( nrow(self.loops) == 0 ) {
    return( graph_from_data_frame(df, directed=FALSE) )
  }

  all.self.loops <- unique(self.loops$first.node)

  copy.df <- df[ df$first.node != df$second.node, ]
  dup.df <- copy.df
  dups.1 <- copy.df[ copy.df$first.node %in% all.self.loops, ]
  dups.1$first.node <- paste0(dups.1$first.node, "'")
  dup.df <- rbind(dup.df, dups.1)
  dups.2 <- dup.df[ dup.df$second.node %in% all.self.loops, ]
  dups.2$second.node <- paste0(dups.2$second.node, "'")
  dup.df <- rbind(dup.df, dups.2)

  self.loops$second.node <- paste0(self.loops$second.node, "'")
  dups.df <- rbind(dup.df, self.loops)

  return( graph_from_data_frame(data.frame(dups.df$first.node, dups.df$second.node), directed=FALSE) )
}
