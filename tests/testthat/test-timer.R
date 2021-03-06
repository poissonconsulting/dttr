context("timer")

test_that("",{
  t <- dtt_timer(3L)
  expect_identical(check_timer(t), t)
  expect_identical(format(t), "3s")
  expect_false(dtt_is_running(t))
  t2 <- dtt_start(t)
  expect_true(dtt_is_running(t2))
  expect_identical(check_timer(t2), t2)
  expect_gte(dtt_elapsed(t2), dtt_elapsed(t))
  expect_warning(dtt_start(t2), "dtt_timer is already started")
  t2 <- dtt_stop(t2)
  expect_warning(dtt_stop(t), "dtt_timer is already stopped")
  expect_identical(check_timer(t2), t2)
  expect_false(dtt_is_running(t2))
  t2 <- dtt_reset(t2, 2L)
  expect_identical(format(t), "3s")
  expect_identical(format(t2), "2s")
})
