## Resubmission

This is a resubmission. In this version I have:

* Replaced `\dontrun{}` with `if (interactive()) {}` in the examples for
  `graphLayout()`, since the function always launches an interactive
  Shiny gadget and is not intended for use in scripts.
* Removed the redundant `\dontrun{}` wrapper around the `graphNEL` example
  for `grMAT2()`; it is now guarded only by
  `if (requireNamespace("graph", quietly = TRUE)) {}`, as recommended for
  examples that depend on a Suggests package.

## R CMD check results

0 errors | 0 warnings | 2 notes

* This is a new release (first submission to CRAN).

* checking CRAN incoming feasibility ... NOTE
  Maintainer: 'Giovanni M. Marchetti <giovanni.marchetti@unifi.it>'

  New submission

  This is expected for a first submission.

* checking HTML version of manual ... NOTE
  Skipping checking HTML validation: 'tidy' doesn't look like recent
  enough HTML Tidy.

  This note is caused by an outdated local installation of HTML Tidy
  and is not related to the package itself.

## Suggested packages not on CRAN

* The 'graph' package (listed in Suggests) is distributed via Bioconductor,
  not CRAN. It is only used conditionally, guarded by
  `requireNamespace("graph", quietly = TRUE)`, and the package provides an
  informative error if it is not installed. On CRAN's check machines this
  is expected to produce an additional NOTE such as:

    Package suggested but not available for checking: 'graph'

  This is expected and does not indicate a problem with the package.

## Test environments

* local macOS (aarch64-apple-darwin23), R 4.6.1

## Downstream dependencies

There are currently no downstream dependencies for this package.
