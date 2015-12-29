##Tutorial URL: http://www.r-bloggers.com/a-data-table-r-tutorial-by-datacamp-intro-to-dti-j-by/ 
## FAQs of differences of  
library(hflights)
library(data.table)
# data of 'hflights' imported as data.table 
DT <- as.data.table(hflights)

head(DT)
str(DT)

# DataTable[WHERE Statement, SELECT Statement, GROUPBY statement]
# DT[i, j, by]
DT[Month==10, mean(na.omit(AirTime)), by= UniqueCarrier]

# the 'i' part of D[i,j, by] is used for subsetting of rows
DT[2:5]
head(DT)

# We can use Column names, as they are evaluated in the scope of DT.
# Returns all those rows where Carrier is 'American Airlines'
DT[UniqueCarrier=='AA']

#DT[,5] returns 5, DT[,"UniqueCarrrier"] returns "UniqueCarrier"
DT[,5]  
DT[,"region"]
#instead use 
DT[,"UniqueCarrier", with=FALSE]

##When subsetting rows you can use the symbol .N in the command DT[...]
DT[.N-1]
DT[1:3]

# As it is a bad practice to refer to columns by number rather than name. 
#if someone else comes along and reads your code later, they may have to hunt
#around to find out which column is number 5. Furthermore, if you or someone 
#else changes the column ordering of DT higher up in your R program, you might 
#get bugs if you forget to change all the places in your code which refer to column number 5

##BUT DT[,UniqueCarrier] no quotes around the column name. This is we mean by 'j' 
# is evaluated within the scope of the data.table.
# The Scope consists of an environment where the column names are variables.
DT[,UniqueCarrier]

## We can place any R expression in j; e.g., DT[, col2- col3/2].
DT[,AirTime - ArrDelay]

## Further, j may be a set of R expressions (including calls to any R packages) 
# wrapped with list(),.() or an anonymous code block wrapped with braces. 
DT[,lm(AirTime ~ ArrDelay)]

#There are some cicumstances where referring to a columns by number is ok.
#such as the sequence column. In these situations just do DT[,5:10, with=FALSE] or
# DT[,c(1,4,10), with=FALSE]. The 'with' argument lets use data.table()
# the same way as data.frame. 

# DT[,Origin] return a vector. 
DT[,Origin=="IAH"]
DT[,Origin]
#.() is an alias for list() and ensures a data.table is returned
DT[,.(Origin)]

## DT[,Month,Year, DayofMonth] doesn't work. As 'j' expression is the 2nd argument
## The correct way to do this is DT[,.(x,y,z)]
DT[,.(Origin,DayofMonth,DayOfWeek)]

# When selecting several columns we have to use '.()' notation. This notation is just an
# alias to 'list()'.
DT[,.(mean(na.omit(DepDelay)), mean(na.omit(ArrDelay)))]

## Another useful feature which requires the '.()' notation aloows to
# rename columns inside the DT[...] command
DT[,.(Avg_ArrDelay=
        mean(na.omit(ArrDelay)))]

## for mutliple columns
DT[,.(Avg_ArrDelay = mean(na.omit(ArrDelay)),
      Avg_DepDelay = mean(na.omit(DepDelay)))]

## we can manipulate the 'j' part of DT[i,j,by]
DT[,mean(na.omit(ArrDelay))]


## Combining the above 'i' and 'j' gives
# Here we are taking DT, selected all rows where the carrier was 'AA' in the 'i' part,
# calculating the average delay on departure and on arrival,
# and plotted the time of departure against the time of depature against the delay on departure
# in the 'j' part

DT[UniqueCarrier=="AA",.(Avg_DepDelay=mean(na.omit(DepDelay)),
                         Avg_ArrDelay=mean(na.omit(ArrDelay)),
                         plot(DepTime, DepDelay, ylim=c(-15,200)),
                         abline(h=0))]


## Using 'by' part of DT[i,j, by]
## Here we calculated the average delay before departure by group where the plane is comming from.
##We see the flights departuring from HOU have a larger avg delay than those leaving fom IAH. 

