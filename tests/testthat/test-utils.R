V1 <- c("A", "A","'B")
V2 <- c("A", "'B", "'B")
df <- data.frame(V1, V2)
unique_nodes_count <- length(unique(c(V1,V2)))
dup.graph <- dup.nodes.from.data.frame(df)

test_that("retrieving original nodes work", {
  just_the_original_nodes <- .original_graph_nodes(dup.graph)
  expect_equal( length(just_the_original_nodes), unique_nodes_count )
})
