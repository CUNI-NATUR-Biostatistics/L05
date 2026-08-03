#----------------------------------------------------------#
#
#
#                          L05
#
#                 Prepare fiddler-crab data
#
#                     O. Mottl
#                       2026
#
#----------------------------------------------------------#

# Source and output paths -----

source_url <-
  paste0(
    "https://raw.githubusercontent.com/",
    "lter/lterdatasampler/main/data/pie_crab.rda"
  )

expected_md5 <- "3fecbcfff31f7fe0c56e2bcf65b0cc0b"

path_source <-
  here::here("Temp", "pie_crab.rda")

path_crabs <-
  here::here("data", "pie_crab.csv")

path_sites <-
  here::here("data", "pie_crab_site_means.csv")


# Acquire and verify the official teaching sample -----

dir.create(
  path = dirname(path_source),
  recursive = TRUE,
  showWarnings = FALSE
)

download.file(
  url = source_url,
  destfile = path_source,
  mode = "wb",
  quiet = TRUE
)

observed_md5 <-
  unname(tools::md5sum(path_source))

if (!identical(observed_md5, expected_md5)) {
  cli::cli_abort(
    c(
      "Downloaded pie_crab.rda does not match the reviewed source file.",
      "i" = "Expected MD5: {expected_md5}",
      "i" = "Observed MD5: {observed_md5}"
    )
  )
}

load(path_source)


# Prepare transparent Czech teaching tables -----

data_krabi <-
  pie_crab |>
  dplyr::transmute(
    datum = date,
    zemepisna_sirka = latitude,
    kod_lokality = site,
    nazev_lokality = name,
    sirka_krunyre_mm = size
  )

data_lokality <-
  data_krabi |>
  dplyr::group_by(
    kod_lokality,
    nazev_lokality,
    zemepisna_sirka
  ) |>
  dplyr::summarise(
    pocet_krabu = dplyr::n(),
    prumerna_sirka_mm = mean(sirka_krunyre_mm),
    .groups = "drop"
  ) |>
  dplyr::arrange(zemepisna_sirka)


# Validate and save -----

if (nrow(data_krabi) != 392L) {
  cli::cli_abort("Expected 392 individual crabs.")
}

if (nrow(data_lokality) != 13L) {
  cli::cli_abort("Expected 13 site-level summaries.")
}

readr::write_csv(
  x = data_krabi,
  file = path_crabs
)

readr::write_csv(
  x = data_lokality,
  file = path_sites
)
