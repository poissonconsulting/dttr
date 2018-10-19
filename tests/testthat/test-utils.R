context("utils")

test_that("units_per_unit", {
  expect_identical(dtt_units_per_unit(), 86400)
  expect_identical(dtt_units_per_unit("hours"), 24)
  expect_identical(dtt_units_per_unit("minutes", "seconds"), 1/60)
})
