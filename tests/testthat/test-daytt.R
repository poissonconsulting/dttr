context("daytt")

test_that("daytt sets 1972 for dates and date times", {
  expect_identical(dtt_daytt(dates), as.Date(c("1972-01-01", "1972-12-31", "1972-04-29")))
  expect_identical(dtt_daytt(date_times), as.POSIXct(
    c("1972-01-01 00:00:00", "1972-12-31 23:59:59", "1972-06-30 23:59:59"), 
    tz = "Etc/GMT+8"))
})

test_that("daytt deals with start and leap year", {
  more_dates <- c("1998-02-27", "1999-02-28", "2000-02-29", "2003-03-01", "2004-03-02")
  more_dates <- as.Date(more_dates)
  
  expect_identical(dtt_daytt(more_dates), 
                   as.Date(c("1972-02-27", "1972-02-28", "1972-02-29", "1972-03-01", "1972-03-02")))
  
  expect_error(dtt_daytt(more_dates, start_month = 2L, start_day = rep(31L, 5)), 
                   "arguments start_month and start_day must define valid dates")
  
  expect_identical(dtt_daytt(more_dates, start_month = 2L, start_day = 27L), 
                   as.Date(c("1972-02-27", "1972-02-28", "1972-02-29", "1972-03-01", "1972-03-02")))
  expect_identical(dtt_daytt(more_dates, start_month = 2L, start_day = 28L), 
                  as.Date(c("1971-02-27", "1972-02-28", "1972-02-29", "1972-03-01", "1972-03-02")))
  expect_identical(dtt_daytt(more_dates, start_month = 2L, start_day = 29L), 
                  as.Date(c("1971-02-27", "1971-02-28", "1972-02-29", "1972-03-01", "1972-03-02")))
  expect_identical(dtt_daytt(more_dates, start_month = 3L), 
                  as.Date(c("1972-02-27", "1972-02-28", "1972-02-29", "1973-03-01", "1973-03-02")))
  expect_identical(dtt_daytt(more_dates, start_month = 3L, start_day = 2L), 
                  as.Date(c("1972-02-27", "1972-02-28", "1972-02-29", "1972-03-01", "1973-03-02")))
  expect_identical(dtt_daytt(more_dates, start_month = 3L, start_day = 3L), 
                  as.Date(c("1972-02-27", "1972-02-28", "1972-02-29", "1972-03-01", "1972-03-02")))
})
  