context("add")

test_that("add Date", {
  expect_identical(dtt_add_years(dates[0], 2L), as.Date("2002-01-01")[0])
  expect_identical(dtt_add_years(dates[1], 2L), as.Date("2002-01-01"))
  expect_identical(dtt_add_months(dates[3], 13L), as.Date("1973-05-29"))
  expect_identical(dtt_add_months(dates[3], -5L), as.Date("1971-11-29"))
  expect_identical(dtt_add_months(dates[3], -4L), as.Date("1971-12-29"))
  expect_identical(dtt_add_days(dates[1], 2L), as.Date("2000-01-03"))
  expect_identical(dtt_add_days(dates[1], -2L), as.Date("1999-12-30"))
})

test_that("add POSIXct", {
  expect_identical(dtt_add_years(date_times[1], 2L), 
                   as.POSIXct("2002-01-01 00:00:00", tz = "Etc/GMT+8"))
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
