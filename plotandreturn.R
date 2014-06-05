plot.and.return <- function(
  f,             # density function
  min.x,         # graph visible region
  max.x,  
  a, b,          # integral bounds
  dx = 0.01,     # optional step size
  ...            # additional plot parameters
) {
  x <- seq(min.x, max.x, by = dx)
  d <- seq(a, b, by = dx)
  plot(x, f(x), type = "l", ...)
  polygon(
    c(a, d, d[length(d)]), c(0, f(d), 0), 
    col = "blue",
    border = NA,
    lty = 1,
    angle = 45,
    density = 20
  )
  lines(c(a, a), c(0, f(a)), lwd = 2, lty = 2, col = "blue")
  lines(c(b, b), c(0, f(b)), lwd = 2, lty = 2, col = "blue")
  integrate(f, a, b, subdivisions = round((b - a) / dx))
}