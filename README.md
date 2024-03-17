# R package: dupNodes  <!-- badges: start -->
  [![CRAN status](https://www.r-pkg.org/badges/version/dupNodes)](https://CRAN.R-project.org/package=dupNodes)
[![Check and test package](https://github.com/JJ/R-dupNodes/actions/workflows/R-stuff.yml/badge.svg)](https://github.com/JJ/R-dupNodes/actions/workflows/R-stuff.yml)
  <!-- badges: end -->

`dupNodes` is the companion package to paper "Intra-family links in the analysis
of marital networks", with [reference here](inst/REFERENCES.bib).

It creates duplicates of nodes that have self loops in undirected graphs such as
the one here

![A with self loop](img/self-loops.png)

in this way

![Duplicated node](img/dup-nodes.png)

which has exactly the same degree; in this way, the weights of these self-loops
can be taken into account when computing centrality measures such as
betweenness.

## Installation

Install [released versions from CRAN as
usual](https://cran.r-project.org/package=dupNodes), or
development version from here

```R
library(devtools)
install_github("JJ/R-dupNodes")
```

## Reference

Please cite this paper when using this package in your work

```bibtex
@Article{mm24:intra_family_links,
  author =       {Merelo, J.J. and Molinari, M.C. },
  title =        {Intra-family links in the analysis of marital networks},
  journal =      {Journal of computational social science},
  year =         2024,
  url= {https://rdcu.be/dwYth},
  doi= {https://doi.org/10.1007/s42001-023-00245-4},
  month =     {January}
}
```

## Examples

There are some examples explained in *vignettes*. Use `vignette("dupNodes")` to
access all of chem, or individually:

* `vignette("doges-social-network")` to apply functions here to data from the
   [`dogesr`](https://cran.r-project.org/package=dogesr) package; this is [the online
  version](https://cran.r-project.org/package=dupNodes/vignettes/doges-social-network.html)
* `vignette("florentine-social-network")`, which uses data from the well-known
  Florentine social network, with a (documented) self-loop added.

## License

The contents of this repository are (c) JJ Merelo, 2024, and are released under
the GPL 3 license.

