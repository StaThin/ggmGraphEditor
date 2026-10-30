## Update

This is an update of ggmGraphEditor from 0.1.0 to 0.2.0 (see NEWS.md).

* New optional argument `coords` in `graphLayout()` to set the initial node
  positions, either as a matrix, as an igraph layout function, or as one of
  "TB", "BT", "LR", "RL" for a layered layout of the directed edges. Existing
  calls are unaffected: the new argument is the last one in the signature
  and defaults to `NULL`.
* More compact editor interface (toolbar instead of sidebar, canvas filling
  the window), a "Fit" button and a slower zoom.

## R CMD check results

0 errors | 0 warnings | 0 notes

## Suggested packages not on CRAN

* The 'graph' package (listed in Suggests) is distributed via Bioconductor,
  not CRAN. It is only used conditionally, guarded by
  `requireNamespace("graph", quietly = TRUE)`, and the package provides an
  informative error if it is not installed. On CRAN's check machines this
  may produce a NOTE such as:

    Package suggested but not available for checking: 'graph'

  This does not indicate a problem with the package.

## Test environments

* local macOS (aarch64-apple-darwin23), R 4.6.1

## Downstream dependencies

There are currently no downstream dependencies for this package.
