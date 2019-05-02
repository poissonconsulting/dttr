context("origin")

test_that("integer", {
  expect_identical(as.integer(dates[3]), 849L)
  expect_identical(dtt_date(as.integer(dates[3])), dates[3])
})
