context("date-time")

test_that("date_time", {
  expect_identical(as.integer(date_times[1]), 946713600L)
  expect_identical(as.integer(date_times[1]), 
                   as.integer(dtt_adjust_tz(date_times[1], tz = "Etc/GMT-4")))
  expect_identical(as.integer(date_times[1]), 
                   as.integer(dtt_set_tz(date_times[1], tz = "Etc/GMT+7")) + 3600L)
  
  expect_identical(dtt_date_time(as.integer(date_times[1]), tz = "Etc/GMT+8"), 
                   date_times[1])
})

test_that("date_time", {
  is.na(dates[1]) <- TRUE
  expect_identical(dtt_date_time(dates), as.POSIXct(
    c(NA, "1899-12-31 00:00:00", "1972-04-29 00:00:00"), 
    tz = Sys.timezone()))
  
  dtt_date_time("2001-01-01 00:00:00")
})
