# RStudio IDE

## Introduction to R and RStudio

### What is R?
R is a statistical programming language. It is a powerful tool for data processing and manipulation, statistical inference, data analysis, and machine learning algorithm. Based on 2017 analysis, it was found that R is used most by academics, healthcare, and the government. R supports importing of data from different sources like flat files, databases, web, and statistical software such as SPSS and STATA.

### R Capabilities
R is a preferred language for some data scientists because R functions are easy to use. It is also known for producing great visualizations and contains packages to handle data analysis without the need to install additional libraries.

### What is RStudio
A popular integrated development environment for developing and running the R language source code and programs is RStudio. It improves and increases productivity with the R language.
R studio includes: syntax-highlighting editor that supports direct code execution and a place where you can keep a record of your work, console for typing R commands, workspace and History tab that shows the list of R objects you created during your R session and the history of all previous commands, and finally, Files, Plots, Packages, and Help tabs. The Files tab shows files in your working directory. The Plots tab displays the history of plots you have created. You can also export plots to PDF or image files. The Packages tab displays external R packages available on your local computer. And, the Help tab provides help on R resources, R studio support, packages, and many more.

### Popular R Libraries
dplyr for manipulating data, stringr for manipulating strings, ggplot for visualizing data, and caret for machine learning. To get you up and learning quickly, we have provided you with an R Studio virtual environment as part of the Skills Network Labs.

## Plotting in RStudio

With the influx of data, one of your many jobs as data scientists is to produce insights using visualizations. R has different packages for data visualization that you can use based on your requirement. To install these packages in your R environment, use the install.packages and the package name command.

Examples of R packages include the following. ggplot is used for data visualizations such as histograms, bar charts, scatterplots, and so on. It allows adding layers and components to a single visualization. Plotly is used for web-based data visualizations that can be displayed or saved as individual HTML files. Lattice is used to implement complex, multi-variable data sets. It is a high-level data visualization library that can handle graphics without customizations. And, Leaflet is used for creating interactive plots.

R has inbuilt functions to create plots and visualization. For example, you can create a plot using the definition shown here. The plot function returns a scatterplot of the values vs. the index. You can also add lines to the function and a title to make the visualization easier to read and understand. To add a line, you specify the type and to add a title, you select the title function. In the plot, you have added a line and a title. You can create informative visualizations using the ggplot library of R. It can handle complex requests by adding layers to plots using different functions and arguments. For example, to create a scatter plot, let’s use the inbuilt dataset Mtcars. You will first read the ggplot library into the memory using the library function. Next, use the ggplot function on the data frame MTcars, specify the X axis as miles per gallon and the Y axis as weight. Then add the geom point function to specify a scatter plot; otherwise, it will return an empty plot. The output will be an easier-to-read plot. In addition, you can add titles and change the axis name by using the Ggtitle argument and the lab’s argument to specify appropriate names for both axes. The result will be a graph with meaningful titles. In the lab, you will recreate the graphics with ggplot and the extension library called GGally. GGally extends ggplot by adding several functions to reduce the complexity of combining geometric objects with transformed data.