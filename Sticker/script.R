
library(Superpower)
library(reshape2)
library(tidyverse)
library(hexSticker)
library(showtext)

## Loading Google fonts (http://www.google.com/fonts)
#font_add_google("Supermercado One", "supermercado")
#font_add_google("Modak", "modak")
#font_add_google("Play", "play")

font_add("marvel", "Sticker/Marvel-Regular.ttf")
font_add("avenger", "Sticker/AVENGEANCE.ttf")
font_add("justice", "Sticker/justiceleague.ttf")

## Automatically use showtext to render text for future devices
showtext_auto()

sticker_design <- ANOVA_design("2b", n = 30,
                               sd = 1,
                               mu = c(0,.55),
                               plot = FALSE)

power_sticker <- ANOVA_power(sticker_design,
                             verbose = FALSE,
                             nsims = 20000)


plotData <- power_sticker$sim_data %>% filter(anova_a < .5)
#power_sticker2 = ggplot(power_sticker$sim_data, aes(x = anova_a)) +
 # scale_x_continuous("", limits=c(0,.5)) + #expand = c(0, 0),
#  scale_y_continuous("",limits=c(0,10.5)) +
# annotate('text', x = 0.25, y = 9.5,
#           label = "1-beta ",
#           parse = TRUE,size=20,
#           color = "white") +
#  geom_density() +
#  geom_segment(aes(x=.05,xend=.05,y=0,yend=8.9), color = "chocolate1") +
  #labs(title = "1 - \U03B2") +
#  theme_void() + 
#  theme_transparent() +
#  theme(
#    strip.background = element_blank(),
#    strip.text.y = element_blank(),
#    axis.text.x = element_blank(),
#    axis.text.y = element_blank(),
#    axis.ticks = element_blank(),
#    text=element_text(family = "play")
#  ) 

power_sticker2 = ggplot(plotData, aes(x = anova_a)) +
  scale_x_continuous("", limits = c(0,.5)) + #expand = c(0, 0),
  scale_y_continuous("") +
  geom_density() +
  geom_segment(aes(x = .05,xend = .05,y = 0,yend = 15.5), color = "#FFFF00") +
  #labs(title = "Marvel") +
  theme_void() + 
  theme_transparent() +
  theme(
    strip.background = element_blank(),
    strip.text.y = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks = element_blank(),
    text = element_text()
  ) 


#plot.title = element_text(size = 65, 
#                          hjust = .5,
#                          color = "white",
#                          margin=margin(0,0,0,0)),


#Plot p-value dist


#power_sticker2 <- power_sticker$plot1
#power_sticker2 <- power_sticker2 + 
#  scale_x_continuous("",expand = c(0, 0)) +
#  scale_y_continuous("",expand = c(0, 0)) +
#  annotate('text', x = 0.5, y = 75,
#           label = "1~-~beta ",
#           parse = TRUE,size=20) +
#  theme(strip.background = element_blank(),
#        strip.text.y = element_blank(),
#        axis.text.x = element_blank(),
#        axis.text.y = element_blank(),
#        axis.ticks = element_blank()) + 
  #theme_void() + 
#  theme_transparent()




sticker(
  power_sticker2,
  package = "Superpower",
  p_family = "justice",
  p_size = 24,
  s_x = .99,
  s_y = .80,
  s_width = .9,
  s_height = .9,
  h_color = "#FF0000",
  h_fill = "#3366CC"#, #blue4 #chocolate1, #CC0000
  #filename = "baseplot.png"
)

sticker(
  power_sticker2,
  package = "",
  p_family = "justice",
  p_size = 24,
  s_x = .99,
  s_y = .75,
  s_width = .9,
  s_height = .9,
  h_color = "#FF0000",
  h_fill = "blue2"#, #blue4 #chocolate1, #CC0000
  #filename = "baseplot.png"
)
