context("internal")

test_that("units_less_than", {
  expect_true(units_less_than("seconds", "minutes"))
  expect_false(units_less_than("years", "months"))
  expect_identical(units_less_than("hours",  c("seconds", "minutes", "hours", "days", "months", "years")),
                   c(FALSE, FALSE, FALSE, TRUE, TRUE, TRUE))  
})

test_that("units2by", {
  expect_identical(dtt_units2by(c("seconds", "minutes", "hours", "days", "months", "years")),
                   c("secs", "mins", "hours", "days", "months", "years"))
})
