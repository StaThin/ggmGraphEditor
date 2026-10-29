# graphLayout() always launches an interactive Shiny gadget, so these tests
# only exercise the input-validation code paths that run before the app
# would be started; they must not trigger shiny::runGadget().

test_that("an invalid Viewer argument is rejected before launching the app", {
  amat <- matrix(c(0, 1, 0, 0), 2, 2)
  expect_error(
    graphLayout(amat, Viewer = "not-a-real-viewer"),
    "should be one of"
  )
})

test_that("an invalid adjacency matrix is rejected before launching the app", {
  bad <- matrix(1:6, nrow = 2, ncol = 3)
  expect_error(graphLayout(bad, Viewer = "browser"), "quadrata")
})

test_that("coords must be a conformable numeric matrix", {
  amat <- matrix(c(0, 1, 0, 0), 2, 2)
  expect_error(graphLayout(amat, coords = matrix(0, 3, 2), Viewer = "browser"),
               "'coords' must be")
  expect_error(graphLayout(amat, coords = matrix("a", 2, 2), Viewer = "browser"),
               "'coords' must be")
  expect_error(graphLayout(amat, coords = matrix(c(0, NA, 1, 1), 2, 2),
                           Viewer = "browser"),
               "missing or infinite")
})

test_that("resolve_coords keeps original units and returns a display scale", {
  adj <- matrix(c(0, 1, 0, 0, 0, 1, 0, 0, 0), 3, 3)

  r0 <- resolve_coords(NULL, adj)
  expect_null(r0$xy)
  expect_equal(r0$scale, 1)

  xy <- matrix(c(0, 2, 4, 1, 1, 1), 3, 2)
  r <- resolve_coords(xy, adj)
  expect_equal(r$xy, xy)
  expect_equal(max(abs(r$xy * r$scale)), 300)

  r2 <- resolve_coords(igraph::layout_nicely, adj)
  expect_equal(dim(r2$xy), c(3, 2))
  expect_true(all(is.finite(r2$xy)))

  # degenerate layout (all nodes at the same point) does not divide by zero
  expect_equal(resolve_coords(matrix(0, 3, 2), adj)$scale, 1)
})
