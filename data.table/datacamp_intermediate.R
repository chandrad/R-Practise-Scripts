####CHAINING AT DATA.TABLE####
DT  <- data.table(A=c('c','b','a','c','b','a'), B=seq(1,6))
DT
str(DT)

ans <- DT[, sum(B), by= A]

#Chaining##
ans[order(A)]


#1.Chaining the Basics##

##Instructions
#In the previous section, you calculated DT2 by taking the cumulative sum of C while grouping by A,B. 
#Next, you selected from DT2 the last two values of C while grouping by A alone. 
#Do this again, but this time use the concept of chaining instead. Simply print out the result of the chaining.

# The data.table package has already been loaded

# Build DT
set.seed(1L)
DT <- data.table(A = rep(letters[2:1], each = 4L), B = rep(1:4, each = 2L), C = sample(8)) 
DT
# Use chaining:
# Cumsum of C while grouping by A and B, and then select last two values of C while grouping by A
DT[ ,.(C=cumsum(C)), by= .(A,B) ][,.(C =tail(C,2)),by = A]


##2. Chaining your iris dataset

##INSTRUCTIONS##
#Get the median of all the four columns Sepal.Length, Sepal.Width, Petal.Length and Petal.Width while you group by Species. 
#Give them the same names (e.g. the column containing the median Sepal.Length, is called Sepal.Length). 
#Next, orderSpeciesindescending order using chaining. 
#This is deliberately repetitive, but we have a solution for you in the next exercise!

DT = data.table(iris)

# Perform chained operations on DT
DT[,.(Sepal.Length=median(Sepal.Length),
      Sepal.Width=median(Sepal.Width), 
      Petal.Length=median(Petal.Length), 
      Petal.Width=median(Petal.Width)),by=Species][order(-Species)]


##Subset 5: Subset of data.table
##SUBSET OF DATA .(SD)

DT[,lapply(.SD, median), by = Species]

##3, Programming time vs readability
DT <- data.table(x = c(2,1,2,1,2,2,1), y=c(1,3,5,7,9,11,13), z=c(2,4,6,8,10,12,14))
DT

#A data.table DT has been created for you and is available in the workspace. Print it out and inspect it.
#Get the mean of columns y and z grouped by x by using .SD.
#Get the median of columns y and z grouped by x by using .SD.

# Print out the pre-loaded data.table DT
DT

# Mean of columns
DT[,lapply(.SD, mean), by = x]

# Median of columns
DT[,lapply(.SD, median),by= x]


##4. Introducing .SDcols
#.SDcols specifies the columns of DT that are included in .SD. Using .SDcols comes in handy if you have too many columns 
#and you want to perform a particular operation on a particular subset of the columns (apart from the grouping variable columns).
#While using data.table, you may find yourself looking back to the documentation. 
#Have a look at ?data.table for more info on .SDcols.

DT <- data.table(grp = c(6,6,8,8,8), Q1= c(2,2,5,3,2), Q2=c(5,5,4,4,1), Q3=c(2,1,4,2,4), H1 =c(3,4,5,2,4), H2=c(5,2,4,1,2))

#INSTRUCTIONS
#A new data.table, DT, has been prepared for you in the workspace. Start by printing it out.
#Calculate the sum of the Q columns using .SD and .SDcols. Use 2:4.
#You can set .SDcols to be the result of a function call. This time calculate the sum of columns H1 and H2 using paste0().
#Finally, select all but the first row of the groups names 6 and 8, 
#returning only the grp column and the Q columns. Use -1 in i of .SD and use paste0() again. 
#Type desired_result to better understand what you need to do.

# Print out the new data.table DT

DT
# Calculate the sum of the Q columns
DT[,lapply(.SD,sum), .SDcols = 2:4]

# Calculate the sum of columns H1 and H2 
DT[,lapply(.SD, sum), .SDcols =paste0("H",1:2)]

# Select all but the first row of groups 1 and 2, returning only the grp column and the Q columns. 
DT[,.SD[-1], by = grp, .SDcols = paste0("Q",1:3)]


