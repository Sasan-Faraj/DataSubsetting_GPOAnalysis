<h1 align="center"> DataFrame Subsetting in R </h1>

   
<h2 align="center"> Basic Overview </h2>

<p align ="left"> The goal of this README is to give direct examples of how to import an excel sheet, subset a dataframe, and export the dataframe as an excel sheet as needed in R. The examples will rely on the data produced for use by the the Government Publishing Orginazation of libraries who rely on the GPO. The code in this was produced using RStudio. At the end of the document, all the code snippits will be posted together for ease of use.</p>


To make things easier as well, feel free to download this [R script](filestructuredownload/RReference_GPOAnalysis.R "download") and this [excel](filestructuredownload/datafile_2_27_23.xlsx "download") file. **Prior to running the R script, ensure that both files are in the same folder.** The goal is that you can just change the file name for whatever xlsx file you want to use. You would potentially need to update the file structure as well. 


<h2 align = "center"> Importing Data from Excel </h2>

To import data into R, we will rely on functions. A function is a coding tool used to make repetitve coding tasks easier to perform. You insert specified data into the function, and it returns to you a specified output. With any function we use to perform tasks in R, we must first ensure that the function's library is installed. The library is the overall software package that contains different functions (and sometimes data).

---

First, we want to ensure that your R session is working out of the same folder that your data is in (not necessary, but makes things easy). To do that, you run the `setwd` function that's preloaded into R. This stands for set working directory. 

<code>setwd("File Path to Data")</code>

To use the correct file path, right click your data from the folder view, click the option for more information, and copy the the file path. When you want to run a piece of code, highlight it, and then click the run button on the top right of the script window. 

---

