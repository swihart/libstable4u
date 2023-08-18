# libstable4u R package
Bruce Swihart  
Aug 2023


## Submission 6

   * I tried to contact maintainer for libstableR after its archival.  I did not reach him.  I think this package is important to have on CRAN and I do have a CRAN package 'mvpd' that depends on it as well as a few more developmental packages I'd like to get onto CRAN that depend on it.  So, I have decided to submit my own copy and name it `libstable4u`.  I downloaded the archived `libstableR` and the offending R check output and have fixed the offending issues.

  * from libstableR: eliminated sprintf from src/stable_integration.c
  * from libstableR: corrected the 28 ` [-Wstrict-prototypes]` warnings
  
  * Corrected formats as suggeted by V. Wimmer (with thanks!)
  * No more instances of donttest or dontrun in any .Rd file; quicker examples;

## Test environments
* local OS X install: R version 4.2.2 (2022-10-31)
    * Platform: x86_64-apple-darwin17.0 (64-bit)
    * Running under: macOS Big Sur 11.2.3
* rhub::check(platforms=c("debian-clang-devel",
                          "fedora-clang-devel",
                          "windows-x86_64-devel"))
* winbuildr dev and release
* https://mac.r-project.org/macbuilder/results/1691418759-edb3af4a6e95dd3e/

                     
## R CMD check results
There were no ERRORs or WARNINGs or NOTEs.


## Downstream dependencies
There are currently no downstream dependencies for this package.

