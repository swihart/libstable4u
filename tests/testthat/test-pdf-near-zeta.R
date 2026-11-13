context("PDF next to zeta = -beta * tan(pi * alpha / 2)")

# For 1e-5 < |x - zeta| < ~5e-5 (alpha >= 1.5) the integral representation is tiny
# (about |x - zeta| * pdf(zeta) / c2) and used to be accepted at the first coarse
# estimate because it fell below the absolute tolerance. The pdf came out about half
# of its value, as a spike in an otherwise smooth density.

test_that("pdf is smooth across zeta (no stabledist needed)", {
  for (alpha in c(1.3, 1.5, 1.75, 1.95)) for (beta in c(-0.9, -0.3, 0.3, 0.9)) {
    pars <- c(alpha, beta, 1, 0)
    zeta <- -beta * tan(pi * alpha / 2)
    d    <- c(1e-6, 5e-6, 1e-5, 1.5e-5, 2e-5, 3e-5, 5e-5, 1e-4)
    f0   <- stable_pdf(zeta, pars, 0L)
    for (s in c(-1, 1)) {
      f <- stable_pdf(zeta + s * d, pars, 0L)
      # the density is analytic at zeta: a change of 1e-4 in x moves it by < 1%
      expect_true(all(abs(f / f0 - 1) < 0.01),
                  info = sprintf("alpha=%g beta=%g side=%+d", alpha, beta, s))
    }
  }
})

test_that("pdf next to zeta agrees with stabledist", {
  skip_if_not_installed("stabledist")
  for (alpha in c(1.3, 1.5, 1.75, 1.95)) for (beta in c(-0.9, -0.3, 0.3, 0.9)) {
    zeta <- -beta * tan(pi * alpha / 2)
    x <- zeta + c(-1, 1) * rep(c(2e-6, 1e-5, 1.2e-5, 2e-5, 3e-5, 4e-5, 1e-4, 1e-3), each = 2)
    expect_equal(stable_pdf(x, c(alpha, beta, 1, 0), 0L),
                 stabledist::dstable(x, alpha, beta, 1, 0, pm = 0), tolerance = 1e-4)
  }
})
