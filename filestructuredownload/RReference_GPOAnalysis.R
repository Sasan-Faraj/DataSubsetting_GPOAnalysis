#------------WORKING DIRECTORY------------

#The command below sets the r session to 
#work out of a specific folder.
#Copy and paste the file path location
#of your data into the quotations
# next to filepath 
# (right click it in files
# and look for the location). 
#Paste it inside the quotation marks.
#ENSURE TO USE FORWARD SLASHES AND NOT BACKWARDS


filepath = ""
setwd(filepath)


#------------INSTALL NECESSARY PACKAGES TO COMPUTER------------
if ("readxl" %in%  installed.packages()[,1]){
  print('readxl has already installed.')
} else {
  install.packages('readxl')
}

if ("writexl" %in%  installed.packages()[,1]){
  print('writexl has already been installed.')
} else {
  install.packages('writexl')
}

#------------BRING LIBRARIES INTO R SESSION------------
library(readxl)
library(writexl)



#------------BRING IN DATAFRAME------------

#Replace "datafile_2_27_23.xlsx" with the actual name of the file
#with the name of another xlsx file, if you would like to change
#the data you want to work with.

df <- read_xlsx("datafile_2_27_23.xlsx") #assigns the xlsx to the variable df


str(df) #shows what type of data each column is


names = colnames(df) #to make life easier, use colnames and print them out so 
                      #you can copy and past the names when you subset.
print(names)



#------------SUBSET DATAFRAME------------

#subset a dataframe based on one column 
a = df[which(df$'Outreach Services' == 'X'),]

#---------------------------------------
#subset a dataframe based on two columns

#Libraries in either Virginia or Alabama who marked X for outreaches services.
b = df[which((df$'State' %in% cbind('VA','AL')) & df$'Outreach Services' == 'X'),]

print(unique(df$'Library Size')) #Unique returns the unique values within a 
                                 #column. You can copy and past a value you 
                                 #want to subset for!


#----------------------------------------
#subset a dataframe based on three columns
#small library size and either staffing or reference services are X
c = df[which((df$'Library Size' =='Small (less than 250,000 volumes in the library)') & (df$'Staffing' == 'X'| df$"Reference services"=='X')),]

print(unique(df$'Library Type')) 
#Library type is academic law and there were no new policies or procedures implements
d = df[which((df$"Library Type" == "Academic, Law Library (AL)") & (df$"No new policies or procedures implemented." == "X")),]


#------------EXPORT DATAFRAME------------

#save your dataframe as an xlsx
write_xlsx(c,'c.xlsx')
