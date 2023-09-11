library(factoextra)
library(cluster)

#importing the dataset
Kidney <- read.csv("E:/kidney-stone-dataset.csv")

#removing missing vlaue rows
Kidney <- na.omit(Kidney)

#removing the target attribute
Kidney <- Kidney[,-8]

#Scale each variable in the dataset 
Kidney <- scale(Kidney)

#creating a plot of the number of clusters vs. the total within sum of squares
fviz_nbclust(Kidney, kmeans, method = "wss")

#creating a plot of the number of clusters vs. gap statistic
fviz_nbclust(Kidney, kmeans, nstart = 90,  method = "gap_stat", nboot = 50)

#performing k-means clustering on the dataset using the optimal value for k of 4
km <- kmeans(Kidney, centers = 4, iter.max = 90, nstart = 90)

#displaying the result
km

#visualizing the clusters on a scatterplot
fviz_cluster(km, data = Kidney)
