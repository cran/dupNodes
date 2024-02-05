## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----load, warning=FALSE,message=FALSE----------------------------------------
library(dogesr)
library(dupNodes)
data("doges")

## ----self.loops---------------------------------------------------------------
family.marriages <- data.doges[ data.doges$Family.doge == data.doges$Family.dogaressa,]

## ----self.loops.families------------------------------------------------------
knitr::kable(table(family.marriages$Family.doge))

## ----betweenness,message=FALSE------------------------------------------------
library(igraph)
married.doges <- data.doges[ data.doges$Family.dogaressa != '',]
original.betweenness <- betweenness(
  graph_from_data_frame(
    data.frame(married.doges$Family.doge, married.doges$Family.dogaressa), directed=FALSE
    )
  )
dnsl.betweenness <- DNSL.betweenness(
  married.doges, 
  first.node="Family.doge", 
  second.node="Family.dogaressa")

## ----betweenness.table--------------------------------------------------------
knitr::kable(head(sort(original.betweenness, decreasing=TRUE), n=10))
knitr::kable(head(sort(dnsl.betweenness, n=10, decreasing=TRUE), n=10))

## ----graph--------------------------------------------------------------------
dup.graph <- dup.nodes.from.data.frame(
  data.frame(V1=married.doges$Family.doge, V2=married.doges$Family.dogaressa)
  )
components <- igraph::clusters(dup.graph, mode="weak")
biggest_cluster_id <- which.max(components$csize)
vert_ids <- V(dup.graph)[components$membership == biggest_cluster_id]

doges.sn.connected <- igraph::induced_subgraph(dup.graph, vert_ids)
plot(doges.sn.connected,layout=layout_with_fr, vertex.label.cex=0.7)

