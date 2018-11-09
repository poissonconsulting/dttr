context("tz")

test_that("sys_tz", {
  dtt_reset_sys_tz()
  expect_identical(dtt_sys_tz(), Sys.timezone())
  old <- dtt_set_sys_tz("Etc/GMT+8")
  expect_identical(dtt_sys_tz(), "Etc/GMT+8")
  expect_identical(dtt_reset_sys_tz(), "Etc/GMT+8")
  expect_identical(dtt_sys_tz(), Sys.timezone())
})

test_that("tz.Date", {
  expect_identical(dtt_tz(dates), Sys.timezone())
})

test_that("tz.POSIXct", {
  expect_identical(dtt_tz(Sys.time()), Sys.timezone())
  expect_identical(dtt_tz(date_times), "Etc/GMT+8")
  expect_identical(dtt_tz(date_times[1]), "Etc/GMT+8")
  expect_identical(dtt_tz(c(date_times[1])), "Etc/GMT+8")
})

test_that("adjust_tz.Date", {
  expect_identical(dtt_adjust_tz(date_times[1], tz = "UTC"), 
                   as.POSIXct("2000-01-01 08:00:00", tz = "UTC"))
})

test_that("set_tz.Date", {
  expect_identical(dtt_set_tz(date_times[1], tz = "UTC"), 
                   as.POSIXct("2000-01-01 00:00:00", tz = "UTC"))
})
