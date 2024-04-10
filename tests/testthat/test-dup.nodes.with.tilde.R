
library(igraph)

V1 <- c("A", "A","'B")
V2 <- c("A", "'B", "'B")
df <- data.frame(V1, V2)

test_that("simple graphs works", {
  dup.graph <- dup.nodes.from.data.frame(df)
  expect_equal( length(V(dup.graph)), 4 )
  expect_equal( length(E(dup.graph)), 6 )
  btw <- betweenness.with.duplicated.nodes(dup.graph)
  expect_equal( length(btw), 2 )
})
