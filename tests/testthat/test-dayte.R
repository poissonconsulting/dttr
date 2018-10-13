context("dayte")

test_that("dayte", {
  expect_identical(dtt_dayte(dates), as.Date(c("1972-01-01", "1972-12-31", "1972-04-29")))
  expect_identical(dtt_dayte(date_times), as.POSIXct(
    c("1972-01-01 00:00:00", "1972-12-31 23:59:59", "1972-06-30 23:59:59"), 
    tz = "Etc/GMT+8"))
})