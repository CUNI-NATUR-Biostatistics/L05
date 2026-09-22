# Stage 6: L05 exercise release readiness

## Release target

- Prepared on 2026-09-22 after exercise PR #8 merged into main.
- Target tag: L05-v0.2.0-20260922, without a Moodle ZIP.
- Source: the merged main commit after the focused README release fix.
- Previous stable release: L05-v0.1.0-20260918.
- Stable routes after publication: /L05/current/ and /L05/releases/L05-v0.2.0-20260922/.
- The shared release workflow creates the GitHub Release, deploys Pages, and attempts an immediate HUB refresh when its GitHub App secrets are configured. If notification is skipped, report the missing HUB refresh rather than dispatching it without authorization.

## Bundle and public boundary

- The release manifest includes approved learning and presentation HTML, PDF, and QMD sources; the completed exercise script; the 13-site means and individual-crab CSVs; and LICENSE.md.
- The practical uses site means for inference. Individual-crab data serve only the optional observational-unit exercise.
- The teaching CSVs derive from the documented CC0 lterdatasampler sample. LICENSE.md preserves the CC BY 4.0 educational-content / MIT software split and excludes third-party materials from those licenses.
- The public README now gives direct stable links to the practical script and both teaching CSVs. It distinguishes current stable materials from main and preview.

## Pre-tag validation

- Exercise PR #8 merged at commit d02d6df1b3b49a62aca7497d865cd17af21cb665. The exercise had human approval and independent read-only review with no findings.
- The canonical release packager built a temporary L05-v0.2.0-20260922 bundle from a working tree identical to merged main at that point. All 10 bundle entries existed and their SHA-256 checksums passed. Rerun the packager after the README fix merges, before tagging.
- L05 is public. GitHub Pages uses GitHub Actions, and the github-pages environment permits main and L05-v* tags.
- Learning and presentation HTML/PDF were already committed and reviewed in the earlier release; this focused fix does not change those artifacts.
- The 68-minute practical route remains an author estimate and has not been timed with beginners.

## Post-tag checks

- Confirm the tag points to the focused release-fix merge commit and the GitHub Actions release, Pages, and optional HUB-notification jobs complete.
- Check the GitHub Release contains web-materials-L05-v0.2.0-20260922.zip.
- Check /L05/current/code/cviceni.R and /L05/current/data/pie_crab_site_means.csv return the released files, and the immutable release route exposes the same files.
- Confirm the current alias selects L05-v0.2.0-20260922 and note whether the HUB refreshed.
