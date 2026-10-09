# CUNI-NATUR-Biostatistics L05 — Czech explanatory numbers, 2026.
# Format numbers -----
# Raw R output is unchanged.
format_cz <- function(x, digits = 2, nsmall = digits) {
  format(
    x = round(x = x, digits = digits),
    nsmall = nsmall,
    trim = TRUE,
    decimal.mark = ",",
    scientific = FALSE
  )
}
