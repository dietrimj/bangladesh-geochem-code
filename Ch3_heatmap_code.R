##Heatmap code for my Ch.3 data for all sample types in ppm

heat <- Shrimp_fish_feed_sediment_water_extracts_heatmap

#Elements include: Al, Ba, Ca, Cu, K, Mg, Mn, Na, P, S, Si, Sr

#Add row names from first column
row.names(heat) <- heat$Sample


#create a matrix of the data
heat_mat <- as.matrix(heat[,c(2:13)])


#Annotate heatmap
library(ComplexHeatmap)

#transpose the matrix
heat_2 <- t(heat)

heat_1 <- t(heat_mat)


# Define colors for each type of qualitative variable

col1 <- list(Type=c(Extract="blue", Feed="brown", Sediment="red", Shrimp="pink", Water="purple"))

# Create the heatmap annotation
ha <-columnAnnotation(Type = heat_2[c(14),],
                      col = col1)

jpeg("MDS_all_types_heatmap_ch_3.jpeg", 
     width = 10, height = 7, units = 'in', res = 500)
# Combine the heatmap and the annotation
Heatmap(log10(heat_1), name = "Log10 Concentrations (ppm)",
        top_annotation = ha) 
dev.off()
