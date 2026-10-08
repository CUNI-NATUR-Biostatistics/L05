# Stage 6: release L05-v0.3.1-20261008

- Requester: Ondrej Mottl, 2026-10-08.
- Authorization: "Go one by one and make new Release" for L03-L08; "rerun manually workflows if needed" for successful HUB acceptance. L09 is excluded.
- Target: `L05-v0.3.1-20261008` at merged main commit `81c960ac15d7d5b7be4840e684ac405ea840d53d`.
- No new teaching source edits, commits, branch pushes, PollsLive synchronization, or activation are included in this release operation.

## Pre-publication validation

- Local main is clean for tracked files and matches GitHub main. Packaging uses exact Git bytes from `git -c core.autocrlf=false archive`; no working-copy line-ending conversion enters the bundle.
- The canonical shared Ruby packager validates website-release.yml, including lesson, academic year, file existence and the public allowlist.
- ZIP integrity, exact 10-resource allowlist, source byte identity, sizes and SHA-256 hashes pass; public source/data encoding and credential-marker checks pass.
- The bundle includes the approved exercise and license. Existing complete-exercise independent review, clean-session/reference-harness evidence, and human approval are recorded in the lesson exercise workflow records; unchanged exercises were not retested merely for this release.
- Committed PDFs: 38 learning-material pages and 55 presentation pages. Presentation HTML equals docs/index.html by bytes.
- Retrieval key: `CDA`. Credential-free lesson validator passes. The latest source/render independent-review evidence remains applicable.
- Repository is public. Pages uses Actions. The github-pages environment permits main and the intended lesson tags.
- Evidence directory: `C:\Users\ondre\AppData\Local\Temp\biostat-releases-5f1a5e3f\L05`. Prepared ZIP SHA-256: `7d4787e2f59bd88e160fca400cb3328362a572155f28699b65a2e92c89cba03c`.

## Title and provenance gate

- The title slide has the course logo but lacks the required lesson-derived generated illustration. The requirement and the missing illustration remain recorded.
- Explicit publication exception approved by Ondrej Mottl on 2026-10-08: "yes, you can publish them even though they do not have title ilustration". This authorizes publication of the unchanged reviewed L05-L08 bundles; it does not claim that the illustration requirement has been met.

## Publication and live verification

- Published stable release: https://github.com/CUNI-NATUR-Biostatistics/L05/releases/tag/L05-v0.3.1-20261008. Downloaded public ZIP manifest, allowlist, all resource sizes/hashes, and resolved tag commit match the prepared exact-main bundle.
- Independently verified 20 live resource hashes across stable and immutable routes:
  - https://cuni-natur-biostatistics.github.io/L05/current/
  - https://cuni-natur-biostatistics.github.io/L05/releases/L05-v0.3.1-20261008/
- HUB at https://cuni-natur-biostatistics.github.io/materialy.html independently shows `L05-v0.3.1-20261008` and 10 stable resource links. No lesson preview route is presented as stable.
- Release workflow: https://github.com/CUNI-NATUR-Biostatistics/L05/actions/runs/37819843827; failure: release successful; stale Pages verification failed; HUB notification skipped.
- Fresh Pages recovery: https://github.com/CUNI-NATUR-Biostatistics/L05/actions/runs/37820468496; success.
- HUB workflow: https://github.com/CUNI-NATUR-Biostatistics/CUNI-NATUR-Biostatistics.github.io/actions/runs/37820691102; success.

## Remaining limits

- Offline quiz rendering does not prove live PollsLive synchronization, scheduled opening or activation. Those operations are separate and were not performed.
- Existing pedagogical/layout limitations remain in the latest lesson review records; publication does not erase them.
- The shared tag-triggered stale Pages defect remains an infrastructure follow-up if encountered. Recovery uses a fresh supported workflow, not repeated reruns of a contaminated artifact run.
- This local Stage 6 record is excluded from the public allowlist and remains uncommitted for the repository owner.
