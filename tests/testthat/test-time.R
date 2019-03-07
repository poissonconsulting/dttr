context("time")

test_that("time", {
  expect_equal(dtt_time(date_times[1]), hms::as.hms("00:00:00"))
  expect_equal(dtt_time(date_times[2]), hms::as.hms("23:59:59"))
  expect_equal(dtt_time(date_times[2], tz = "Etc/GMT+7"), hms::as.hms("00:59:59"))
  expect_equal(dtt_time(date_times[2], tz = "Etc/GMT+9"), hms::as.hms("22:59:59"))
  dtt_time(NA_integer_)
})

test_that("date_time", {
  is.na(date_times[1]) <- TRUE
  expect_identical(dtt_time(date_times), hms::as.hms(
    c(NA, "23:59:59", "23:59:59")))
  expect_equal(dtt_time(5), hms::as.hms("00:00:05"))
  expect_equal(dtt_time(5.5), hms::as.hms("00:00:05"))
  expect_equal(dtt_time("00:00:10"), hms::as.hms("00:00:10"))
})
