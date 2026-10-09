# Stage 6: release L05-v0.4.0-20261009

- Requester: Ondřej Mottl, 2026-10-09.
- Authorization: "merged, please make a new Release" after merging L05 PR #12. This authorizes the new stable release from merged main; no additional lesson commit, branch push, PollsLive activation or manual HUB/Pages recovery is included.
- Target: `L05-v0.4.0-20261009` at merged main commit `1d6c9014d304e13aeab58ba5fa813521d98c1311`.
- Previous stable release: `L05-v0.3.1-20261008`.

## Pre-publication validation

- GitHub main equals the PR #12 merge commit; the merged tree equals the validated polish/render head `3b94c67`. Main's PollsLive validation and preview deployment both passed. The release is prepared from an isolated exact-main export; the clean local polish branch is preserved.
- Exact source bytes come from `git -c core.autocrlf=false archive`, and the canonical Ruby packager validates `website-release.yml`. ZIP integrity, the exact 10-resource public allowlist, tagged-source byte identity, resource sizes and SHA-256 hashes pass.
- The public bundle includes the complete exercise, both crab datasets and `LICENSE.md`. Source, exercise, CSV and license UTF-8/credential-marker checks pass; the exercise contains no authoring TODO or placeholder. Prior complete-script independent review, clean-session/reference-harness validation and owner decisions are recorded in `2026-10-09-review-polish.md`; students still load the data and fit the model themselves.
- The required lesson-derived title composite and all five in-deck illustrations are embedded byte-for-byte in the self-contained HTML. Provenance, reference assets, reuse terms, alt text and AI disclosures are recorded in `Presentation/Materials/GENERATED_IMAGES.md`. The title and reality-slide layout were visually checked in the final HTML/PDF during synchronized rendering. The old missing-title exception is not needed for this release.
- Committed PDFs have 41 learning-material pages and 57 presentation pages; synchronized live HTML has 58 slides. Presentation HTML equals `docs/index.html` by bytes. Illustrated PDF slides retain their images and visible disclosures; the static PDF contains no PollsLive URL. The lesson quiz validator passes against the exact-main export.
- Repository visibility is public; Pages uses GitHub Actions; the `github-pages` environment permits `main` and `L05-v*`. README student links use stable routes. CC BY 4.0 educational-content / MIT software terms and third-party exclusions are preserved.
- Prepared ZIP: `Temp/release-L05-v0.4.0-20261009/dist/web-materials-L05-v0.4.0-20261009.zip`; SHA-256: `454d12659c31325c33defe54f65588c567e9835d4e96ce73a779358f77082bd5`. Expected manifest and validation report are saved in the same ignored release directory.

## Publication and live verification

- Published stable release: https://github.com/CUNI-NATUR-Biostatistics/L05/releases/tag/L05-v0.4.0-20261009. The remote tag resolves to merged main `1d6c9014d304e13aeab58ba5fa813521d98c1311`; the release is neither a draft nor a prerelease.
- The automatic release job rebuilt the ZIP on Linux and replaced the initial upload. Downloaded final ZIP SHA-256: `ee422d30e1accfe7f39c1ba347a0247d77f840c99e29ced49521eeb8c88822ff`. ZIP integrity, the entire public manifest, all 10 resource sizes and SHA-256 hashes match the prepared exact-main bundle. The ZIP container differs from the locally prepared ZIP; released resource bytes are identical.
- Release workflow https://github.com/CUNI-NATUR-Biostatistics/L05/actions/runs/37920374981 completed with the release job successful, Pages verification failed after automatic redeployment, and `notify-hub` skipped. Both deployment steps reported success, but the expected deployment-check URLs continued returning HTTP 404 through all 12 final verification attempts.
- Independent checks after the failed automatic deployment confirmed `/L05/current/manifest.json` still selected `L05-v0.3.1-20261008`, the new immutable manifest returned HTTP 404, and the rendered HUB at https://cuni-natur-biostatistics.github.io/materialy.html did not show `L05-v0.4.0-20261009`. The authorized recovery below resolved these publication gaps.
- Expected stable route: https://cuni-natur-biostatistics.github.io/L05/current/.
- Expected immutable route: https://cuni-natur-biostatistics.github.io/L05/releases/L05-v0.4.0-20261009/.
- Recovery prepared for owner authorization: dispatch L05 `preview.yml` from `main` to deploy a fresh Pages artifact, verify stable and immutable manifests plus every resource hash, then dispatch the HUB `publish.yml` from `main` if its automatic update remains absent. No manual recovery workflow was dispatched under the release-only authorization.

## Authorized Pages and HUB recovery

- Ondřej Mottl explicitly approved the proposed two-step recovery on 2026-10-09 ("yes"): dispatch L05 `preview.yml`, then the HUB `publish.yml` if needed.
- Fresh L05 Pages workflow https://github.com/CUNI-NATUR-Biostatistics/L05/actions/runs/37921236700 succeeded from main `1d6c9014d304e13aeab58ba5fa813521d98c1311`. No rerun of the failed tag workflow was used.
- Independently verified that the stable and immutable manifests exactly match the release ZIP, and all 20 public resource hashes and byte counts pass across both routes. Evidence: ignored `Temp/release-L05-v0.4.0-20261009/public-pages-validation.json`.
- The rendered HUB still lacked the new tag after Pages recovery, so the authorized HUB `publish.yml` was dispatched from main. Run https://github.com/CUNI-NATUR-Biostatistics/CUNI-NATUR-Biostatistics.github.io/actions/runs/37921480234 succeeded. Independent verification of https://cuni-natur-biostatistics.github.io/materialy.html confirms `L05-v0.4.0-20261009` and all 10 required stable resource links, with no L05 preview links. Evidence: ignored `Temp/release-L05-v0.4.0-20261009/public-hub-validation.json` and `rendered-hub.html`.
- Final release acceptance: published ZIP, stable lesson route, immutable release route, and rendered HUB all pass independent verification. The release asset and both manifests match the exact merged-main bundle; all required public resource hashes and sizes match. Consolidated evidence is in ignored `Temp/release-L05-v0.4.0-20261009/public-release-acceptance.json`. This publication verification does not erase the remaining teaching/provenance limits below.

## Remaining limits

- Four glossary TODO terms still lack canonical slugs. L06 quiz re-approval and re-synchronization remain outside this L05 release.
- Earlier independent reviews and resolved findings are recorded; a final review-ready verdict is not recorded. The owner merged the final polish and explicitly requested its release. Publication preserves this review-history limitation rather than retroactively rewriting it.
- Original generation tool/date are unknown for the retained Type I/II mnemonic images; the provenance record states this uncertainty. Third-party media remain governed by their item-level terms.
- This local release-validation record is excluded from the public allowlist and remains uncommitted for the repository owner.
