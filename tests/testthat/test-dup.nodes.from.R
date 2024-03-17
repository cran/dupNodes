
library(igraph)

V1 <- c("A", "A","B")
V2 <- c("A", "B", "B")
df <- data.frame(V1, V2)

test_that("simple graphs works", {
  dup.graph <- dup.nodes.from.data.frame(df)
  expect_equal( length(V(dup.graph)), 4 )
  expect_equal( length(E(dup.graph)), 6 )
})

V1 <- c("A", "A","B","C","D","E")
V2 <- c("A", "B","C","D","E","A")

different.nodes <- unique(c(V1, V2))

df <- data.frame(V1, V2)

test_that("Graph with default values", {
  dup.graph <- dup.nodes.from.data.frame(df)
  expect_equal( length(V(dup.graph)), length(different.nodes)+1 )
})

colnames(df) <- c("node1", "node2")
test_that("Graph with custom values", {
  dup.graph <- dup.nodes.from.data.frame(df, first.node="node1", second.node="node2")
  expect_equal( length(V(dup.graph)), length(different.nodes)+1 )
  expect_equal( length(E(dup.graph)[ "A" %--% "A'"] ),1)
  expect_equal( length(incident(dup.graph,"A")), length(incident(dup.graph,"A'")) )
})

test_that("Does not change if no self-loops", {
  letters.3 <- c("A","B","C")
  df <- data.frame(V1=letters.3, V2=c("B","C","A"))
  unchanged.graph <- dup.nodes.from.data.frame(df)
  expect_equal( length(V(unchanged.graph)), length(letters.3) )
})

V1 <- c("A", "A","B","B", "C","D","E")
V2 <- c("A", "B","B","C","D","E","A")
df <- data.frame(V1, V2)

test_that("Works with two connected nodes with self-loops", {
  dup.graph <- dup.nodes.from.data.frame(df)
  expect_equal( length(V(dup.graph)), length(unique(c(V1, V2)))+2 )
  expect_equal( length(E(dup.graph)[ "A" %--% "B'"] ),1)
  expect_equal( length(incident(dup.graph,"A")), length(incident(dup.graph,"A'")))
  expect_equal( length(incident(dup.graph,"B")), length(incident(dup.graph,"B'")))
})

V1 <- c("A", "A","B","C","D","E","D")
V2 <- c("A", "B","C","D","E","A","D")

df <- data.frame(V1, V2)

test_that("Works with two disconnected nodes with self-loops", {
  dup.graph <- dup.nodes.from.data.frame(df)
  expect_equal( length(V(dup.graph)), length(unique(c(V1, V2)))+2 )
  expect_equal( length(E(dup.graph)[ "D" %--% "D'"] ),1)
  expect_equal( length(incident(dup.graph,"A")), length(incident(dup.graph,"A'")))
  expect_equal( length(incident(dup.graph,"D")), length(incident(dup.graph,"D'")))
})

graph.with.self.loops <- graph_from_data_frame(df, directed=FALSE)+edge("A","A")+edge("B","B")
test_that("it duplicates nodes from an existing graph", {
  dup.graph <- dup.nodes.from.graph(graph.with.self.loops)
  expect_equal( length(V(dup.graph)), length(unique(c(V1, V2)))+3 )
  expect_equal( length(E(dup.graph)[ "A" %--% "B'"] ),1)
  expect_equal( length(E(dup.graph)[ "A'" %--% "B'"] ),1)
})

V1 <- c("A", "A","B","C","D","E")
V2 <- c("A", "B","C","D","E","A")

graph.with.self.loops <- graph_from_data_frame(data.frame(V1, V2), directed=FALSE)
test_that("it works also with a single self-loop", {
  dup.graph <- dup.nodes.from.graph(graph.with.self.loops)
  expect_equal( length(V(dup.graph)), length(unique(c(V1, V2)))+1 )
  expect_equal( length(E(dup.graph)[ "A" %--% "A'"] ),1)
  expect_equal( length(incident(dup.graph,"A")), length(incident(dup.graph,"A'")))
})
