#----------------------------------------------------------#
# Verify approved local evidence for the L05 retrieval quiz
#----------------------------------------------------------#

library(here)

here::i_am("R/verify_pollslive_assets.R")

# These images are reviewed teaching inputs. Re-rendering them can change their
# bytes across R sessions and therefore makes immutable synchronization
# unreliable. R/render_pollslive_assets.R stays as their reproducible source;
# local PollsLive preparation verifies the approved bytes instead.
approved_assets <-
  c(
    "l04-one-hundred-estimates.png" =
      "36575e899ae4d2d030f72a74834849118a1b105e5a4d4cbc30bee2abcd5fd301",
    "l04-estimate-standard-error.png" =
      "cb27f7d879b3bbcafcbb558868c6f19398a8e1145346476d643656fbc7c055c3",
    "l04-confidence-interval-coverage.png" =
      "ff6f5a6c21e6d657b27b74f7f0eb7031519872f2565b54b5b597a040bc5eecc8"
  )

asset_paths <-
  here::here("pollslive", "assets", names(approved_assets))

missing_assets <-
  names(approved_assets)[!file.exists(asset_paths)]

if (length(missing_assets) > 0L) {
  stop(
    "Missing approved PollsLive evidence assets: ",
    paste(missing_assets, collapse = ", ")
  )
}

actual_checksums <-
  unname(
    vapply(
      asset_paths,
      digest::digest,
      character(1),
      algo = "sha256",
      file = TRUE
    )
  )

changed_assets <-
  names(approved_assets)[actual_checksums != unname(approved_assets)]

if (length(changed_assets) > 0L) {
  stop(
    "Approved PollsLive evidence assets changed: ",
    paste(changed_assets, collapse = ", ")
  )
}
