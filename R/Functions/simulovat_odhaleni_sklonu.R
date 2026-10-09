# CUNI-NATUR-Biostatistics L05 — illustrative power simulation, 2026.
# Simulate slope detection -----
# Repeats the same study design with a chosen true slope and returns one
#   logical value per simulated study: TRUE when the zero slope is rejected
#   at the chosen alpha.
simulovat_odhaleni_sklonu <- function(vec_zemepisna_sirka,
                                      stredni_velikost,
                                      skutecny_sklon,
                                      rezidualni_sd,
                                      pocet_simulaci,
                                      alfa) {
  stredni_sirka <- mean(vec_zemepisna_sirka)

  res <-
    replicate(
      n = pocet_simulaci,
      expr = {
        # Systematic part with the chosen true slope
        simulovana_velikost <-
          stredni_velikost +
          skutecny_sklon * (vec_zemepisna_sirka - stredni_sirka) +
          # Random part uses the residual SD of the crab model
          stats::rnorm(
            n = length(vec_zemepisna_sirka),
            mean = 0,
            sd = rezidualni_sd
          )

        mod_sila <-
          stats::lm(formula = simulovana_velikost ~ vec_zemepisna_sirka)

        stats::coef(summary(mod_sila))[
          "vec_zemepisna_sirka",
          "Pr(>|t|)"
        ] < alfa
      }
    )

  return(res)
}