##5. Mixing it together: lapply, .SD, SDcols and .N
###INSTRUCTIONS####
##The final exercise of this section is a challenging one, so do not give up too soon! 
##It is important to remember that lapply() and .SD return a list,
##and that .N is an built-in variable that returns an integer vector of length 1. 
##If j returns a list then a data.table is returned. To combine items together you already know to use c(). 
#Combining a list with a vector makes a new list one longer. 
#When you select .N on its own, it automatically gets named N in the output for convenience when chaining.


DT <- data.table(x=c(2,1,2,1,2,2,1), y=c(1,3,5,7,9,11,13), z = c(2,4,6,8,10,12,14))
DT

#Get the sum of all columns x, y and z and the number of rows in each group while grouping by x. Your answer should be identical to this:
#  x x  y  z N
#1: 2 8 26 30 4
#2: 1 3 23 26 3
#Get the cumulative sum of column x and y while grouping by x and z > 8 such that the answer looks like this:
#  by1   by2 x  y
#1:   2 FALSE 2  1
#2:   2 FALSE 4  6
#3:   1 FALSE 1  3
#4:   1 FALSE 2 10
#5:   2  TRUE 2  9
#6:   2  TRUE 4 20
#7:   1  TRUE 1 13
#Use chaining to get the maximum of both x and y by combining the result that was 
#obtained in the previous instruction and group the result by by 1.

# DT is pre-loaded

# Sum of all columns and the number of rows
DT[,c(lapply(.SD, mean),.N),by=x, .SDcols= c("x","y","z")]

# Cumulative sum of column x and y while grouping by x and z > 8
DT[,lapply(.SD, cumsum),by=.(by1 = x,by2 =z>8), .SDcols = c("x","y")]

# Chaining
DT[, lapply(.SD, cumsum), by = .(by1 = x, by2 = z > 8), .SDcols = 1:2][, lapply(.SD, max), by = by1, .SDcols = c("x","y")]



####Using Section 6 := in j
## Add/Update columns in j using :=

###shortcut DT[,x:= rev(x)]

DT <- data.table(x=c(1,1,1,2,2), y=c(6,7,8,9,19))
DT

DT[, c("x","y"):= .(rev(x), 10:6)]

### 7. Adding updating/deleting  and removing columns

#As you now know, := is defined for use in j only, and there are two ways of using it. 
#The first is the LHS := RHS form, where LHS is a character vector of column names 
#and RHS is the corresponding value (Note: LHS stands for Left Hand Side and RHS stands for Right Hand side in what follows).


#Add a column to DT by reference, named Total, that contains sum(B) for each group in column A.

#Add 1L to the values in column B, but only in the rows 2 and 4.
#Add a new column Total2 that contains sum(B) grouped by A but just over rows 2, 3 and 4.
#Remove the Total column from DT
#Use [[ to select the third column as a vector. Simply print it out to the console.


# The data.table DT
DT <- data.table(A = letters[c(1, 1, 1, 2, 2)], B = 1:5)

# Add column by reference: Total
DT[, Total := sum(B) , by = A]

# Add 1 to column B
DT[c(2, 4), B := B + 1L]

# Add a new column Total2
DT[2:4, Total2 := sum(B), by = A]

# Remove the Total column
DT[, Total := NULL]

# Select the third column using `[[`
DT[[3]]  
DT[[3L]] ## Also works


### 8. To assign or not to assign
#Type DT. When using := in j do you need to assign the result to DT, that is,

DT <- DT[,Total:=sum(B),by=A]

#ANSE No
DT

###9. Deleting a column for a subset of rows
#Try deleting a column only a subset of rows.
#Try deleting a column only for a subset of rows: DT[2, B:=NULL]. Did this work?

DT


#Did this work?
#No. You got an error that stated that when RHS of := NULL, i should be missing.
#A column is either there or it's not. It makes no sense to partially delete it. 
#If you find yourself needing to do this, then consider using NAs instead. Rather than silently ignore the mistaken use of i, 
#data.table throws a syntax error straight away so you can fix it.
#A column is either there or it's not. It makes no sense to partially delete it. 
#If you find yourself needing to do this, then consider using NAs instead. 
#Rather than silently ignore the mistaken use of i, data.table throws a syntax error straight away so you can fix it.

