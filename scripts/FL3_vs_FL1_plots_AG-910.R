#getting set up
library(tidyverse)
library(dplyr)
setwd("/Users/rstepanauskas/Projects/\ \ SCGC/\ \ Processing/WGS/2022_assemblies/AG-910")
assembly_stats <- read_csv("AG-910_assembly_stats_updated.csv")

#plot Cp versus assembly completeness

ggplot(data = assembly_stats, aes(x = F_692, y = F_531, size=final_assembly_length, color=-gc_content)) +
  geom_point(alpha = 0.7) +
  scale_color_gradientn(colours = rainbow(3)) +
  xlim(10, 10000) +
  ylim(10, 10000) +
  scale_y_continuous(trans='log10') +
  scale_x_continuous(trans='log10') +
  ggtitle(nth(assembly_stats, 4)) +
  xlab("Fluorescence at 692 nm, relative units") +
  ylab("Fluorescence at 531 nm, relative unit") +
  theme(
    plot.title = element_text(size=12),
    axis.title.x = element_text(size=14, face="bold"),
    axis.title.y = element_text(size=14, face="bold"),
    axis.text.x= element_text(size=14),
    axis.text.y= element_text(size=14)
  )
  
  #save the plot
  
ggsave(width = 7, height = 5, dpi = 300, filename = "FL3_vs_FL1.png")