DT[,mean(na.omit(DepDelay)),by=Origin] 

###Just like the 'j' part of DT[i,j,by]
## we can do lot using 'by' part.

## Here we calculate Avg delay before departure of all planes (no subsetting in the 'i' part,
## so all rows are selected) was calculated first, and grouped secondly, first by 'Origin' of the
## plane and then by 'weekday'. Weekdays is 'False' in the weekends.

DT[,.(Avg_DepDelay_byWeekdays=mean(na.omit(DepDelay))), by = .(Origin, Weekdays=DayOfWeek <6)]

## It appears that avg delay is smaller in the weekends.

##Putting all 'i','j' and 'by' parts in the DT[i,j, by]

## Here We calculate the subset of plans flewn by Delta Air Lines(selected in 'i')
## was grouped by their origin and by Weekdays(in 'by').
## The time that was compensated in air was also calculated (in 'j').
DT[UniqueCarrier=="DL", .(Avg_DepDelay= mean(na.omit(DepDelay)),
                          Avg_ArrDelay=mean(na.omit(ArrDelay)),
                          Compensation=mean(na.omit(ArrDelay-DepDelay))),
                  by= .(Origin, Weekdays=DayOfWeek<6)]

## It appears in the weekends, irrespective of the plane was coming from IAH or HOU,
## The time compensated while in 'air' (thus by flying faster) is bigger.

###############################
###############################
##X[Y, sum(foo*bar)]###########
###############################

X = data.table(grp=c("a","a","a","b","b","b","c","c"),foo=1:7)
setkey(X,grp)
Y = data.table(c("b","c"),bar=c(4,2))
head(Y)
X
Y

X[Y]
X[Y,sum(foo*bar)]
X[Y, sum(foo*bar), by=.EACHI]

## NOT EFFICIENT when we use because  X[Y][,sum(foo*bar)] 
### as X[Y] joined all the columns 
## and passed them all to the second compound
## query without knowing that only 'foo' and 'bar' are needed.
X[Y][,sum(foo*bar)]

X[Y,list(foo,bar)][,sum(foo*bar)]

head(DT)

########## When you use LOT OF COLUMNS: Use .SDCol. #############
####When grouping, the 'j' expression can use column names as variables.
#### But it can also use a reserved symbol ".SD" which refers to Subset of the Data.table for each group.
#### (excluding the grouping terms).

### Don't use this way as it is inefficient (INEFFICIENT)
DT[,sum(.SD[["AirTime"]]),by="UniqueCarrier,Dest"]
### Instead Use as follows (EFFICIENT)
DT[,sum(AirTime), by="UniqueCarrier,Dest"]

### Specifies the columns of x included in .SD. May be character column names or numeric positions. 
### This is useful for speed when applying a function through a subset of (possible very many) columns; 
###e.g., DT[,lapply(.SD,sum),by="x,y",.SDcols=301:350].
DT[,lapply(.SD, sum), by="UniqueCarrier,Dest",.SDcols=c(1,3:4,13)]


###Null data.table
## Is a null data.table the same as DT[0]. It's NOT.

data.table(NULL)

data.frame(NULL)

as.data.table(NULL)

is.null(data.table(NULL))

is.null(data.frame(NULL))

# In R only pure NULL is NULL as tested by is.null()
is.null(NULL)

DT = data.table(a=1:3, b=c(4,5,6), d=c(7L,8L,9L))
DT[0]
#Empty data.table (0 rows) of 3 cols: a,b,d

sapply(DT[0], class)

## Scoping rules for the 'j' expressions in DT[i,j, by]

DT = data.table(x=rep(c("a","b"),c(2,3)),y=1:5)
DT

#The 'lambda' programming like in python.
## No anonymous function is passed to the j. Instead, an anonymous body is pased
## to j; for example
DT[,{z=sum(y); z + 3}, by=x]