###10. The function form

#The second way to use := is a function form. 
#The nice thing about a function form is that you can get each right hand side (RHS) 
#alongside the left hand side (LHS) so it is easier to read.

#Time for some experimentation. A data.table DT has already been prepared for you in the sample code.
#?`:=`
##INSTRUCTIONS###
#Update B with B + 1 and add a new column C with A + B, and D with constant 2.
#A variable my_cols has already been defined. Use it to delete these columns from DT.
#Finally, Delete column D by number (2), not by name (D).


# A data.table DT has been created for you
DT <- data.table(A = c(1, 1, 1, 2, 2), B = 1:5)
DT
# Update B, add C and D
DT[,`:=`(B = B + 1, C = A + B, D = 2)]

# Delete my_cols
my_cols <- c("B", "C")
DT[, (my_cols) := NULL]

# Delete column 2 by number
DT[,2 := NULL]


###Section 7: Using set(), setnames()

#If we have to repeatedly update a Data.table
DT = data.table(x=c(1,2,3,4,5), y=c(1,8,1,1,1), z=c(2,5,4,2,3))

#Suppose if you want to repeadtedly update rows and column by reference. 
#You would be tempted to use for loop with colon = operator
for(i in 1:5) DT[i, z := i+1]

#BUT BETTER version is to use set(). Because Set() is a loop of low over-head version of colon := is operator 
#except that it cannot handle grouping operations

for(i in 1:5) set(DT, i, 3L, i + 1) #The value of i runs from 1 to 5. For each value of i we update
# DT on third column(3L) with value i = i + 1

#setnames() are use to set/modify the column names of data.table by reference 
DT = data.table(x=seq(1:5),y=letters[1:5])
DT

# setnames(DT, "old", "new") convenient and robust. 
#This updates the data.table by reference absolutely no copies are being made
setnames(DT, "y","z")

#setcolorder(), set the column order by reference
setnames(DT, "z", "y")

#Suppose if you want to change the order of data.table strating with y and then x

setcolorder(DT, c("y","x"))

###11. Ready set(), go
#set() cannot do grouped operations

DT = data.table(A=c(2,2,3,5,2,5,5,4,4,1),B=c(2,1,4,2,4,3,4,5,2,4), C=c(5,2,4,1,2,2,1,2,5,2), D=c(3,3,3,1,5,4,4,1,4,3))
DT

####INSTRUCTIONS####
#A data.table DT has been created for you in the workspace. Check it out!
#Loop through columns 2,3 and 4, and for each one select 3 rows at random and set the value of that column to NA.
#Change the column names to lower case. When setnames() is passed just one input vector, that needs to be all the new names.
#Print the resulting DT to the console to see what changed.

# Set the seed
set.seed(1)

# Check the DT that is made available to you
DT

# For loop with set
for(i in 2:4) set(DT, sample(10,3), i, NA)

# Change the column names to lowercase
setnames(DT, tolower(names(DT)))

# Print the resulting DT to the console
DT

##12. The set() family
## A wrap up of the set-family:

#set() is a loopable low overhead version of :=
#  You can use setnames() to set or change column names
#setcolorder() lets you reorder the columns of a data.table

##INSTRUCTION###
#First, add a postfix "_2" to all column names of DT. You can use paste0() here.
#Next, use setnames() to change a_2 to A2.
#To end, reverse the order of the columns.

# Define DT
DT <- data.table(a = letters[c(1, 1, 1, 2, 2)], b = 1)
DT
# Add a postfix "_2" to all column names
setnames(DT,  paste0(colnames(DT),"_2"))

# Change column name "a_2" to "A2"
setnames(DT, "a_2", "A2")

# Reverse the order of the columns
setcolorder(DT, 2:1)

####Section - 8: Data indexing in data.table###
DT= data.table(A=c('c','b','a','c','b','a'), B=seq(1:6))
DT

#using colnames in 'i'
DT[A == 'a']

DT[A %in% c("a","c")]

#Conceptually
w <- DT[,A=='a']
w

DT[w]

#equivalently Automatically indexes (by default) the data.table for you
DT[A=='a']

DT[A=='b'] # Second time its much faster

