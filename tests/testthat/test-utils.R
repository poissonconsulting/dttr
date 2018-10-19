context("utils")

test_that("units_per_unit", {
  expect_identical(dtt_units_per_unit(), 86400)
  expect_identical(dtt_units_per_unit("hours"), 24)
  expect_identical(dtt_units_per_unit("minutes", "seconds"), 1/60)
})

test_that("adjust_units", {
  expect_identical(dtt_adjust_units(1), 1)
  expect_identical(dtt_adjust_units(1, "minutes"), 60)
  expect_identical(dtt_adjust_units(1, to = "minutes"), 1/60)
})
