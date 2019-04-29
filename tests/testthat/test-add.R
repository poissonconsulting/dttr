context("add")

test_that("add Date", {
  expect_identical(dtt_add_years(dates[0], 2L), as.Date("2002-01-01")[0])
  expect_identical(dtt_add_years(dates[1], 2L), as.Date("2002-01-01"))
  expect_identical(dtt_add_years(dates[1], 2:3), 
                   as.Date(c("2002-01-01", "2003-01-01")))
  expect_identical(dtt_add_months(dates[3], 13L), as.Date("1973-05-29"))
  expect_identical(dtt_add_months(dates[3], c(13L, 15L)), 
                   as.Date(c("1973-05-29", "1973-07-29")))
  expect_identical(dtt_add_months(dates[3], c(-5L, 6L)), 
                   as.Date(c("1971-11-29", "1972-10-29")))
  expect_identical(dtt_add_months(dates[3], -4L), as.Date("1971-12-29"))
  expect_identical(dtt_add_days(dates[1], 2L), as.Date("2000-01-03"))
  expect_identical(dtt_add_days(dates[1], -2L), as.Date("1999-12-30"))
  
  expect_identical(dtt_add_units(dates[3], 13L, units = "months"), as.Date("1973-05-29"))
  expect_error(dtt_add_units(dates[3], 13L, units = "hectares"), 
               "units must be 'seconds', 'minutes', 'hours', 'days', 'months' or 'years' not [(]'hectares'[)]")

  expect_identical(dtt_add_units(as.Date("1972-02-28")), as.Date("1972-02-29"))
})

test_that("add POSIXct", {
  expect_identical(dtt_add_years(date_times[1], 2L), 
                   as.POSIXct("2002-01-01 00:00:00", tz = "Etc/GMT+8"))
  expect_identical(dtt_add_years(date_times[1], 2:3), 
                   as.POSIXct(c("2002-01-01 00:00:00", "2003-01-01 00:00:00"), tz = "Etc/GMT+8"))  
  expect_identical(dtt_add_days(date_times[1], -3L), 
                   as.POSIXct("1999-12-29 00:00:00", tz = "Etc/GMT+8"))
  expect_identical(dtt_add_months(date_times[1], -3L), 
                   as.POSIXct("1999-10-01 00:00:00", tz = "Etc/GMT+8"))
  expect_identical(dtt_add_hours(date_times[1], -3L), 
                   as.POSIXct("1999-12-31 21:00:00", tz = "Etc/GMT+8"))
  expect_identical(dtt_add_minutes(date_times[1], 6L), 
                   as.POSIXct("2000-01-01 00:06:00", tz = "Etc/GMT+8"))
  expect_identical(dtt_add_seconds(date_times[1], 7L), 
                   as.POSIXct("2000-01-01 00:00:07", tz = "Etc/GMT+8"))
})
