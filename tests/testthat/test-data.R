context("data")

test_that("dates", {
  expect_identical(dates, as.Date(c("2000-01-01", "1899-12-31", "1972-04-29")))
})

test_that("date_times", {
  expect_identical(date_times, as.POSIXct(
    c("2000-01-01 00:00:00", "1899-12-31 23:59:59", "1972-06-30 23:59:59"), 
    tz = "Etc/GMT+8"))
})