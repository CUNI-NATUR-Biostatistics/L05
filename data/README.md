# L05 fiddler-crab teaching data

`pie_crab.csv` and `pie_crab_site_means.csv` are prepared from the official `lterdatasampler::pie_crab` teaching sample.

- Teaching source: <https://lter.github.io/lterdatasampler/articles/pie_crab_vignette.html>
- Source file: <https://raw.githubusercontent.com/lter/lterdatasampler/main/data/pie_crab.rda>
- Original EDI dataset: <https://doi.org/10.6073/pasta/4c27d2e778d3325d3830a5142e3839bb>
- Associated study: <https://doi.org/10.1002/ece3.5883>
- License record: <https://github.com/lter/lterdatasampler/blob/main/DESCRIPTION>
- Reuse: the package license record declares the teaching samples as CC0.
- Reviewed source-file MD5: `3fecbcfff31f7fe0c56e2bcf65b0cc0b`

Run `Rscript R/prepare_crab_data.R` from the repository root to download, verify, and recreate both CSV files. The main inferential table has one row per sampled salt-marsh site; the individual table is retained only to show the aggregation and observational-unit decision.
