# Visualization Parameters


# General Parameters: Sizes etc.
plot_config = theme_bw() + # background
              theme(
                  panel.grid.major = element_blank(), # background
                  panel.grid.minor = element_blank(), # background
                  panel.background = element_blank(), # background
                  panel.border = element_blank(),
                  axis.line = element_line(colour = "black", size = 1), # background
                
                  
                  # general text
                  text = element_text(family = "sans" ,face = "bold", colour = "black" ,  size = 8) ,# general text size
                  
                  # title text
                  plot.title = element_text(family ="sans" ,face = "bold", colour = "black" ,  size = 8, hjust = 0.5 ),  #hjust: position of title
                  
                  # x axis title
                  axis.title.x = element_text(family = "sans" ,face = "bold", colour = "black" ,  size = 8),
                  
                  # y axis title
                  axis.title.y = element_text(family = "sans" ,face = "bold", colour = "black" ,  size = 8),
                  
                  
                  # axis text x
                  axis.text.x = element_text(color = "black", size = 8, angle = 0, hjust = 0.5, vjust = 0.5, face = "bold"),
                  # axis text y 
                  axis.text.y = element_text(color = "black", size = 8, angle = 0, hjust = 0, vjust = 0, face = "bold"),
                  
                  # legend title
                  legend.title = element_blank(),
                  strip.text.y = element_text(size = 8), strip.text.x = element_text(size = 8)
              
              
              )

# Line Plot Parameters
line_size = 0.5

# Point Plot specific parametres
point_size = 1

###############################################################
### Heatmaps
# General Parameters: Sizes etc.
plot_config_heatmap = theme_bw() + # background
              theme(
                  panel.grid.major = element_blank(), # background
                  panel.grid.minor = element_blank(), # background
                  #panel.background = element_blank(), # background
                  panel.border = element_blank(),
                  #axis.line = element_line(colour = "black", size = 1), # background
                  axis.ticks = element_blank(),
                
                  
                  # general text
                  text = element_text(family = "sans" ,face = "bold", colour = "black" ,  size = 8) ,# general text size
                  
                  # title text
                  plot.title = element_text(family ="sans" ,face = "bold", colour = "black" ,  size = 8, hjust = 0.5 ),  #hjust: position of title
                  
                  # x axis title
                  axis.title.x = element_text(family = "sans" ,face = "bold", colour = "black" ,  size = 8),
                  
                  # y axis title
                  axis.title.y = element_text(family = "sans" ,face = "bold", colour = "black" ,  size = 8),
                  
                  
                  # axis text x
                  axis.text.x = element_text(color = "black", size = 8, angle = 0, hjust = 0.5, vjust = 0.5, face = "bold"),
                  # axis text y 
                  axis.text.y = element_text(color = "black", size = 8, angle = 0, hjust = 0, vjust = 0, face = "bold"),
                  
                  # legend title
                  legend.title = element_blank(),
                  strip.text.y = element_text(size = 8), strip.text.x = element_text(size =8)
              
              
              )



plot_config_heatmap_supp = theme_bw() + # background
              theme(
                  panel.grid.major = element_blank(), # background
                  panel.grid.minor = element_blank(), # background
                  #panel.background = element_blank(), # background
                  panel.border = element_blank(),
                  #axis.line = element_line(colour = "black", size = 1), # background
                  axis.ticks = element_blank(),
                
                  
                  # general text
                  text = element_text(family = "sans" ,face = "bold", colour = "black" ,  size = 6) ,# general text size
                  
                  # title text
                  plot.title = element_text(family ="sans" ,face = "bold", colour = "black" ,  size = 6, hjust = 0.5 ),  #hjust: position of title
                  
                  # x axis title
                  axis.title.x = element_text(family = "sans" ,face = "bold", colour = "black" ,  size = 6),
                  
                  # y axis title
                  axis.title.y = element_text(family = "sans" ,face = "bold", colour = "black" ,  size = 6),
                  
                  
                  # axis text x
                  axis.text.x = element_text(color = "black", size = 6, angle = 0, hjust = 0.5, vjust = 0.5, face = "bold"),
                  # axis text y 
                  axis.text.y = element_text(color = "black", size = 6, angle = 0, hjust = 0, vjust = 0, face = "bold"),
                  
                  # legend title
                  legend.title = element_blank(),
                  strip.text.y = element_text(size = 6), strip.text.x = element_text(size =6)
              
              
              )

############################################################
# Define colors (different color sets to choose)
#### Color pallete


palette <- c("#FF7F50", "#D95F02", "#377EB8", "#E6AB02", "#31A354", "#7570B3", "#E7298A", 
                 "#66A61E", "#A6761D", "#666666", "#E41A1C", "#4DAF4A", "#984EA3", "#FF7F00", 
                 "#FFFF33", "#A65628", "#F781BF", "#1B9E77")





#### 
colors_list = list()
colors_list[['types']] =   scale_color_manual(values = c( palette))

colors_list[['measurement']] =   scale_color_manual(values = c( "#DC9F1D", "#1DDC94", "#079E89",  "#068D93",  "#066693"))

colors_list[['classification']] =   scale_color_manual(values = c( "#06C4A4", "#10DBE5", "#0C35A2",  "#D1C20E",  "#E79F28",  "#E76B28", "#066693", "#068D93"
))
colors_list[['tp_outcome']] =   scale_color_manual(values = c( "#40BE94", "#CC79A7", "#389AC8",  "#B55DCD",  "#5272B6",  "#A95FC8", "#2134AD", "#6F21AD"
))
colors_list[['default']] =   scale_color_manual(values = c( "#efbc82", "#a5c88e","#e69998", "#c0b0d2","#07580A","#9F8918", "#128890", "#59b4c6", "#D55E00", "A516E8", "#DC9F1D"
))


fill_list = list()
fill_list[['types']] =   scale_fill_manual(values = c( palette))
                                                      
                                                      

fill_list[['measurement']] =   scale_fill_manual(values = c( "#DC9F1D", "#1DDC94", "#079E89",  "#068D93",  "#066693"))

fill_list[['classification']] =   scale_fill_manual(values = c( "#06C4A4", "#10DBE5", "#0C35A2",  "#D1C20E",  "#E79F28",  "#E76B28", "#066693", "#068D93"
))
fill_list[['tp_outcome']] =   scale_fill_manual(values = c( "#40BE94", "#CC79A7", "#389AC8",  "#B55DCD",  "#5272B6",  "#A95FC8", "#2134AD", "#6F21AD"
))
fill_list[['default']] =   scale_fill_manual(values = c( "#efbc82", "#EC82E4","#e69998", "#c0b0d2","#07580A","#9F8918", "#128890", "#59b4c6", "#D55E00", "A516E8", "#DC9F1D"
))