##13. Selected rows the data.table way

##INSTRUCTIONS###
#Convert the iris dataset to a data.table with the same name iris
#Select all the rows where Species is "virginica"
#Select all the rows where Species is either "virginica" or "versicolor"

# The data.table package is pre-loaded

# Convert iris to a data.table
iris <- as.data.table(iris)

# Species is "virginica"
iris[Species == "virginica"]

# Species is either "virginica" or "versicolor"
iris[Species %in% c("virginica","versicolor")]


## 14. Removing columns and adapting your column names


#Now you have to take your understanding of the data.table package to the next level: 
#use standard R functions and regular expressions to manipulate your data.table by removing columns and adapting column names. 


?gsub()

##INSTRUCTIONS##
#Change the names of the columns in iris that contain "Sepal.": remove the "Sepal." prefix. Use gsub().
#Remove the two columns that start with "Petal" from the iris data.table.

# iris as a data.table
iris <- as.data.table(iris)

# Remove the "Sepal." prefix
setnames(iris, gsub("^Sepal\\.","",names(iris)))


# Remove the two columns starting with "Petal"
iris[,grep("^Petal",names(iris)):=NULL]


##15. Understanding automatic indexing.
##You got introduced to the rule that "if i is a single variable name, it is evaluated in calling scope, 
## otherwise inside DT's scope". This is a very important rule if you want to
#conceptually understand what is going on when using column names in i.
#Only single columns on the left side of operators benefit from automatic indexing


##INSTRUCTIONS###
#Select the rows where the area is greater than 20 square centimeters.
#Add a new boolean column containing Width * Length > 25 and call it is_large.
#Select the rows for which the value of is_large is TRUE.

# Cleaned up iris data.table
iris <- as.data.table(iris)
iris

# Area is greater than 20 square centimeters
iris[ Width * Length > 20 ]

# Add new boolean column
iris[, is_large := Width * Length > 25]

# Now large observations with is_large
iris[is_large == TRUE]
iris[(is_large)] # Also OK

## Section - 9: Keys #supercharged rownames
##DATA ANALYSIS- THE DATA TABLE WAY
#Sometimes it is convenient to make a key in data.table

DT <- data.table(A=c("c","b","a","c","b","a"), B= seq(1:6))
DT

setkey(DT, A)

DT["a"]

DT["b", mult="first"]

DT["b", mult="last"]

DT[c("b","d")]
#OR
DT[c("b","d"), nomatch=NA]

# For excluding NA

DT[c("b","d"), nomatch=0]


##Two Column keys

DT <- data.table(A=c("c","b","a","c","b","a"),B=c(4,1,6,3,5,2),C=seq(1:6))


DT

setkey(DT, A, B)

#we need to use .()

DT[.("b",5)]

DT["b"]


##16. Check to see if you understood the KEY takeaways

##INSTRUCTIONS
#The DT data.table is already loaded in your workspace. Do the following commands:
  
#Select the b group using ==.
#Set a 2 column key on A and B.
#Select the b group again: again use ==.
#Did the order of the rows within the b group change?
# ANS: YES
DT <- data.table(A=c("b","a","b","c","a","b","c"),B=c(2,4,1,7,5,3,6),C=6:12)
DT[A=="b"]
setkey(DT, A,B)
DT["b"]

#17. Selecting groups or parts of groups

##INSTRUCTIONS##

#The previous exercise illustrated how you can manually set a key via setkey(DT,A,B). 
#setkey() will then sort the data by the columns that you specify, and change the table by reference. 
#Having set a key will allow you to use it as a super-charged rowname when doing selections for example. 
#Arguments like mult and nomatch then help you to only select particular parts of groups.

#Furthermore, two of the instructions will require you to make use of by = .EACHI. 
#This will allow you to run j for each group in which each item in i joins too.

#A data.table DT has already been created for you, with the keys set to A and B.



# The 'keyed' data.table DT
DT <- data.table(A = letters[c(2, 1, 2, 3, 1, 2, 3)], 
                 B = c(5, 4, 1, 9,8 ,8, 6), 
                 C = 6:12)
setkey(DT,A,B)

DT

##INSTRUCTIONS###

