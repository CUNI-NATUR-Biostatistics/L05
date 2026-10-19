#----------------------------------------------------------#
#
#
#             CUNI-NATUR-Biostatistics L05
#
#          Render PollsLive retrieval evidence
#               - the quiz retrieves L04
#
#                    Ondřej Mottl
#                        2026
#
#----------------------------------------------------------#

# Reproducible source of the evidence images. Local PollsLive preparation
#   runs R/verify_pollslive_assets.R, which checks the approved bytes.

here::i_am("R/render_pollslive_assets.R")

source(here::here("R", "set_r_theme.R"))
# Pixel canvases use 150 DPI; match showtext font metrics to the save device.
showtext::showtext_opts(dpi = 150)

path_assets <-
  here::here("pollslive", "assets")

path_source <-
  here::here("pollslive", "source", "old_faithful_2024.csv")

path_l04_band_figure <-
  here::here(
    "..", "L04", "Presentation", "Materials", "pas_spolehlivosti.png"
  )

save_asset <- function(plot, filename, height) {
  plot_canvas <-
    plot +
    ggview::canvas(
      width = 1600,
      height = height,
      units = "px",
      dpi = 150
    )

  res_file <-
    ggview::save_ggplot(
      plot = plot_canvas,
      file = here::here(path_assets, filename)
    )

  return(invisible(res_file))
}

theme_card <-
  ggplot2::theme_void() +
  ggplot2::theme(
    plot.background = ggplot2::element_rect(
      fill = biostat_cols[["white"]],
      colour = NA
    )
  )


#----------------------------------------------------------#
# 1. Fit the L04 models -----
#----------------------------------------------------------#

stopifnot(
  identical(
    digest::digest(file = path_source, algo = "sha256"),
    "6ed35a5adbe56e575a48baee84bc4d939be5339765751f81e174e7d007a0f9f3"
  )
)

data_gejzir <-
  utils::read.csv(file = path_source)

data_gejzir[["delka_erupce_min"]] <- data_gejzir[["duration"]] / 60

# Pepa's sample is June only, as in the L04 learning materials.
data_pepa <-
  data_gejzir[
    base::format(x = base::as.Date(data_gejzir[["date"]]), format = "%m") ==
      "06",
  ]

mod_gejzir <-
  stats::lm(
    formula = cekani_min ~ delka_erupce_min,
    data = data_gejzir
  )

mod_pepa <-
  stats::lm(
    formula = cekani_min ~ delka_erupce_min,
    data = data_pepa
  )

mat_coef_gejzir <-
  base::round(stats::coef(base::summary(mod_gejzir))[, 1:2], 2)

mat_coef_pepa <-
  base::round(stats::coef(base::summary(mod_pepa))[, 1:2], 2)

stopifnot(
  base::nrow(data_gejzir) == 117L,
  base::nrow(data_pepa) == 39L,
  mat_coef_gejzir["delka_erupce_min", "Estimate"] == 13.34,
  mat_coef_gejzir["delka_erupce_min", "Std. Error"] == 0.66,
  mat_coef_gejzir["(Intercept)", "Std. Error"] == 2.47,
  mat_coef_pepa["delka_erupce_min", "Estimate"] == 12.92,
  mat_coef_pepa["delka_erupce_min", "Std. Error"] == 1.12
)


#----------------------------------------------------------#
# 2. Q1: estimates and standard errors as printed by R -----
#----------------------------------------------------------#

vec_coef_lines <-
  utils::capture.output(base::print(mat_coef_gejzir))

plot_coef <-
  ggplot2::ggplot() +
  ggplot2::coord_cartesian(
    xlim = c(0, 1),
    ylim = c(0, 1)
  ) +
  theme_card +
  ggplot2::annotate(
    geom = "text",
    x = 0.06,
    y = 0.8,
    label = "> round(coef(summary(mod_gejzir))[, 1:2], 2)",
    hjust = 0,
    family = biostat_mono_font,
    size = 9,
    colour = biostat_cols[["grey_olive"]]
  ) +
  ggplot2::annotate(
    geom = "text",
    x = 0.06,
    y = c(0.58, 0.4, 0.22),
    label = vec_coef_lines,
    hjust = 0,
    family = biostat_mono_font,
    size = 9,
    colour = biostat_cols[["graphite"]]
  )

save_asset(
  plot = plot_coef,
  filename = "l04-odhad-a-se.png",
  height = 500
)


#----------------------------------------------------------#
# 3. Q2: Pepa's June sample against all eruptions -----
#----------------------------------------------------------#

format_cz_2 <- function(x) {
  res_text <-
    base::formatC(
      x,
      format = "f",
      digits = 2,
      decimal.mark = ","
    )

  return(res_text)
}

data_tabulka <-
  data.frame(
    radek = c(2, 1),
    vyber = c(
      "Pepa: červen, 39 erupcí",
      "Celý soubor: 117 erupcí"
    ),
    estimate = format_cz_2(
      c(
        mat_coef_pepa["delka_erupce_min", "Estimate"],
        mat_coef_gejzir["delka_erupce_min", "Estimate"]
      )
    ),
    std_error = format_cz_2(
      c(
        mat_coef_pepa["delka_erupce_min", "Std. Error"],
        mat_coef_gejzir["delka_erupce_min", "Std. Error"]
      )
    )
  )

plot_dva_vybery <-
  ggplot2::ggplot(data = data_tabulka) +
  ggplot2::coord_cartesian(
    xlim = c(0, 1),
    ylim = c(0.4, 3.6)
  ) +
  theme_card +
  ggplot2::annotate(
    geom = "text",
    x = c(0.05, 0.62, 0.86),
    y = 3,
    label = c("Sklon delka_erupce_min", "Estimate", "Std. Error"),
    hjust = c(0, 0.5, 0.5),
    family = biostat_base_font,
    fontface = "bold",
    size = 8,
    colour = biostat_cols[["indigo_velvet"]]
  ) +
  ggplot2::geom_text(
    mapping = ggplot2::aes(
      x = 0.05,
      y = radek,
      label = vyber
    ),
    hjust = 0,
    family = biostat_base_font,
    size = 8,
    colour = biostat_cols[["graphite"]]
  ) +
  ggplot2::geom_text(
    mapping = ggplot2::aes(
      x = 0.62,
      y = radek,
      label = estimate
    ),
    family = biostat_mono_font,
    size = 8,
    colour = biostat_cols[["graphite"]]
  ) +
  ggplot2::geom_text(
    mapping = ggplot2::aes(
      x = 0.86,
      y = radek,
      label = std_error
    ),
    family = biostat_mono_font,
    size = 8,
    colour = biostat_cols[["graphite"]]
  )

save_asset(
  plot = plot_dva_vybery,
  filename = "l04-dva-vybery.png",
  height = 450
)


#----------------------------------------------------------#
# 4. Q3: the familiar L04 confidence band -----
#----------------------------------------------------------#

# The familiar L04 figure is copied byte for byte; its checksum is pinned
#   in R/verify_pollslive_assets.R.
if (
  base::file.exists(path_l04_band_figure)
) {
  res_copy <-
    base::file.copy(
      from = path_l04_band_figure,
      to = here::here(path_assets, "l04-pas-spolehlivosti.png"),
      overwrite = TRUE
    )
}
