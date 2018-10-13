context("date")

test_that("date", {
  is.na(dates[2]) <- TRUE
  expect_identical(dtt_date(dates), dates)
  is.na(date_times[2]) <- TRUE
  expect_identical(dtt_date(date_times), as.Date(c("2000-01-01", NA, "1972-06-30")))
  date <- as.Date("2001-01-01")
  expect_identical(dtt_date(date), date)
  date2 <- date + 0.5
  expect_identical(dtt_date(date2), date)
})

test_that("integer", {
  expect_identical(as.integer(dates[3]), 849L)
  expect_identical(dtt_date(as.integer(dates[3])), dates[3])
})

test_that("doy", {
  expect_identical(dtt_doy(dates), c(1L, 365L, 120L))
  expect_identical(dtt_doy(date_times), c(1L, 365L, 182L))
  expect_identical(dtt_doy(dates), c(1L, 365L, 120L))
})
