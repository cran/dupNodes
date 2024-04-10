## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----load, warning=FALSE,message=FALSE----------------------------------------
library(dupNodes)
data("florentine.sn")

## ----self.loops, fig.dim=c(8,6)-----------------------------------------------
library(igraph)
print(V(florentine.sn))
print(E(florentine.sn))
plot(florentine.sn)
print(E(florentine.sn)[which_loop(florentine.sn)])

## ----betweenness,message=FALSE------------------------------------------------
dn.florentine.sn <- dup.nodes.from.graph(florentine.sn)
V(florentine.sn)$DNSLbetweenness <- betweenness.with.duplicated.nodes(dn.florentine.sn)

## ----betweenness.table--------------------------------------------------------
DNSLBetweenness <- data.frame( family=V(florentine.sn)$name, betweenness=V(florentine.sn)$DNSLbetweenness)
knitr::kable(DNSLBetweenness[order(DNSLBetweenness$betweenness, decreasing=TRUE),])

