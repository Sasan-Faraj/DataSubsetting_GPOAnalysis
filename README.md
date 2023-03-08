
<h1 align="center"> DataFrame Subsetting in R </h1>

   
<h2 align="center"> Basic Overview </h2>

<p align ="left"> The goal of this README is to give direct examples of how to import an excel sheet, subset a dataframe, and prepare it for analysis in R. The examples will rely on the data produced for use by the the Government Publishing Orginazation of libraries who rely on the GPO. The code in this was produced using R Studio.</p>


<h2 align = "center"> Importing Data from Excel </h2>

To import data into R, we will rely on functions. A function is a coding tool used to make repetitve coding tasks easier to perform. You insert specified data into the function, and it returns to you a specified output. With any function we use to perform tasks in R, we must first ensure that the function's library is installed. The library is the overall software package that contains different functions (and sometimes data).

---

First, we want to ensure that your R session is working out of the same folder that your data is in (not necessary, but makes things easy). To do that, you run the 'setwd' function that's preloaded into R. This stands for set working directory. 

<code>setwd("File Path to Data")</code>

To use the right file path, right click your data from the folder view, click the option for more information, and copy the the file path. 

---

Next to bring the excel sheet into R, we will rely on the 'readxl</code' package. More can be read about the <code>readxl</code> using the source [documentation](https://readxl.tidyverse.org).

To start out you will want to execute the following codeblock. 

<code>install.packages("readxl") 
library(readxl)</code>

The first line only needs to be run once on your computer to ensure that you computer has access to the library 'readxl'. The second line actually brings the package into your R session and it needs to be run each time you enter into an R session.

---