#Select the "b" group without using ==.
#Select the "b" and "c" groups, again without using ==.
#Select the first row of the b and c groups using mult.
#Use by = .EACHI and .SD to select the first and last row of the b and c groups.
#Extend the previous command to print out the group before returning the first and last row from it.

# The 'keyed' data.table DT
DT <- data.table(A = letters[c(2, 1, 2, 3, 1, 2, 3)], 
                 B = c(5, 4, 1, 9,8 ,8, 6), 
                 C = 6:12)
setkey(DT,A,B)

# Select the "b" group
DT["b"]

# "b" and "c" groups
DT[c("b", "c")]

# The first row of the "b" and "c" groups
DT[c("b", "c"), mult = "first"]

# First and last row of the "b" and "c" groups
DT[c("b", "c"), .SD[c(1, .N)], by = .EACHI]

# Copy and extend code for instruction 4: add printout
DT[c("b", "c"), { print(.SD); .SD[c(1, .N)] }, by = .EACHI]


##SECTION 10: Rolling Joins

#Ordered Joins

DT <- data.table(A=c("a","a","b","b","c",'c'), B=c(2,6,1,5,3,4), C= c(6,3,2,5,4,1))
DT
setkey(DT, A, B)
DT

DT[.("b",4)]

DT[.("b",4), roll=TRUE]

DT[.("b",4), roll="nearest"]

#FORWARD AND BACKWARD
DT[.("b",4), roll= +Inf]

DT[.("b",4), roll=-Inf]

#LIMITED STALENESS

DT[.("b",4), roll=2]

#CONTROL ENDS

DT[.("b",7:8), roll=TRUE]

DT[.("b", 7:8), roll=TRUE, rollends=FALSE]

##18.Rolling joins - part one

DT <- data.table(A = letters[c(2, 1, 2, 3, 1, 2, 3)], 
                 B = c(5, 4, 1, 9, 8, 8, 6), 
                 C = 6:12, 
                 key= "A,B")
DT

##INSTRUCTIONS###

#Get the key of DT through the key() function.
#Use the super charged row names to look up the row where A == "b" & B == 6, without using ==. 
#Verify here that C is NA.
#Base yourself on the query that was written in the previous instruction to return the prevailing row before this gap. Use roll.
#Again starting from the code for the second instruction, but this time find the nearest row.

# Keyed data.table DT
DT <- data.table(A = letters[c(2, 1, 2, 3, 1, 2, 3)], 
                 B = c(5, 4, 1, 9, 8, 8, 6), 
                 C = 6:12, 
                 key= "A,B")

# Get the key of DT
key(DT)

# Row where A == "b" & B == 6
DT[.("b",6)]

# Return the prevailing row
DT[.("b",6), roll=TRUE]

# Return the nearest row
DT[.("b",6),roll="nearest"]


###19. Rolling joins - part two

#Good job! It is time to move on to the rollends argument. 
#The rollends argument is actually a vector of two logical values, 
#but remember that you can always look this up via ?data.table. 
#You were introduced to this argument via the control ends section. 
#If you want to roll for a certain distance, you remain with the roll argument.


# Keyed data.table DT
DT <- data.table(A = letters[c(2, 1, 2, 3, 1, 2, 3)], 
                 B = c(5, 4, 1, 9, 8, 8, 6), 
                 C = 6:12, 
                 key= "A,B")

DT

##INSTRUCTIONS##

#Print out the sequence (-2):10 for the "b" group.
#Copy and extend the code to carry the prevailing values forwards through the NA.
#Copy and extend the code to also carry the first observation backwards.

#Look at the sequence (-2):10 for the "b" group
DT[.("b",(-2):10)]

#Add code: carry the prevailing values forwards
DT[.("b",(-2):10), roll=TRUE]

#Add code: carry the first observation backwards
DT[.("b",(-2):10), roll=TRUE, rollends=TRUE]
DT[.("b", (-2):10), roll = TRUE, rollends = c(TRUE, TRUE)] # also OK

####20.Rolling joins - final part
##If you look up the value B==20 in group A=="b" without limiting the roll, the value of column C is now …
#ANS:11
DT[.("b",20), roll=TRUE] 