DT[,{
  cat("Objects:", paste(objects(), collapse=","),"\n")
  cat("Trace: x=", as.character(x)," y=",y,"\n")
  sum(y)
},by=x]

## x is a grouping variable and has length 1. It's for efficiency and convenience
## There is no difference between the following two statements
DT[,.(g=1,h=2,i=3,j=4, repeatgroupname=x, sum(y)), by=x]

DT[,.(g=1,h=2,i=3,j=4, repeatgroupname=x[1], sum(y)), by=x]

###PRINTING THE Data.TABLE ROWS###



library(hflights)
# data of 'hflights' imported as data.table 
DT <- as.data.table(hflights)

## If the no. of rows in a data.table are large(>100 by default). Then the
## summary of the large data.table is printed by taking the top and bottom
## n rows of the data.table 

print(DT)

###to enforce the summary of data.table if you want to show more than 
## just the top(and bottom) 10 rows of a data.table summary (say you like 20).
## set options(datatable.print.topn=20).
## we can also 'print' directly, as in print(your.data.table, topn=20)
print(DT, topn=20)
options(datatable.print.nrows = 10)
options(datatable.print.topn = 5)
print(DT)

## To drop a column in data.table####

###Efficient way for nrows > 500,000###
## Preferred method
DT[,Diverted := NULL]
## Method 2 - A Safe idiom for excluding columns matching a regular expresion.

DT[,which(!grepl("^Ori$",colnames(DT))), with =FALSE]

set(DT, j="Origin", value=NULL)

dt <- data.table(a = letters, b=LETTERS, c=seq(26), d=letters, e=letters)
dt

set(dt,j = which(colnames(dt) %in% c("a","c","e")), value=NULL)


##########################################################
###############DATA.TABLE USING MTCARS####################
##########################################################


dt <-data.table(mtcars)
head(dt)

## summary table (short and narrow)#####
dt <- data.table(mtcars)[,.(gear, cyl)]
dt[,unique(gear), by=cyl]

dt[,gearsL:=(list(list(unique(gear)))), by=cyl]

## Accessing elements form a column of lists ###
dt[,gearL1:= lapply(gearsL, function(x) x[2])]
dt[,gearS1:= sapply(gearsL, function(x) x[2])]

str(head(dt[,gearL1]))

str(head(dt[,gearS1]))

?mapply

#Calculate all the 'gear's for all cars of each 'cyl' (excluding the current row).
#This can be useful for comparing observations to the mean of groups, where the 
#group mean is not biased by the observation of interest.

dt[,other_gear:=mapply(function(x,y) setdiff(x,y), x=gearsL, y =gear)]
#or#
dt[,other_gear:=mapply(setdiff, gearsL, gear)]



head(dt)

### Suppressing intermediate Output with {} ###
dt <- data.table(mtcars)
dt[,{tmp1=mean(mpg); tmp2=mean(abs(mpg-tmp1)); tmp3=round(tmp2, 2)}, by=cyl]

##we can be more explicit by passing a named list of what we want to keep
dt[,{tmp1=mean(mpg); tmp2=mean(abs(mpg-tmp1)); tmp3=round(tmp2,2); list(tmp2=tmp2, tmp3=tmp3)}, by=cyl]

## we can also write like this without semicolons
dt[,{tmp1=mean(mpg)
     tmp2=mean(abs(mpg-tmp1))
     tmp3=round(tmp2,2)
     list(tmp2=tmp2, tmp3=tmp3)},
   by = cyl]

##looping with set
dt <- data.table(mtcars)[,1:5, with=F]
head(dt)
for( j in c(1L,2L,4L)) set(dt, j=j, value=-dt[[j]])
for( j in c(3L,5L)) set(dt, j=j, value=paste0(dt[[j]],'!!'))


####USING 'shift' for a lead/lag vectors and lists but it only works for data.table version 1.9.5
dt <- data.table(mtcars)[,.(mpg,cyl)]
head(dt)
dt[,mpg_lag1:=shift(mpg,1)]
