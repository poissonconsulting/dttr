context("date-time")

test_that("date_time", {
  is.na(dates[1]) <- TRUE
  expect_identical(dtt_date_time(dates), as.POSIXct(
    c(NA, "1899-12-31 00:00:00", "1972-04-29 00:00:00"), 
    tz = Sys.timezone()))
  
  dtt_date_time("2001-01-01 00:00:00")
})

test_that("dayte_time", {
  expect_identical(dtt_doy(dates), c(1L, 365L, 120L))

  expect_identical(dtt_dayte_time(date_times, tz = "Etc/GMT+8"), as.POSIXct(
    c("1972-01-01 00:00:00", "1972-12-31 23:59:59", "1972-06-30 23:59:59"), 
    tz = "Etc/GMT+8"))
})
