context("year")

test_that("get", {
  date_times_na <- date_times
  is.na(date_times_na[2]) <- TRUE

  dates_na <- dates
  is.na(dates_na[2]) <- TRUE
  
  times_na <- times
  is.na(times_na[[2]]) <- TRUE

})

test_that("set 1", {
  date_times_na <- date_times
  is.na(date_times_na[2]) <- TRUE
  date_times_0 <- date_times[integer(0)]

  dates_na <- dates
  is.na(dates_na[2]) <- TRUE
  dates_0 <- dates[integer(0)]

  
  dtt_year(date_times_na) <- 1L
  expect_identical(dtt_year(date_times_na), c(1L, NA, 1L))
  
  dtt_year(dates_na) <- 1L
  expect_identical(dtt_year(dates_na), c(1L, NA, 1L))
  
  dtt_year(dates_na) <- c(1L, 2L, 3L)
})
