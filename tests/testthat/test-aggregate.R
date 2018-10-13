context("aggregate")

test_that("aggregate", {
  expect_identical(dtt_aggregate(dates), dates)
  expect_identical(dtt_aggregate(dates, "years"), 
                   as.Date(c("2000-01-01", "1899-01-01", "1972-01-01")))
})
