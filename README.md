
<h1 align="center"> DataFrame Subsetting in R </h1>

----
   
<h2 align="center"> Basic Overview </h2>

<p align ="center> The goal of this README is to give direct examples of how to import an excel sheet, subset a dataframe, and prepare it for analysis in R. The examples will rely on the data produced for use by the the Government Publishing Orginazation of libraries who rely on the GPO. The code in this was produced using R Studio.</p>

----
<h2 align = "center"> Importing Data from Excel </h2>

To import data into R, we will rely on a a function. A function is a coding tool used to make repetitve coding tasks easier to perform. You insert specified data into the function, and it returns to you a specified output. With any function we use to perform tasks in R, we must first ensure that the function's library is installed. The library is the overall software package that contains different functions (and sometimes data).

For this project, we will rely on the 'readxl</code' package. More can be read about the <code>readxl</code> using the source [documentation](https://readxl.tidyverse.org).

To start out you will want to execute the following codeblock. 

'install.packages('readxl')
library(readxl)'

The first line only needs to be run once on your computer to ensure that you computer has access to the library 'readxl'.



