
<h1 align="center"> DataFrame Subsetting in R </h1>

   
<h2 align="center"> Basic Overview </h2>

<p align ="left"> The goal of this README is to give direct examples of how to import an excel sheet, subset a dataframe, and prepare it for analysis in R. The examples will rely on the data produced for use by the the Government Publishing Orginazation of libraries who rely on the GPO. The code in this was produced using R Studio. At the end of the document, all the code snippits will be posted together for ease of use.</p>


<h2 align = "center"> Importing Data from Excel </h2>

To import data into R, we will rely on functions. A function is a coding tool used to make repetitve coding tasks easier to perform. You insert specified data into the function, and it returns to you a specified output. With any function we use to perform tasks in R, we must first ensure that the function's library is installed. The library is the overall software package that contains different functions (and sometimes data).

---

First, we want to ensure that your R session is working out of the same folder that your data is in (not necessary, but makes things easy). To do that, you run the 'setwd' function that's preloaded into R. This stands for set working directory. 

<code>setwd("File Path to Data")</code>

To use the right file path, right click your data from the folder view, click the option for more information, and copy the the file path. 

---

Next to bring the excel sheet into R, we will rely on the 'readxl</code' package. More can be read about the <code>readxl</code> using the source [documentation](https://readxl.tidyverse.org).

To start out you will want to execute the following codeblock. 
<p>
<code>install.packages("readxl")</code> <br>
<code>library(readxl)</code>
</p>
   
   
The first line only needs to be run once on your computer to ensure that you computer has access to the library 'readxl'. The second line actually brings the package into your R session and it needs to be run each time you enter into an R session.

---

Now that we have the library we want, we can begin to bring in the excel file. For this specific example, let's assume we are working with a .xlsx version of the data, you would run the following piece of code. Note, the specific file name may be different, but you will want to ensure that the file tage (.xlsx) is within the quotations.

<code> df <- read_xlsx("datafile 2 27 23.xlsx") </code>

 This line of code uses the 'read_xlsx' function to bring in the xlsx sheet and save into our R session as a dataframe labeled as df. So now whenever you want to subset the dataframe, you just need to call df. 
   
   
   <h2 align = "center"> Subsetting the Dataframe </h2>

We use logical statements every day of our lives. For instance, I was X and Y. Maybe, I want X and (Y or Z). In the context of this analysis, we would say something like I want a copy of the dataframe where the (library size is small) and (the library is from Alabama or Virginia) and (they checked off for having outreach services. In R, there are specific characters that match with those logical words when subsetting a dataframe. Those are within the table below. 

| Logical Statement | Logical Operator |
| :---              |            ---:  |
| <p align = "center"> And </p>| <p align = "center">& </p>|
|<p align = "center"> Or </p | <p align = "center"> \| </p>|
| <p align = "center">Equal to </p> |<p align = "center"> == </p>|
| <p align = "center"> Not equal to </p> | <p align = "center"> != </p> |
| <p align = "center">Greater than </p> |<p align = "center"> > </p>|
| <p align = "center"> Less than </p> | <p align = "center"> < </p> |
| <p align = "center"> Greater than or equal to </p>| <p align = "center"> >= </p>|
|<p align = "center"> Less than or equal to </p>| <p align = "center"> <= </p>|
| <p align = "center"> In </p>| <p align = "center"> %in% </p>|
|<p align = "center"> Grouping </p>| <p align = "center"> () </p>|

<h3 align = "center"> Some Rules about the Operators </h3>

The last line is especially important to make note of because parenthesis are how you group things together. For instance, if you had three objects X, Y, and Z, but you wanted to select X or (Y and Z). Then you would be okay with selecting either Y and Z, or you would be okay with selecting X (or all three). But if you wanted to select (X or Y) and Z. Then you would be okay with have X and Z, Y and Z, or all three letters. You'll notice too that and/or are used to group conditionals in a specific order where the other operators are used to specifically compare elements against a threshold/condition.

Also note that or is inclusive, meaning if you put or in a statement, you are okay with returning either or both items on the either side of the or. 

Lastly, if you are trying to subset for a string (i.e. words or stuff saved as text), you should only use `=`,`!=`, or `%in%`. If you are using numbers, feel free to use those and the rest. 

---

The structure of subsetting a dataframe in R is roughly as follows (depends on number of conditions).. Remember that we set the dataframe equal to df eariler. 

<code> df[which((df$"column_name1" = X) & (df$"column_name2" %in% cbind(X,Y))), ]</code>

This translates to the following statement: Within the dataframe, return all the rows where the elements of column 1 are equal to X and the elements of column two are either X or Y. Note, `cbind()` is a function that creates a vector in R, so it allows you to combine multiple elements. This is useful if you want to look at libraries from two or more states.  The `which()` function is not necessary, but helps to ensure that you aren't returning a dataframe of null rows. Lastly, the comma is what tells R to return all the rows.

The next section will utilize specific examples that you may encounter.

<h3 align = "center"> Examples </h3>






