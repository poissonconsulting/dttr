context("complete")

test_that("completed.Date", {
  expect_false(dtt_completed(dates))
  expect_true(dtt_completed(dates[1]))
  expect_error(dtt_completed(dates[integer(0)]), "units must not include missing values")
  expect_false(dtt_completed(dates[integer(0)], "seconds"))
  expect_true(dtt_completed(dates[integer(0)], "days"))
  expect_true(dtt_completed(as.Date(c("2001-01-02", "2001-01-01"))))
  expect_false(dtt_completed(as.Date(c("2001-01-03", "2001-01-01"))))
})

test_that("completed.POSIXct", {
  expect_false(dtt_completed(date_times))
  expect_true(dtt_completed(date_times[1]))
  expect_error(dtt_completed(date_times[integer(0)]), "units must not include missing values")
  expect_true(dtt_completed(date_times[integer(0)], "seconds"))
  expect_true(dtt_completed(date_times[integer(0)], "days"))
  expect_true(dtt_completed(as.POSIXct(c("2001-01-01 00:00:02", "2001-01-01 00:00:01"))))
  expect_false(dtt_completed(as.POSIXct(c("2001-01-01 00:00:03", "2001-01-01 00:00:01"))))
})

test_that("complete.Date", {
  dates <- as.Date(c("2001-01-02", "2001-01-01"))
  expect_identical(dtt_complete(dates), dates)
  expect_identical(dtt_complete(dates[1]), dates[1])
  dates <- as.Date(c("2001-01-03", "2001-01-01"))
  expect_identical(dtt_complete(dates), as.Date(c("2001-01-03", "2001-01-01", "2001-01-02")))
  expect_identical(dtt_complete(dates, "months"), dates)
})

test_that("complete.POSIXct", {
  date_times <- as.POSIXct(c("2001-01-01 00:00:02", "2001-01-01 00:00:01"))
  expect_equal(dtt_complete(date_times), date_times)
  expect_identical(dtt_complete(dates[1]), dates[1])
  dates <- as.Date(c("2001-01-03", "2001-01-01"))
  expect_identical(dtt_complete(dates), as.Date(c("2001-01-03", "2001-01-01", "2001-01-02")))
  expect_identical(dtt_complete(dates, "months"), dates)
})
