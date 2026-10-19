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
    "l04-odhad-a-se.png" =
      "5968c909677c89e996b74bbd9981aa70030b49aae9bb12e94384a8f507a0dd5c",
    "l04-dva-vybery.png" =
      "894a9d5021a4c6308b4c69c67c229ef4534d67c34b9e101a778374c6702e3e62",
    # Byte-identical copy of L04 Presentation/Materials/
    #   pas_spolehlivosti.png
    "l04-pas-spolehlivosti.png" =
      "4c6aa5a520629f857241c813bdf7a03f9b70beaec3aaa631ac2edf124f7c489f"
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
