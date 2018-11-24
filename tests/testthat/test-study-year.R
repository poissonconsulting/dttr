context("study-year")

test_that("dtt_study_year works",{
  expect_identical(dtt_study_year(as.Date("2005-04-03")), "2005-2005")
  expect_identical(
    dtt_study_year(as.Date(c("2000-03-31", "2000-04-01", "2001-04-01")), start_month = 4L), 
    c("1999-2000", "2000-2001", "2001-2002"))
})
