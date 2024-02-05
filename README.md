# R package: dupNodes [![Check and test package](https://github.com/JJ/R-dupNodes/actions/workflows/R-stuff.yml/badge.svg)](https://github.com/JJ/R-dupNodes/actions/workflows/R-stuff.yml)

`dupNodes` is the companion package to paper "Intra-family links in the analysis
of marital networks", with [reference here](inst/REFERENCES.bib).

It creates duplicates of nodes that have self loops such as the one in this graph

![A with self loop](img/self-loops.png)

in this way

![Duplicated node](img/dup-nodes.png)

which has exactly the same degree; in this way, the weights of these self-loops
can be taken into account when computing centrality measures such as
betweenness.

## Installation

Install released versions from CRAN as usual, or development version
from here

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
  package [`dogesr`](https://github.com/JJ/dogesr).


## License

The contents of this repository are (c) JJ Merelo, 2024, and are released under
the GPL 3 license.

