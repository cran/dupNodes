
library(igraph)

V1 <- c("A", "A","B","C","D","E")
V2 <- c("A", "B","C","D","E","A")

df <- data.frame(V1, V2)
original.graph <- graph_from_data_frame(df, directed=FALSE)
betweenness.original <- betweenness(original.graph)
dup.graph <- dup.nodes.from.data.frame( df )
betweenness.dup <- betweenness.with.duplicated.nodes(dup.graph)

test_that("Betweenness is the same any path it takes", {
  computed.DNSL.betweenness <- DNSL.betweenness(df)
  expect_equal( computed.DNSL.betweenness, betweenness.dup )
})



