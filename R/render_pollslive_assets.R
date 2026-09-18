library(grid)
library(digest)
library(here)
here::i_am("R/render_pollslive_assets.R")
output_dir <- here::here("pollslive", "assets")
dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)
colours <- c(parchment="#F4F1EC", graphite="#2E2E2E", olive="#8A8A8A", indigo="#5D2890", orange="#F3A712", white="#FFFFFF", light="#F0EDE8")
open_card <- function(filename) {
  grDevices::png(here::here(output_dir, filename), width=1600, height=900, res=160, type="cairo", bg=colours[["parchment"]])
  grid.newpage()
}
close_card <- function() grDevices::dev.off()
draw_title <- function(text) grid.text(text, x=unit(0.07,"npc"), y=unit(0.88,"npc"), just="left", gp=gpar(col=colours[["indigo"]], fontsize=34, fontface="bold"))
draw_panel <- function(y=0.48, height=0.48) grid.roundrect(x=0.5,y=y,width=0.86,height=height,r=unit(0.025,"npc"),gp=gpar(fill=colours[["white"]],col=colours[["light"]],lwd=2))

source_path <- here::here("pollslive","source","old_faithful_2024.csv")
stopifnot(identical(digest(file=source_path,algo="sha256"),"6ed35a5adbe56e575a48baee84bc4d939be5339765751f81e174e7d007a0f9f3"))
data_gejzir <- read.csv(source_path, stringsAsFactors=FALSE)
data_gejzir$delka_erupce_min <- data_gejzir$duration/60
mod_gejzir <- lm(cekani_min ~ delka_erupce_min, data=data_gejzir)
summary_row <- summary(mod_gejzir)$coefficients["delka_erupce_min",]
stopifnot(abs(unname(summary_row[["Estimate"]])-13.34)<0.01, abs(unname(summary_row[["Std. Error"]])-0.66)<0.01)
open_card("l04-estimate-standard-error.png")
draw_title("Řádek sklonu z modelu")
draw_panel(y=0.53,height=0.34)
grid.rect(x=0.5,y=0.61,width=0.82,height=0.12,gp=gpar(fill=colours[["indigo"]],col=NA))
xs <- c(0.19,0.50,0.77)
for (i in seq_along(xs)) grid.text(c("Parametr","Estimate","Std. Error")[[i]],x=unit(xs[[i]],"npc"),y=unit(0.61,"npc"),gp=gpar(col="white",fontsize=24,fontface="bold"))
grid.text("delka_erupce_min",x=unit(xs[[1]],"npc"),y=unit(0.46,"npc"),gp=gpar(col=colours[["graphite"]],fontsize=22,fontfamily="mono"))
grid.text(formatC(summary_row[["Estimate"]],format="f",digits=2,decimal.mark=","),x=unit(xs[[2]],"npc"),y=unit(0.46,"npc"),gp=gpar(col=colours[["indigo"]],fontsize=29,fontface="bold"))
grid.text(formatC(summary_row[["Std. Error"]],format="f",digits=2,decimal.mark=","),x=unit(xs[[3]],"npc"),y=unit(0.46,"npc"),gp=gpar(col=colours[["orange"]],fontsize=29,fontface="bold"))
close_card()
expected <- c("l04-one-hundred-estimates.png"="36575e899ae4d2d030f72a74834849118a1b105e5a4d4cbc30bee2abcd5fd301","l04-confidence-interval-coverage.png"="ff6f5a6c21e6d657b27b74f7f0eb7031519872f2565b54b5b597a040bc5eecc8")
for(filename in names(expected)){path<-here::here(output_dir,filename);stopifnot(file.exists(path),identical(digest(file=path,algo="sha256"),unname(expected[[filename]])))}
