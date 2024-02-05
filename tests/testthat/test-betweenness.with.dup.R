
library(igraph)

V1 <- c("A", "A","B","C","D","E")
V2 <- c("A", "B","C","D","E","A")

original.graph <- graph_from_data_frame(data.frame(V1, V2), directed=FALSE)
betweenness.original <- betweenness(original.graph)
dup.graph <- dup.nodes.from.data.frame( data.frame(V1, V2) )

test_that("It returns only original nodes", {
  betweenness.dup <- betweenness.with.duplicated.nodes(dup.graph)
  expect_equal( length(betweenness.dup), length(unique(c(V1,V2))) )
  expect_false( unname(betweenness.original["A"]) == unname(betweenness.dup["A"]) )
})



