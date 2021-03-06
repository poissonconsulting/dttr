context("time")

test_that("time", {
  expect_equal(dtt_time(date_times[1]), as_hms("00:00:00"))
  expect_equal(dtt_time(date_times[2]), as_hms("23:59:59"))
  dtt_time(NA_integer_)
})

test_that("date_time", {
  is.na(date_times[1]) <- TRUE
  expect_identical(dtt_time(date_times[1]), NA_hms_)
  expect_identical(dtt_time(date_times[2]), as_hms("23:59:59"))
  expect_identical(dtt_time(date_times[3]), as_hms("23:59:59"))
  expect_identical(dtt_time(date_times[1]), NA_hms_)
  expect_identical(dtt_time(date_times), as_hms(
    c(NA, "23:59:59", "23:59:59")))
  expect_equal(dtt_time(5), as_hms("00:00:05"))
  expect_equal(dtt_time(5.5), as_hms("00:00:05"))
  expect_equal(dtt_time("00:00:10"), as_hms("00:00:10"))
})
