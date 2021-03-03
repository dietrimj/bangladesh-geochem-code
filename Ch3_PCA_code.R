#Shrimp, fish feed, water, soil extract, oyster, and sediment data, all converted values included are >MDL for each sample type

Oysty <- read.csv("~/Ch3 Dissertation Materials/Shrimp_fish_feed_sediment_water_extracts_oyster_MDS.csv")


##PCA analyses
library(factoextra)

##PCA all raw elements >MDL, all types excluding oyster, using "heat" df from heatmap code for Type

res.pca <- prcomp(log10(Oysty[c(1:44),c(2:13)]), scale = TRUE)

#get rid of oyster type from "heat" df from heatmap code
heaty <- heat[c(1:44),]

jpeg("Log10_Converted_all_types_PCA_wout_oyster.jpeg", 
     width = 8, height = 7, units = 'in', res = 500)
fviz_pca_biplot(res.pca, repel = TRUE, addEllipses=TRUE, habillage = heaty$Type,
                ellipse.level=.80, label="var",
                col.ind = "#696969" )
dev.off()