Next to bring the excel sheet into R, we will rely on the `readxl` package. More can be read about the <code>readxl</code> using the source [documentation](https://readxl.tidyverse.org).

To start out you will want to execute the following codeblock. 
<p>
<code>install.packages("readxl")</code> <br>
<code>library(readxl)</code>
</p>
   
   
The first line only needs to be run once on your computer to ensure that your computer has access to the package 'readxl'. The second line actually brings the package into your R session and it needs to be run each time you enter into an R session.

---

Now that we have the package we want, we can begin to bring in the excel file. For this specific example, let's assume we are working with a .xlsx version of the data, you would run the following piece of code. Note, the specific file name may be different, but you will want to ensure that the file tage (.xlsx) is within the quotations.

<code> df <- read_xlsx("datafile 2 27 23.xlsx") </code>

 This line of code uses the 'read_xlsx' function to bring in the xlsx sheet and save into our R session as a dataframe labeled as df. Now whenever you want to see the dataframe, you can either write and run `view(df)`, or you can click `df` on the top right panel of your RStudio session.
 
 There are analogous functions for other types of excel sheets that you can find in the documentation. 
   
   
   <h2 align = "center"> Subsetting the Dataframe </h2>

We use logical statements every day of our lives. For instance, I was X and Y. Maybe, I want X and (Y or Z). In the context of this analysis, we would say something like I want a copy of the dataframe where the (library size is small) and (the library is from Alabama or Virginia) and (they checked off for having outreach services). In R, there are specific characters that match with those logical words when subsetting a dataframe. Those are within the table below. 

| Logical Statement | Logical Operator |
| ---              |            ---  |
|  And | & |
|Or  | \| |
| Equal to  | == |
|  Not equal to  |   != |
|Greater than  | > |
|  Less than  |  < |
|  Greater than or equal to | >= |
| Less than or equal to |  <= |
|  In |  %in% |
| Grouping |  () |

<h3 align = "center"> Some Rules about the Operators </h3>

The last line is especially important to make note of because parenthesis are how you group things together. For instance, if you had three objects X, Y, and Z, but you wanted to select X or (Y and Z). Then you would be okay with selecting either Y and Z, X, or all three. But if you wanted to select (X or Y) and Z. Then you would be okay with having X and Z, Y and Z, or all three letters. You'll notice too that and/or are used to group conditionals in a specific order where the other operators are used to specifically compare elements against a threshold/condition.

Also note that or is inclusive, meaning if you put or in a statement, you are okay with returning either or both items on the either side of the or. 

Lastly, if you are trying to subset for a string (i.e. words or stuff saved as text), you should only use `=`,`!=`, or `%in%`. If you are using numbers, feel free to use those and the rest. 

---

The structure of subsetting a dataframe in R is roughly as follows (depends on number of conditions).. Remember that we set the dataframe equal to df eariler. 

<code> df[which((df$"column_name1" = X) & (df$"column_name2" %in% cbind(X,Y))), ]</code>

This translates to the following statement: Within the dataframe, return all the rows where the elements of column 1 are equal to X and the elements of column two are either X or Y. If X and Y are strings (another word for text), you would write `"X"` or `"y"`. Note, `cbind()` is a function that creates a vector in R, so it allows you to combine multiple elements. This is useful if you want to look at libraries from two or more states.  The `which()` function is not necessary, but helps to ensure that you aren't returning a dataframe of null rows. Here is the link for the [documentation](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/which). Lastly, the comma is what tells R to return all the rows.

The next section will utilize specific examples that you may encounter.

<h3 align = "center"> Examples </h3>

Say you wanted to look at libraries that were located in either Alabama or Virginia who marked off X for out reach services, you would write the following:
<br>
<code> df[which((df$'State' %in% cbind('VA','AL')) & df$'Outreach Services' == 'X'),] </code>

Say you wanted to look at small library size where either staffing or reference services are X, you would write the following:
<br>
<code> df[which((df$'Library Size' =='Small (less than 250,000 volumes in the library)') & (df$'Staffing' == 'X'| df$"Reference services"=='X')),] </code>
   - You'll see here that the entire string referencing a small library was written. This is because R processes strings such that "Small" is different from "small" which are both different from " small ". This means that we need to match exactly what's written in the column. 
   - There will be a section later on ways to quickly get that sort of information. 
   
   
Lastly, say you wanted find information where library type is academic law and there were no new policies or procedures implements, you would write the following:
<br>
<code> df[which((df$"Library Type" == "Academic, Law Library (AL)") & (df$"No new policies or procedures implemented." == "X")),] </code>

<h3 align="center"> Quick Workarounds </h3>

You'll notice that as you continue to use R, you will want to write these queries down faster and fast. There are a few ways to help this. 

If you want to get a list of all the column names, you could write `colnames(df)` and set that equal to a variable named `names`. So whenever you want to write a new query, you can just print out the names and then copy and past the names you want.

Next, it's definitely cumbersome to always have to type of each value you are using as a threshold (i.e. `"Small (less than 250,000 volumes in the library)"`). To get around this, you can use the `unique()` function. It takes in a column and returns a list of its unique values, so you can treat it the same as the previous example. For instance, you could print out `unique(df$"Library Size")`, copy the string associated with it, and place it in your query. 

<h2 align="center"> Downloading Your Dataframe Back into Excel </h2>

Depending on your goals, you may want to save your dataframe as an xlsx. To do this, you first run `install.packages("writexl")` to install the package which will help us. Then you bring the library into your R session by writing `library(writexl)`. After this, you simply write `write_xlsx(df,"df.xlsx")` where you can change the name of the saved xlsx file to your statisfaction, just ensure that you have `.xlsx` at the end of it. Likewise, the first argument is the dataframe object itself. Here is the [documentation](https://www.rdocumentation.org/packages/xlsx/versions/0.6.5/topics/write.xlsx).


<h2 align ="center"> All My Code </h2>

```

setwd('/folder1/folder2/folder3/folder4/folder5/GPO')

install.packages("readxl")
install.packages("writexl")
library(readxl)
library(writexl)

df <- read_xlsx('datafile 2 27 23.xlsx')
str(df)
names = colnames(df) #to make life easier, use colnames and print them out so 
                      #you can copy and paste the names when you subset.
print(names)

#Libraries in either Virginia or Alabama who marked X for outreaches services.
a = df[which((df$'State' %in% cbind('VA','AL')) & df$'Outreach Services' == 'X'),]

print(unique(df$'Library Size')) #Unique returns the unique values within a 
                                 #column. You can copy and past a value you 
                                 #want to subset for!

#small library size and either staffing or reference services are X
b = df[which((df$'Library Size' =='Small (less than 250,000 volumes in the library)') & (df$'Staffing' == 'X'| df$"Reference services"=='X')),]

print(unique(df$'Library Type')) 
#Library type is academic law and there were no new policies or procedures implements
c = df[which((df$"Library Type" == "Academic, Law Library (AL)") & (df$"No new policies or procedures implemented." == "X")),]

#save your dataframe as an xlsx
write_xlsx(c,"c.xlsx")

```




