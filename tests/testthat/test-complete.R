context("complete")

test_that("complete.Date", {
  dates <- as.Date(c("2001-01-02", "2001-01-01"))
  expect_identical(dtt_complete(dates), sort(dates))
  expect_identical(dtt_complete(dates[1]), dates[1])
  dates <- as.Date(c("2001-01-03", "2001-01-01"))
  expect_identical(dtt_complete(dates, sort = FALSE), as.Date(c("2001-01-03", "2001-01-01", "2001-01-02")))
  expect_identical(dtt_complete(dates, units = "months", floor = FALSE), sort(dates))
  expect_identical(dtt_complete(dates, units = "months"), as.Date("2001-01-01"))
})

test_that("complete.POSIXct", {
  expect_identical(length(dtt_complete(c(date_times[1], as.POSIXct("2000-12-01 00:00:00", tz =  "Etc/GMT+8")))), 12L)
  date_times <- as.POSIXct(c("2001-01-01 00:00:02", "2001-01-01 00:00:01"))
  expect_equal(dtt_complete(date_times), sort(date_times))
  expect_equal(dtt_complete(date_times[1]), date_times[1])
  expect_equal(dtt_complete(date_times[1], to = date_times[1]), date_times[1])
  expect_equal(dtt_complete(date_times[1], from = date_times[2]), sort(date_times))

  dates <- as.Date(c("2001-01-03", "2001-01-01"))
  expect_identical(dtt_complete(dates, sort = FALSE), as.Date(c("2001-01-03", "2001-01-01", "2001-01-02")))
  expect_identical(dtt_complete(dates, sort = FALSE, units = "months", floor = FALSE), dates)
  expect_identical(dtt_complete(dates, units = "months"), dates[2])

})
