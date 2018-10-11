context("doy")

test_that("doy_to_date", {
  expect_identical(dtt_doy_to_date(integer(0), 1L), as.Date("2001-01-02")[-1])
  expect_identical(dtt_doy_to_date(1:2, 2000L), as.Date(c("2000-01-01", "2000-01-02")))
  expect_identical(dtt_doy_to_date(1:2, 2002:2001), as.Date(c("2002-01-01", "2001-01-02")))
  expect_identical(dtt_doy_to_date(1:2, 2002:2001), as.Date(c("2002-01-01", "2001-01-02")))
  expect_identical(dtt_doy_to_date(c(NA,2L), 2002:2001), as.Date(c(NA, "2001-01-02")))
})
