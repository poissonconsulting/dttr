context("doy")

test_that("doy_to_date", {
  expect_identical(dtt_doy_to_date(integer(0), 1L), as.Date("2001-01-02")[-1])
  expect_identical(dtt_doy_to_date(1:2, 2000L), as.Date(c("2000-01-01", "2000-01-02")))
  expect_identical(dtt_doy_to_date(1:2, 2002:2001), as.Date(c("2002-01-01", "2001-01-02")))
  expect_identical(dtt_doy_to_date(1:2, 2002:2001), as.Date(c("2002-01-01", "2001-01-02")))
  expect_identical(dtt_doy_to_date(c(NA,2L), 2002:2001), as.Date(c(NA, "2001-01-02")))
})


test_that("doy", {
  expect_identical(dtt_doy(dates), c(1L, 365L, 120L))
  expect_identical(dtt_doy(date_times), c(1L, 365L, 182L))
  expect_identical(dtt_doy(dates), c(1L, 365L, 120L))
})

