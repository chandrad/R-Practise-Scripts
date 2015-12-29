###Data.table basics
#1. Create and subset a data.table

#INSTRUCTIONS
#Create a data.table my_first_data_table with a column x = c("a", "b", "c", "d", "e") 
#and a column y = c(1, 2, 3, 4, 5). Use the function data.table().
#Create a two-column data.table DT that contains the four integers 1, 2, 1 and 2 
#in the first column a and the letters A, B, C and D in the second column b. Use recycling.
#Select the third row of DT and just print the result to the console.
#Select the second and third rows without using commas and print the result to the console.

# The data.table package is pre-loaded
library(data.table)
# Create my_first_data_table
my_first_data_table = data.table(x=c('a','b','c','d','e'), y=c(1,2,3,4,5))

# Create a data.table using recycling
DT = data.table(a = c(1L,2L) , b=c('A','B','C','D'))

# Print the third row to the console
DT[3,]

# Print the second and third row to the console, but do not commas
DT[2:3]


#2. Getting to know a data.table
#You can pass data.table to base R functions like head() and tail() that accept a data.frame. 
#Also, keep in mind that the special symbol .N contains the number of rows. You can put this symbol inside square brackets.

#Select the penultimate row of the table. Make use of .N for this.
#Return the column names of the data.table.
#Return the number of rows and number of columns of the data.table.
#Select row 2 twice and row 3, returning a data.table with three rows where row 2 is a duplicate of row 1.

DT = data.table(a=c(1L,2L), b=c('A','B','C','D'))
DT

# DT and the data.table package are pre-loaded
require(data.table)
DT

# Print the penultimate row of DT using .N
DT[.N-1]

# Print the column names of DT, and number of rows and number of columns
colnames(DT)
dim(DT)

# Select row 2 twice and row 3, returning a data.table with three rows where row 2 is a duplicate of row 1.
DT[c(2,2,3),]


##3.A data.table of a vector
DT = data.table(A=seq(1:6), B=c("a","b","c","d","e","f"), C=6:11)
DT
#A data.table table DT is preloaded in your workspace which is to your right. 
#Type DT in the console to have a look at it. As you have learned in the video, 
# you can select a column from that data.table with DT[,.(B)].
DT[,.(B)]
#ANSWER: Vector
DT[,B]

## 4. A Non-existant column

#Type D <- 5 in the console. What do you think is the output of DT[, .(D)] and DT[, D]?
D <- 5
DT[,.(D)]
DT[,D]
#ANSWER: DT[, D] returns 5 as vector, and DT[, .(D)] returns 5 as data.table

##5. Subsetting data tables

##Take DT, subset rows using i, then calculate j grouped by by

DT = data.table(A=seq(1:5), B=c("a","b","c","d","e"), C=6:10)

#Create a subset containing the columns B and C for rows 1 and 3 of DT. Simply print out this subset to the console.
#From DT, create a data.table, answith two columns:Bandval, wherevalis the product ofAandC.
#Fill in the blanks of the assignment of ans2, such that it equals the data.table specified in target.

# DT and the data.table package are pre-loaded
DT
# Subset rows 1 and 3, and columns B and C
DT[c(1,3),.(B,C)]

# Assign to ans the correct value
ans = DT[,.(B,val=A*C)]

# Fill in the blanks such that ans2 equals target
target <- data.table(B = c("a", "b", "c", "d", "e", "a", "b", "c", "d", "e"), 
                     val = as.integer(c(6:10, 1:5)))
ans2 <- DT[, .(B, val = as.integer(c(6:10,1:5))  )]


##6. The by basics

##INSTRUCTIONS##

#Convert the iris dataset to a data.table DT. You're now ready to use data.table magic on it!
#For each Species, what is the mean Sepal.Length? Do not provide a name for the newly created column.
#Do exactly the same as in the instruction above, 
#but this time group by the first letter of the Species name instead. Use substr() for this.


# iris is already available in your workspace.


# Convert iris to a data.table: DT
DT = as.data.table(iris)

# For each Species, print the mean Sepal.Length
DT[,.(mean(Sepal.Length)),by=Species]

# Print mean Sepal.Length, grouping by first letter of Species
DT[,.(mean(Sepal.Length)), by = substr(Species,1,1)]


##7. Using .N and by


#You saw earlier that .N can be used in i and that it designates the number of rows in DT. 
#There, it is typically used for returning the last row or an offset from it. 
#.N can be used in j too and designates the number of rows in this group. 
#The becomes very powerful when you use it in combination with by.

DT <- as.data.frame(iris)

# data.table version of iris: DT
DT <- as.data.table(iris)
DT
# Group the specimens by Sepal area (to the nearest 10 cm2) and count how many occur in each group.
DT[, .N , by = 10 * round(Sepal.Length * Sepal.Width / 10)]

# Now name the output columns `Area` and `Count`
DT[,.(Count=.N), by = .(Area = 10 * round(Sepal.Length * Sepal.Width/10))]


##8. Return multiple numbers in j

##INSTRUCTIONS###

#Given DT, calculate cumulative sum of C in column C while you group by A,B. 
#Store it in a new data.table DT2 with 3 columns: A, B and C.
#Select from DT2, the last two values of C in column C while you group by A alone. 
#Make sure the column names don't change.

# Create the data.table DT
set.seed(1L)
DT <- data.table(A=rep(letters[2:1], each=4L), B=rep(1:4, each=2L), C=sample(8))

DT
# Create the data.table DT
set.seed(1L)
DT <- data.table(A=rep(letters[2:1], each=4L), B=rep(1:4, each=2L), C=sample(8))

# Create the new data.table, DT2
DT2 <- DT[,.(C=cumsum(C)),by=.(A,B)]

# Select from DT2 the last two values from C while you group by A
DT2[,.(C=tail(C,2)), by=A]
