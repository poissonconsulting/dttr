context("seq")

test_that("seq", {
  expect_error(dtt_seq(dates[0]), "from must have 1 element")
  x <- dtt_seq(dates[1], dates[1] - 10L)  
  expect_identical(length(x), 11L)
  expect_identical(x[11], dates[1])
  
  expect_error(dtt_seq(dates[1], dates[1] - 1L, units = "hours"), 
               "units must be 'years', 'months' or 'days'")
  x <- dtt_seq(dates[1], dates[2], units = "years")
  expect_identical(length(x), 102L)
  expect_identical(x[102], dates[1])
  expect_identical(x[1], as.Date("1899-01-01"))
  
  x <- dtt_seq(date_times[1], dates[1] + 1, units = "hours")  
  expect_identical(length(x), 25L)
  expect_identical(x[1], date_times[1])
  
  x <- dtt_seq(dates[1] + 2, date_times[1], units = "days")  
  expect_identical(length(x), 3L)
  expect_identical(x[1], dates[1])
})

test_that("seq works with length_out", {
  x <- dtt_seq(length_out = 10L)
  expect_identical(x, as.Date(paste("2000-01-", 1:10)))
})

