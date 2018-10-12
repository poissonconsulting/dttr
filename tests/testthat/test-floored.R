context("floored")

test_that("floored", {
  expect_true(dtt_floored(dates, "days"))
  expect_false(dtt_floored(dates, "months"))
})
