#################################
###########DataCamp##############
######Intermediate R Course######
#################################


## Equality 

TRUE == TRUE

TRUE == FALSE

"hello" == "goodbye"

3 == 2

"hello" != "goodbye"

3!=2

3 < 2

3 > 5

"Hello" > "Goodbye" #it comes TRUE as R uses alphabetic order!

TRUE > FALSE #TRUE Coerses to 1 & FALSE coersces to 0

##Relational Operators & Vectors ###
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
linkedin

linkedin > 10

facebook <- c(17, 7, 5, 16, 8, 13, 14)

facebook

facebook <= linkedin

###1. EQUALITY class##
##Instructions###
#In the editor on the right, write R code to see if TRUE equals FALSE.
#Likewise, check if -6 * 14 is not equal to 17 - 101.
#Next up: comparison of character strings. Ask R whether the strings "useR" and "user" are equal.
#Finally, find out what happens if you compare logicals to numerics: are TRUE and 1 equal?


3 == 2
"intermediate" != "r"
TRUE!=FALSE
"Rchitect" != "rchitect"


# Comparison of logicals
TRUE == FALSE

# Comparison of numericals
-6*14 == 17-101

# Comparison of Strings
"useR" == "user"

# Compare a logical with a numeric
TRUE == 1


##2. Greater and less than##
(1+2) > 4
"dogs" <"Cats" #FALSE
TRUE <= FALSE #FALSE = 0
TRUE >= FALSE #TRUE = 1

#Write R expressions to check whether:
  
#  -6 * 5 + 2 is greater than or equal to -10 + 1
#"raining" is less than or equal to "raining dogs"
#TRUE is greater than FALSE

#comparison of numerics
-6*5 + 2 >= -10 + 1

#Comparison of character strings
"raining" <= "raning dogs"

#Comparison of Logicals
TRUE > FALSE

##3. Compare Vectors

#Using relational operators, find a logical answer, i.e. TRUE or FALSE, for the following questions:

#For which days the number of LinkedIn profile views exceeded 15?
#When was your LinkedIn profile viewed only 5 times or fewer?
#When was your LinkedIn profile visited more often than your Facebook profile?

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Popular days
linkedin > 15

# Quiet days
linkedin <= 5

# LinkedIn more popular than Facebook
linkedin > facebook

##4. COMPARE MATRICES


#Using the relational operators you've learned so far, try to discover the following:

#When were the views exactly equal to 13? Use the views matrix to return a logical matrix.
#For which days was the number of views less than or equal to 14? Again, have R return a logical matrix.
#How often did the number of Facebook views equal or exceed twice the LinkedIn views during a single day? 
#Use the sum() function in combination with the linkedin and facebook vectors.

#The social data is created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

views <- matrix(c(linkedin, facebook), nrow=2, byrow=TRUE)
views

# When does views equal 13?
views == 13

# When is views less than or equal to 14?
views <= 14

# How often does facebook equal or exceed linkedin times two?
sum(facebook >= 2 * linkedin)



###Logical Operators Video ####

#### AND & operator ###

TRUE & TRUE
FALSE & TRUE
TRUE  &  FALSE
FALSE & FALSE

x <- 12 
x > 5 & x < 15 #TRUE 
x <- 17
x > 5 & x < 15

TRUE | TRUE
TRUE | FALSE
FALSE | TRUE
FALSE | FALSE

y <- 4

y < 5 | y >15

!TRUE
!FALSE
!(x < 5)

is.numeric(5)
!is.numeric(5)
is.numeric("hello")

###Logical Operators & Vectors
c(TRUE, TRUE, FALSE) & c(TRUE, FALSE, FALSE)

c(TRUE, TRUE, FALSE) | c(TRUE, FALSE, FALSE)

!c(TRUE, TRUE, FALSE)

## & vs && | & || difference between the first & second one is element  & gives for all vector

c(TRUE, TRUE, FALSE) & c(TRUE, FALSE, FALSE)

c(TRUE, TRUE, FALSE) && c(TRUE, FALSE, FALSE)

c(TRUE, TRUE, FALSE) | c(TRUE, FALSE, FALSE)

c(TRUE, TRUE, FALSE) || c(TRUE, FALSE, FALSE)


#5. & and |

# The linkedin and last variable are already defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
last <- tail(linkedin, 1)

# Is last under 5 or above 10?
last < 5 | last > 10

# Is last between 15 (exclusive) and 20 (inclusive)?
last > 15 & last <= 20

# Is last between 0 and 5 or between 10 and 15?
(last > 0 & last < 5) | (last > 10 & last < 15)



#6. & and | (2)
# The social data (linkedin, facebook, views) has been created for you
views
# linkedin exceeds 10 but facebook below 10
linkedin > 10 & facebook < 10

# When were one or both visited at least 12 times?
linkedin >= 12 | facebook >= 12

# When is views between 11 (exclusive) and 14 (inclusive)?
views  > 11 & views <=14


#7. Reverse the result: !
!TRUE
!(5 >3)
!!FALSE

x <- 5
y <- 7
!(!(x < 4) & !!!(y > 12))

##8. Blend it all together

##Creating the data set
day1 <- c(2,19,24,22,25,22, 0, 12, 19, 23, 29, 13, 7, 26, 7, 32, 7, 9, 0, 9, 6, 17, 1, 5, 2, 29, 17, 26, 27, 4, 22, 9, 6, 18, 2, 32, 5, 6, 30, 34, 15, 28, 6, 17, 6, 18, 21, 10, 6, 30)
str(day1)
day2 <- c(3, 23, 18, 18, 25, 20, 4, 3, 22, 12, 27, 13, 17, 27, 6, 35, 17, 6, 1, 12, 15, 17, 12, 8, 7, 25, 15, 32, 29, 1, 22, 11, 5, 17, 12, 26, 13, 10, 37, 33, 19, 29, 8, 22, 10, 19, 27, 18, 15, 28)
day3 <- c(3, 18, 15, 27, 26, 29, 2, 15, 22, 19, 23, 20, 9, 28, 4, 31, 9, 3, 11, 6, 15, 12, 8, 0, 5, 32, 17, 33, 24, 1, 17, 7, 12, 12, 13, 20, 12, 11, 32, 32, 21, 30, 6, 27, 17, 22, 28, 20, 15, 29)
day4 <- c(6, 22, 19, 26, 31, 26, 2, 7, 19, 25, 25, 17, 5, 36, 11, 35, 12, 12, 6, 13, 10, 4, 2, 1, 3, 28, 23, 30, 29, 2, 20, 10, 5, 22, 7, 23, 11, 6, 35, 35, 18, 19, 7, 24, 18, 17, 28, 18, 15, 31)
day5 <- c(4, 23, 18, 19, 24, 23, 3, 1, 25, 18, 29, 12, 11, 29, 5, 24, 13, 3, 0, 12, 9, 14, 4, 6, 1, 28, 23, 33, 26, 1, 14, 8, 17, 22, 10, 24, 6, 6, 37, 33, 22, 21, 17, 18, 13, 21, 26, 12, 10, 24)
day6 <- c(2, 29, 22, 21, 36, 22, 4, 15, 24, 22, 30, 22, 9, 31, 5, 25, 6, 8, 4, 13, 7, 17, 4, 3, 5, 27, 17, 28, 31, 7, 19, 15, 17, 13, 6, 25, 5, 2, 41, 27, 26, 19, 11, 28, 10, 15, 17, 19, 14, 20)
day7 <- c(0, 25, 17, 25, 37, 29, 2, 11, 23, 22, 17, 20, 9, 30, 15, 36, 12, 6, 11, 11, 18, 7, 11, 1, 5, 27, 22, 26, 28, 4, 13, 5, 4, 12, 2, 21, 10, 5, 42, 35, 22, 26, 14, 24, 7, 23, 25, 17, 2, 25)

values <-c("employee_1","employee_2","employee_3","employee_4","employee_5","employee_6","employee_7","employee_8","employee_9","employee_10","employee_11","employee_12","employee_13","employee_14","employee_15","employee_16","employee_17","employee_18","employee_19","employee_20","employee_21","employee_22","employee_23","employee_24","employee_25","employee_26","employee_27","employee_28","employee_29","employee_30","employee_31","employee_32","employee_33","employee_34","employee_35","employee_36","employee_37","employee_38","employee_39","employee_40","employee_41","employee_42","employee_43","employee_44","employee_45","employee_46","employee_47","employee_48","employee_49","employee_50")
li_df <- data.frame(day1, day2, day3, day4, day5, day6, day7)
head(li_df)
rownames(li_df) <-values

#Select the entire second column, named day2, from the li_df data frame as a vector and assign it to second.
#Use second to create a logical vector, that contains TRUE if the corresponding number of views is strictly
#greater than 25 or strictly lower than 5 and FALSE otherwise. Store this logical vector as extremes.
#Use sum() on the extremes vector to calculate the number of TRUEs in extremes, 
#i.e. to calculate the number of employees that are either very popular or very low-profile. 
#Simply print this number to the console.

# li_df is pre-loaded in your workspace

# Select the second column, named day2, from li_df: second
second <- li_df["day2"]

# Build a logical vector, TRUE if value in second is extreme: extremes
extremes <- second > 25 | second < 5

# Count the number of TRUEs in extremes
sum(extremes)

###Conditional Statements###
###if(condition){
###expr
###}


x <- -5
if(x<0){
  print("x is a negative number")
}

##else statement
#if(condition){
#  expr1
#} else {
#  expr2
#}

x <- -3

if(x < 0){
  print("x is a negative number")
} else{
  print("x is either a positive number or zero")
}

x <- -3

if(x < 0){
  print("x is a negative number")
} else if (X %% 3 ==0){
  print("divisible by 3")
} else {
  print("not divisible by 2 nor by 3...")
}

#9. The if Statement

#Instructions

# Variables related to your last day of recordings
medium <- "LinkedIn"

#Examine the if statement that prints out "Showing LinkedIn information" if the medium variable equals "LinkedIn". 
#Try to see what happens if you change the value of medium and num_views.
#Code an if statement that prints "You're popular!" to the console if the num_views variable exceeds 15.

# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Examine the if statement for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
}

# Write the if statement for num_views
if(num_views > 15){
  print("You're popular!")
}

#10. Add an Else
#Add an else statement to both control structures, such that

#"Unknown medium" gets printed out to the console when the if-condition on medium does not hold.
#R prints out "Try to be more visible!" when the if-condition on num_views is not met.

# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Control structure for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else {
  print("Unknown medium")
}

# Control structure for num_views
if (num_views > 15) {
  print("You're popular!")
} else {
  print("Try to be more visible!")
}

##11. Customize further: else if

#INsTRUCTIONS##
#Add code to both control structures such that:
  
#R prints out "Showing Facebook information" if medium is equal to "Facebook". Remember that R is case sensitive!
#"Your number of views is average" is printed if num_views is between 15 (inclusive) and 10 (exclusive). 
#Feel free to change the variables medium and num_views to see how the control structure respond. In both cases, the existing code should be extended in the else if statement. No existing code should be modified


# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Control structure for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else if (medium == "Facebook") {
  print("Showing Facebook information")
  # Add code to print correct string when condition is True
  
} else {
  print("Unknown medium")
}

# Control structure for num_views
if (num_views > 15) {
  print("You're popular!")
} else if (num_views <= 15 & num_views > 10) {
  # Add code to print correct string when condition is TRUE
  print("Your number of views is average")
} else {
  print("Try to be more visible!")
}

##12. Else if 2.o

##INSTRUCTIONS###
#Have a look at the following statements:
  
# (1) If number is set to 6, "small" gets printed to the console.
#(2) If number is set to 100, R prints out "medium".
#(3) If number is set to 4, "extra small" gets printed out to the console.
#(4) If number is set to 2500, R will generate an error, as result will not be defined.

number <- 6 #(1)
number <- 100 #(2)
number = 4 #(3)
number = 2500 #(4)
if (number < 10) {
  if (number < 5) {
    result <- "extra small"
  } else {
    result <- "small"
  }
} else if (number < 100) {
  result <- "medium"
} else {
  result <- "large"
}
print(result)

##13. TAKE CONTROL

#Write a complete control-flow construct with the following behavior:
  
#If both li and fb are at least 15, set sms equal to double the sum of li and fb.
#If both li and fb are below 10 (exclusive), set sms equal to half the sum of li and fb.
#In all other cases, set sms equal to the sum of li and fb.
#Finally, print the resulting sms variable to the console.

# Variables related to your last day of recordings
li <- 15
fb <- 9

# Code the control-flow construct
if(li >= 15 & fb >= 15){
  sum <- 2 * (li + fb)
} else if(li < 10 & fb < 10){
  sum <- 0.5 * (li + fb)
} else {
  sms <- li + fb
}

# Print the resulting sms to the console
print(sms)

####WHILE LOOP####

#while(control){
# expr
#}

ctr <- 1

while(ctr <= 7){
  print(paste("ctr is set to", ctr))
  ctr <- ctr + 1
}

ctr  #Now the ctr value is 8

#infinite while loop
#make sure something will stop the while statement

ctr <- 1

while(ctr <= 7){
  if(ctr %% 5 ==0){
    break
  }
print(paste("ctr is set to",ctr))
ctr <- ctr + 1
}

ctr

##14. Write a while loop
#Instructions#
#Code a while loop with the following characteristics:
#  The intial value of speed is 64.
#As long as speed is higher than 30, print out the sentence "Slow down!".
#At every run of the while loop, decrease the speed by 7 units. 
#Don't forget this step! Finally, print out the final value of speed and see if it matches your expectations.

# Initialize the speed variable
speed <- 64

# Code the while loop
while(speed > 30){
  print ("Slow down!")
  speed = speed - 7
}

# Print out the speed variable
print(speed)

# Initialize the speed variable
speed <- 64

##15. Throw in more conditionals
##Instructions



# Initialize the speed variable
speed <- 64

# Extend/adapt the while loop
while (speed > 30) {
  print(paste("Your speed is",speed))
  if (speed > 48) {
    print("Slow down big time!")
    speed <- speed - 11
  } else {
    print("Slow down!")
    speed <- speed - 6
  }
}



###Stop the while loop: break

## There are some very rare situations in which severe speeding is necessary: 
## what if a hurricane is approaching and you have to get away as quickly as possible? 
## You don't want the driver assistant send you speeding notifications in that scenario, right?

## This seems like a great opportunity to include the break statement in the while loop you've been working on. 
## Remember that the break statement is a control statement. 
## When R encounters it, the while loop is abandoned completely.

## 16. Adapt the while loop such that it is abandoned when the speed of the vehicle is greater than 80. 
## This time, the speed variable has been initialized to 88; keep it that way.

## Initialize the speed variable 
speed <- 88


while (speed > 30){
  print(paste("Your speed is ",speed))
  
  ## Break the while loop when speed exceeds 80
  if(speed > 80){
    break;
  }
  if (speed > 48){
    print("Slow down big time!")
    speed <- speed - 11
  } else {
    print("Slow Down!")
    speed <- speed - 6
  }
}

## 17. Build a while loop from scratch

## The previous exercises guided you through developing a pretty advanced while loop, 
## containing a break statement and different messages and updates as determined by control 
## flow constructs. If you manage to solve this comprehensive exercise using a while loop, 
## you're totally ready for the next topic: the for loop.


## INSTRUCTIONS: 
## Finish the while loop so that it:

## prints out the triple of i, so 3 * i, at each run.
## is abandoned with a break if the triple of i is divisible by 8, 
## but still prints out this triple before breaking.

# Initialize i as 1 
i <- 1

# Code the while loop
while (i <= 10) {
  print( 3*i )
  if ( 3 *i %% 8 == 0) {
    print(i)
    break
  }
  i <- i + 1
}

## FOR LOOP

## for (var in seq ){
##  expr
## }

cities <- c("New York", "Paris", "London", "Tokyo", "Rio de Jeneiro", "Cape Town")

cities

for (city in cities){
  print (city)
}

## FOR LOOP OVER LIST

cities <- list("New York", "Paris", "London", "Tokyo", "Rio de Jeneiro", "Cape Town")

for(city in cities){
  print (city)
}

## BREAK STATEMENT IN FOR LOOP

for (city in cities){
  if(nchar(city) == 6){
    break;
  }
  print(city)
}


## NEXT STATEMENT IN FOR LOOP


for (city in cities){
  if(nchar(city) == 6){
    next;
  }
  print(city)
}

## MANUAL LOOPING INDEX FOR LOOP
length(cities)

for(i in 1:length(cities)){
  print(paste(cities[i], "is on position", i, "in the cities vector."))
}

## 18. LOOP OVER A VECTOR

primes <- c(2, 3, 5, 7, 11, 13)

## Loop version 1
for(p in primes){
  print(p)
}

## Loop version 2
for (i in 1:length(primes)){
  print(primes[i])
}

## INSTRUCTIONS

## Write a for loop that iterates over all the elements of linkedin and prints out every element separately. 
## Do this in two ways: using the loop version 1 and the loop version 2 in the example code above.


# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)


## LOOP VERSION 1

for (link in linkedin){
  print(link)
}

## LOOP VERSION 2

for(i in 1:length(linkedin)){
  print(linkedin[i])
}


## 19. LOOPING OVER A LIST

prime_list <- list(2, 3, 5, 7, 9, 11)

## loop version 1
for (p in prime_list){
  print(p)
}

## loop version 2
for (i in 1:length(prime_list)){
  print(prime_list[[i]])
}

## INSTRUCTIONS

## As the previous exercise, loop over nyc list in two different ways:

## Loop directly over the nyc (loop version 1)
## Define a looping index and subsetting using double brackets (loop version 2)

# The nyc list is already decided

nyc <- list(pop = 8405837, boroughs = c("Manhattan", " Bronx", "Brooklyn", "Queens", "Staten Island"),
            capital = FALSE)


## Loop version 1

for (ny in nyc){
  print(nyc)
}

length(nyc)
## Loop Version 2

for(i in 1:length(nyc)){
  print(nyc[[i]])
}


## 20. LOOP OVER A MATRIX

## In your workspace, there's a matrix ttt, that represents the status of a tic-tac-toe game. 
## It contains the values "X", "O" and "NA". Print out ttt in the console so you can have a closer look. 
## On row 1 and column 1, there's "O", while on row 3 and column 2 there's "NA".
## To solve this exercise, you'll need a for loop inside a for loop, often called a nested loop. 
## Doing this in R is a breeze! Simply use the following recipe:


## INSTRUCTIONS

## Finish the nested for loops to go over the elements in ttt:

## The outer loop should loop over the rows, with loop index i (use 1:nrow(ttt)).
## The inner loop should loop over the columns, with loop index j (use 1:ncol(ttt)).
## Inside the inner loop, make use of print() and paste() to print out information 
## in the following format: "On row i and column j the board contains x", where x is the value on that position.

ttt = matrix(c("O", NA, "X", NA, "O", "O", "X", NA, "X"), nrow= 3)

ttt

# The tic-tac-toe matrix ttt has already been defined for you
ttt
# define the double for loop
for ( i in 1:nrow(ttt)) {
  for ( j in 1:ncol(ttt)) {
    print(paste("On row", i, "and column", j, "the board contains", ttt[i,j]))
  }
}


## 21. MIX IT UP WITH CONTROL FLOW

##INSTRUCTIONS

# Add code to the for loop that loops over the elements of the linkedin vector:
# If the vector element's value exceeds 10, print out "You're popular!".
# If the vector element's value does not exceed 10, print out "Be more visible!"

# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Code the for loop with conditionals
for (li in linkedin) {
  if ( li > 10 ) {
    print ("You're popular!")
    
  } else {
    print("Be more visible!")
    
  }
  print(li)
}

## 22. NEXT, YOU BREAK IT

## Extend the for loop with two new, separate, if tests in the editor as follows:

# If the vector element's value exceeds 16, print out "This is ridiculous, I'm outta here!" 
# and have R abandon the for loop (break).
# If the value is lower than 5, print out "This is too embarrassing!" and fast-forward to the next iteration (next).

# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Extend the for loop
for (li in linkedin) {
  if (li > 10) {
    print("You're popular!")
  } else {
    print("Be more visible!")
  }
  
  # Add if statement with break
  if (li > 16){
    print("This is ridiculous, I'm outta here!")
    break
  }
  # Add if statement with next
  if(li < 5){
    print("This is too embarrassing!")
    next
  }
  print(li)
}

## 23. BUILD A FOR LOOP FROM SCRATCH

# This exercise will not introduce any new concepts on for loops.

# In the editor on the right, we already went ahead and defined a variable rquote. 
# This variable has been split up in a vector that contains separate letters and 
# stored in a vector chars with the strsplit() function.

# Can you write code that counts the number of r's that come before the first u in rquote?


## INSTRUCTIONS

# Initialize the variable rcount, as o.
# Finish the For Loop:
# If char equals "r", increase the value of `rcount` by 1
# If char equals "u", leave the for loop entirely with a `breal`
# Finally put out the variable `rcount` to the console to see if your code is correct.

# Pre-defined variables
rquote <- "r's internals are irrefutably intriguing"
chars <- strsplit(rquote, split = "")[[1]]

chars

# Pre-defined variables
rquote <- "r's internals are irrefutably intriguing"
chars <- strsplit(rquote, split = "")[[1]]

# Initialize rcount
rcount <- 0

# Finish the for loop
for (char in chars) {
  if (char == 'r') {
    rcount = rcount + 1
  }
  
  if (char == 'u') break
}

# Print out rcount
print(rcount)


##############################################
##########   FUNCTIONS #######################
##############################################


## Create a list()
## Define a variable; print ()

sd(c(1, 5, 6, 7))
values <- c(1, 5, NA, 6, 7)
sd(values, na.rm = TRUE)

help(sd)
?sd
args(sd)


## 22. FUNCTION  DOCUMENTATION ###

# Consult the documentation on the mean() function: ?mean or help(mean).
# Inspect the arguments of the mean() function using the args() function.

# Consult the documentation on the mean() function
help(mean)

# Inspect the arguments of the mean() function
args(mean)


## 23. USE A FUNCTION

## Calculate the average number of views for both linkedin and facebook and assign the 
## result to avg_li and avg_fb, respectively. Experiment with different types of argument matching!
## Print out both avg_li and avg_fb.

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Calculate average number of views
avg_li <- mean(linkedin)
avg_fb <- mean(facebook)


# Inspect avg_li and avg_fb
print(avg_li)
print(avg_fb)


## 24. USE A FUNCTION(2)

# Calculate the mean of the element-wise sum of linkedin and facebook and store the result in a variable avg_sum.
# Calculate the mean once more, but this time set the trim argument equal to 0.2 
# and assign the result to avg_sum_trimmed.
# Print out both avg_sum and avg_sum_trimmed; can you spot the difference?

help(mean)

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Calculate the mean of the sum
avg_sum <- mean(linkedin + facebook)

# Calculate the trimmed mean of the sum
avg_sum_trimmed <- mean (linkedin + facebook, trim = 0.2)

help(mean)

# Inspect both new variables
print (avg_sum)
print(avg_sum_trimmed)

## 25. USE A FUNCTION (3)

# Calculate the average number of LinkedIn profile views, without specifying any optional arguments. 
# Simply print the result to the console.
# Calculate the average number of LinkedIn profile views, 
# but this time tell R to strip missing values from the input vector.

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, NA, 17, 14)
facebook <- c(17, NA, 5, 16, 8, 13, 14)

# Basic average of linkedin
mean(linkedin)

# Advanced average of linkedin
mean(linkedin, na.rm=TRUE)


## 26. FUNCTIONS INSIDE FUNCTIONS

## Use abs() on linkedin - facebook to get the absolute differences between the daily 
## Linkedin and Facebook profile views. Next, use this function call inside 
## mean() to calculate the Mean Absolute Deviation. In the mean() call, 
# make sure to specify na.rm to treat missing values correctly!


# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, NA, 17, 14)
facebook <- c(17, NA, 5, 16, 8, 13, 14)

# Calculate the mean absolute deviation
mean(abs(linkedin - facebook),na.rm=TRUE)


## 27. REQUIRED OR OPTIONAL
# Which of the following statements about the read.table() function are true?

# (1) header, sep and quote are all optional arguments.
# (2) row.names and fileEncoding don't have default values.
# (3) read.table("myfile.txt", "-", TRUE) will throw an error.
# (4) read.table("myfile.txt", sep = "-", header = TRUE) will throw an err

## args(read.table)

## (1) & (3) are right answers

#### WRITING FUNCTONS ######
#### The triple() function 

triple <-  function(x){
  3 * x
}

ls()

triple(6)

triple <- function(x){
  y <- 3 * x
  print(y)
}


math_magic <- function(a, b){
  a*b + a/b
}

math_magic(2,4)

### SETTING THE DEFAULT FUNCTION ## 

math_magic <- function(a, b=1){
  a*b + a/b
}

math_magic(4)


## 28. WRITING YOUR OWN FUNCTION ##

## Create a function pow_two(): it takes one argument and returns that number squared (that number times itself).
## Call this newly defined function with 12 as input.
## Next, create a function sum_abs(), that takes two arguments and returns the sum of the absolute values of both arguments.
## Finally, call the function sum_abs() with arguments -2 and 3 afterwards.

# Create a function pow_two()

pow_two <- function(a){
  c <- a * a
  return(c)
}

# Use the function 
pow_two(12)

# Create a function sum_abs()

sum_abs <- function(a, b){
  c <- abs(a) + abs(b)
  return(c)
}


# Use the function
sum_abs(-2, 3)


## 29. WRITING YOUR OWN FUNCTION (2)

# There are situations in which your function does not require an input. 
# Let's say you want to write a function that gives us the random outcome of throwing a fair dice:

throw_dice <- function(){
  number <- sample(1:6, size = 1)
  number
}

throw_dice()

# INSTRUCTIONS #

# Define a function, hello(). It prints out "Hi there!" and returns TRUE. It has no arguments.
# Call the function hello(), without specifying arguments of course.

# Define the function hello()

hello <- function(){
  print("Hi there!")
  return(TRUE)
}



# Call the function hello()
hello()


### 30. WRITING YOUR OWN FUNCTION (3) ##

### INSTRUCTIONS ####

# Add an optional argument, named print_info, that is TRUE by default.
# Wrap an if construct around the print() function: this function should only be executed if print_info is TRUE.
# Feel free to experiment with the pow_two() function you've just coded.


pow_two <- function(x, print_info=TRUE){
  y <- x ^ 2 
  if(print_info == TRUE){
    print(paste(x, "to the power two equals", y))
  }
  return(y)
}

pow_two(4)


#### FUNCTION SCOPING ####

## It implies that the variables that are defined inside a function are not accessible outside the function.

pow_two <- function(x) {
  y <- x ^ 2 
  return(y)
}
pow_two(4)
y 
x

two_dice <- function() {
  possibilites = 1:6
  dice1 <- sample(possibilities, size = 1)
  dice2 <- sample(possibilities, size = 1)
  dice1 + dice2
}

## Executing two_dice() causes an error. 1
## Executing res <- two_dice() makes the contents of dice1 and dice2 available outside the function. 2
## Whatever the way of calling the two_dice() function, R won't have access to dice1 and dice2 outside the function. (ANSWER)


### 31. R PASSES ARGUMENTS BY VALUE

tripe <- function(x) {
  x <-  3*X
  x
}

a <- 5
triple(a)
a


## Inside the triple() function, the argument `x` gets overwritten with its value times there. 
## Afterwards this new `x` is returned. If you call this function with a variable `a` equal to 5 
## you obtain 15. But did the value of `a` change? If R were to pass `a` to `triple()` by reference
## the override of `x` inside the function would ripple through to the variable `a`, outside the 
## function. However R passes `by value`, so the R objects you pass to a function can never change
## unless you do an explicit assignment. `a` remain equal to 5, even after calling `triple(a)`

## Can you tell which one of the following statements is `false` about the following piece of code?

increment <- function(x, inc = 1){
  x <- x + inc
  x
}

count <- 5
a <- increment(count, 2)
b <- increment(count)
count <- increment(count,2)
a
b
count


## a and b equal 7 and 6 respectively after executing this code block. 1
## After the first call of increment(), where a is defined, a equals 7 and count equals 5. 2
## In the end, count will equal 10. 3 (ANSWER)
## In the last expression, the value of count was actually changed because of the explicit assignment.


## 32. R YOU FUNCTIONAL ?

## INSTRUCTIONS
## Finish the function definition for `interpret()`, the interprets the number of profile views
## on a single day:
## The funtion takes one argument, `num_views`
## If `num_views` is greater than 15, the function prints out "You're popular!" to the console
## and return `num_views`.
## Else, the function prints out "Try to be more visible!" and return 0.
## Finally, call the `interpret()` function twice: on the first value of the `linkedin` vector
## and on the second element of the `facebook` vector

linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Define the interpret function
interpret <- function(num_views){
  if(num_views > 15) {
    print("You're popular!")
    return (num_views)
  } else {
    print("Try to be more visible!")
    return(0)
  }
}

interpret(linkedin[1])
interpret(facebook[2])

## 33. R YOU FUNCTIONAL? (2)

##INSTRUCTIONS

## Finish the template for the interpret_all() function:
  
##  Make return_sum an optional argument, that is TRUE by default.
## Inside the for loop, iterate over all views: on every iteration, 
## add the result of interpret(v) to count. Remember that interpret(v) 
## returns v for popular days, and 0 otherwise. At the same time, 
## interpret(v) will also do some printouts.
## Finish the if construct:
##  If return_sum is TRUE, return count.
## Else, return NULL.
## Call this newly defined function on both linkedin and facebook.


# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# The interpret() can be used inside interpret_all()
interpret <- function(num_views) {
  if (num_views > 15) {
    print("You're popular!")
    return(num_views)
  } else {
    print("Try to be more visible!")
    return(0)
  }
}

# Define the interpret_all() function
# views: vector with data to interpret
# return_sum: return total number of views on popular days?

interpret_all <- function(views, return_sum = TRUE){
  count <- 0
  
  for(v in views){
    count <- count + interpret(v)
    
  }
  
  if(return_sum == TRUE){ 
    return (count)
  } else {
    return (NULL)
  }
}

interpret_all(linkedin)
interpret_all(facebook)


### R Packages

## Install.packages: install.packages()
## Load Packages: library(), require()
## Load Package = attach package to search list
## search()
search()


## 34. LOAD AN R PACKAGE

## There are basically two extremely important functions when it comes down to R packages:

## install.packages(), which as you can expect, installs a given package.
## library() which loads packages, i.e. attaches them to the search list on your R workspace.
## To install packages, you need administrator priviliges. 
## This means that install.packages() will thus not work in the DataCamp interface. 
## However, almost all CRAN packages are installed on our servers. 
## You can load them with library().

## In this exercise, you'll be learning how to load the ggplot2 package, 
## a powerful package for data visualization. You'll use it to create a plot of 
## two variables of the mtcars data frame. The data has already been prepared for 
## you in the workspace.


## INSTRUCTIONS
# Before starting, have a look at the currently attached packages.
# Next, try to use the qplot() function with wt and hp as the first and second argument.
# To fix the error that occurs, load the ggplot2 package.
# Now, retry calling the qplot() function with the same arguments.
# Finally, check out the currently attached packages again.

## The mtcars vectors have already been prepare for you
library(ggvis)
wt <- mtcars$wt
hp <- mtcars$hp

# Request the currently attached packages
search()

# Try the qplot() function with wt and hp
qplot(wt, hp)

# Load the ggplot2 package
# install.packages('ggplot2')
library(ggplot2)

## Retry qplot() functiom
qplot(wt, hp)

## Check out the currently attached package again
search()

## Load the ggplot2 package
# Load the ggplot2 package
# install.packages('ggplot2')
library(ggplot2)

## Retry the qplot() function
qplot(wt, hp)

## Check out the currently attached packages again
search()


## 35. DIFFERENT WAYS TO LOAD A PACKAGE

# ave a look at some more code chunks that (attempt to) load one or more packages:
  
# Chunk 1
install.packages('data.table')
library(data.table)
require(ggvis)

# Chunk 2
library("data.table")
require(ggvis)

# Chunk 3
library(data.table)
require(ggvis, character.only = TRUE)

# Chunk 4
library(c("data.table", "ggvis"))

###########################################################
######### CHAPTER THREEL: THE APPLY FAMILY ################
###########################################################

### LAPPLY####

nyc <- list(pop = 8405837, 
            boroughs = c("Manhattan", "Bronx", "Brooklyn", 
                         "Queens", " Staten Island"),
            capital = FALSE)

## NYC: For
for(info in nyc){
  print(class(info))
}

## NYC: lapply()
lapply(nyc, class)

## Cities: for
cities <- c("Newyork", "Paris", "London", "Tokyo", "Rio de Janeiro", "Cape Town")

num_chars <- c()
for(i in 1:length(cities)){
  num_chars[i] <- nchar(cities[i])
}
num_chars

## CIties:lapply(
lapply(cities, nchar)

## Always lapply() returns a list
## inorder to convert to vector
## simply wrap `unlist()`

unlist(lapply(cities, nchar))

## Oil price example for lapply() using functions

oil_prices <- list(2.37, 2.49, 2.18, 2.22, 2.47, 2.32)

# function triple
triple <- function(x){
  3*x
}

# Now lapply
result <- lapply(oil_prices, triple)

## Lets make 'Triple' function more Generic called 'multiply'
multiply <- function(x, factor){
  x * factor
}

## Now lapply by ADDING additional arguments

times3 <- lapply(oil_prices, multiply, factor = 3)
unlist(times3)

times4 <- lapply(oil_prices, multiply, factor = 4)
unlist(times4)


### 36. USE LAPPLY WITH A BUILT-IN R FUNCTION

## The Usage section shows the following expession:
## lapply(X, FUN, ....), If FUN requires additional arguments, 
## you pass them after you've specified X and FUN (...). 
## The output of lapply() is a list, the same length as X, 
## where each element is the result of applying FUN on the corresponding element of X.

## INSTRUCTIONS ##

## Have a look at the strsplit() calls, that splits the strings in pioneers on the : sign. 
## The result, split_math is a list of 4 character vectors: the first vector 
## element represents the name, the second element the birth year.
## Use lapply() to convert the character vectors in split_math to lowercase letters: 
## apply tolower() on each of the elements in split_math. 
## Assign the result, which is a list, to a new variable split_low.
## Finally, inspect the contents of split_low with str().

## The vector pioneers has already been created for you
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")

## Split names from birth year
split_math <- strsplit(pioneers, split = ':')
split_math

## Convert to lowercase strings: split_low
split_low <- lapply(split_math, tolower)


# Take a look at the structure of split_low
str(split_low)


### 37. USE LAPPLY WITH YOUR OWN FUNCTION ###

## INSTRUCTIONS ##

## Apply select_first() over the elements of split_low with lapply() and 
## assign the result to a new variable names.
## Next, write a function select_second() that does the exact same thing 
## for the second element of an inputted vector.
## Finally, apply the select_second() function over split_low and assign 
## the output to the variable years.

# Code from previous exercise:
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Write function select_first()
select_first <- function(x){
  x[1]
}

## Apply select_first() over split_low: names
names <- lapply(split_low, select_first)

## Write function select_second()
select_second <- function(x){
  x[2]
}

## Apply select second() over split_low: years
years <- lapply(split_low, select_second)


### 38. LAPPLY AND ANONYMOUS FUNCTIONS ####

## Previously, you learned that functions in R are objects in their own right. 
## This means that they aren't automatically bound to a name. When you create a function, 
## you can use the assignment operator to give the function a name. 
## It's perfectly possible, however, to not give the function a name. 
## This is called an anonymous function:


# Named function
triple <- function(x){ 3 * x}

# Anonymous function with same implementation
# function(x) {(3 * x}

# Use anonymous function inside lapply()
lapply(list(1, 2, 3), function(x){ 3 * x})

### INSTRUCTIONS ### 

## Transform the first call of lapply() such that it uses an anonymous function 
## that does the same thing.
## In a similar fashion, convert the second call of lapply to use an 
## anonymous version of the select_second() function.
## Remove both the definitions of select_first() and select_second(), 
## as they are no longer useful.

# Definition of split_low
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Transform: use anonymous function inside lapply
names <- lapply(split_low, function(x) {x[1]})

# Transform: use anonymous function inside lapply
years <- lapply(split_low, function(x){x[2]})


### 39. USE LAPPLY WITH ADDITIONAL ARGUMENTS 

##  multiply() function to allow for a more generic approach.
## lapply() provides a way to handle functions that require more than one argument, 
## such as the multiply() function:


multiply <- function(x, factor) {
  x * factor
}
lapply(list(1,2,3), multiply, factor = 3)

## INSTRUCTIONS ###

## Use lapply() twice to call select_el() over all elements in split_low: 
## once with the index equal to 1 and a second time with the index equal to 2. 
## Assign the result to names and years, respectively.

# Definition of split_low
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split=':')
split_low <- lapply(split, tolower)

# Generic selection function
select_el <- function(x, index){
  x[index]
}

# Use `lapply()` twice on split_low: names and years

names <- lapply(split_low, select_el, index = 1)
years <- lapply(split_low, select_el, index = 2)

## 40. APPLY FUNCTIONS THAT RETURN NULL

lapply(list(1, "a", TRUE), str)
str(TRUE)

# Definition of split_low
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split=':')
split_low <- lapply(split, tolower)

lapply(split_low, function(x) {
  if (nchar(x[1]) > 5) {
    return(NULL)
  } else {
    return(x[2])
  }
})


## list(NULL, NULL, "1623", "1857") 1
## list("gauss", "bayes", NULL, NULL) 2
## list("1777", "1702", NULL, NULL) 3 (ANSWER)
## list("1777", "1702")


######### SAPPLY ################3

## lapply()
### - Apply function over list or vector
### - function can return R objects of different classes
### - List necessary to store heterogeneous content
### - However, often homogeneous content.

cities <- c("New York", "Paris", "London", "Tokyo", 
            "Rio de Jeneiro", "Cape Town")
unlist(lapply(cities, nchar))

## lets use sapply() in short SIMPLIFIED APPLY FUNCTION
sapply(cities, nchar)

## IF you do not want to name the arguments USE.NAMES = FALSE
sapply(cities, nchar, USE.NAMES = FALSE)


## Cities: Complex example

first_and_last <- function(name) {
  name <- gsub(" ","", name)
  letters <- strsplit(name, split="")[[1]]
  c(first = min(letters), last = max(letters))
}

first_and_last("New York")

## Simplify for two matrix
sapply(cities, first_and_last)

## Unable to simplify
unique_letters <- function(name){
  name <- gsub(" ", "", name)
  letters <- strsplit(name, split="")[[1]]
  unique(letters)
}

unique_letters("London")

## strange result by using lapply()
lapply(cities, unique_letters)
sapply(cities, unique_letters)


### 41. HOW TO USE SAPPLY 

## INSTRUCTIONS## 

## Use lapply() to calculate the minimum (built-in function min()) 
## of the temperature measurements for every day.
## Do the same thing but this time with sapply(). See how the output differs.
## Use lapply() to compute the the maximum (max()) temperature for each day.
## Again, use sapply() to solve the same question and see how lapply() and sapply() differ.

# temp has already been defined in the workspace

temp <- list(c(3, 7, 9, 6, -1), c(6, 9, 12, 13, 5), c(4, 8, 3, -1, -3), c(1, 4, 7, 2, -2),
             c(5, 7, 9, 4, 2), c(-3, 5, 8, 9, 4), c(3, 6, 9, 4, 1))
class(temp)
str(temp)

# Use lapply() to find each day's minimum temperature
lapply(temp, min)

# Use sapply() to find each day's minimum temperature
sapply(temp, min)

# Use lapply() to find each day's maximum temperature
lapply(temp, max)

# Use sapply() to find each day's maximum temperature
sapply(temp, max)


## 42. SAPPLY WITH YOUR OWN FUNCTION

temp <- list(c(3, 7, 9, 6, -1), c(6, 9, 12, 13, 5), c(4, 8, 3, -1, -3), c(1, 4, 7, 2, -2),
             c(5, 7, 9, 4, 2), c(-3, 5, 8, 9, 4), c(3, 6, 9, 4, 1))

## INSTRUCTIONS ##

# Finish the definition of extremes_avg(): it takes a vector of temperatures and 
# calculates the average of the minimum and maximum temperatures of the vector.
# Next, use this function inside sapply() to apply it over the vectors inside temp.
# Use the same function over temp with lapply() and see how the outputs differ.

# temp is already defined in the workspace

# Finish function definition of extremes_avg
extremes_avg <- function(x) {
  ( min(x) + max(x)) / 2
}

# Apply extremes_avg() over temp using sapply()
sapply(temp, extremes_avg)

# Apply extremes_avg() over temp using lapply()
lapply(temp, extremes_avg)


## 43. SAPPLY WITH FUNCTION RETURNING VECTOR

## INSTRUCTIONS ##

## Finish the definition of the extremes() function. It takes a vector of numerical values 
## and returns a vector containing the minimum and maximum values of a given vector, 
## with the names "min" and "max", respectively.
## Apply this function over the vector temp using sapply().
## Finally, apply this function over the vector temp using lapply() as well.

# temp is already available in the workspace

temp <- list(c(3, 7, 9, 6, -1), c(6, 9, 12, 13, 5), c(4, 8, 3, -1, -3), c(1, 4, 7, 2, -2),
             c(5, 7, 9, 4, 2), c(-3, 5, 8, 9, 4), c(3, 6, 9, 4, 1))

# Create a function that returns min and max of a vector: extremes
extremes <- function(x){
  c(min = min(x), max = max(x))
}

# Apply extremes() over temp with sapply()
sapply(temp, extremes)

# Apply extremes() over temp with lapply()
lapply(temp, extremes)


## 44. SAPPLY CAN'T SIMPLIFY, NOW WHAT?

## INSTRUCTIONS ##

## Apply below_zero() over temp using sapply() and store the result in freezing_s.
## Apply below_zero() over temp using lapply(). 
## Save the resulting list in a variable freezing_l.
## Compare freezing_s to freezing_l using the identical() function.

# temp is already prepared for you in the workspace
temp <- list(c(3, 7, 9, 6, -1), c(6, 9, 12, 13, 5), c(4, 8, 3, -1, -3), c(1, 4, 7, 2, -2),
             c(5, 7, 9, 4, 2), c(-3, 5, 8, 9, 4), c(3, 6, 9, 4, 1))


# Defintion of below_zero()
below_zero <- function(x){
  return(x[x < 0])
}

# Apply below_zero over temp using sapply(): freezing_s
freezing_s <- sapply(temp, below_zero)

# Apply below_zero over temp using lapply(): freezing_l
freezing_l <- lapply(temp, below_zero)

# Are freezing_s and freezing_l identical?
identical(freezing_l, freezing_s)


## 45. SAPPLY WITH FUNCTIONS THAT RETURN NULL

# A function print_info(), that takes a vector and prints the average of this vector, 
# has already been created for you. It uses cat().

## INSTRUCTIONS ##

# Apply `print_info()` over the contents of `temp` with `sapply()`.
# Repeat this process with lapply(). Do you notice the difference?

# temp is already available in the workspace.
temp <- list(c(3, 7, 9, 6, -1), c(6, 9, 12, 13, 5), c(4, 8, 3, -1, -3), c(1, 4, 7, 2, -2),
             c(5, 7, 9, 4, 2), c(-3, 5, 8, 9, 4), c(3, 6, 9, 4, 1))


# Definition of print_info()
print_info <- function(x){
  cat("The average temperature is", mean(x), "\n")
}

# Apply print_info() over temp using lapply()
lapply(temp, print_info)

# Apply print_info() over temp using sapply()
sapply(temp, print_info)

identical(sapply, lapply)


## 46. REVERSE ENGINEERING SAPPLY

sapply(list(runif(10), runif(10)),
       function(x) c(min=min(x), mean = mean(x), max = max(x)))

lapply(list(runif(10), runif(10)),
       function(x) c(min=min(x), mean = mean(x), max = max(x)))


# Without going straight to the console to run the code, 
# try to reason which of the following statements are correct and why.

# (1) sapply() can't simplify the result that lapply() would return, 
# and thus returns a list of vectors.
# (2) This code generates a matrix with 3 rows and 2 columns. (ANSWER)
# (3) The function that is used inside sapply() is anonymous. (ANSWER)
# (4) The resulting data structure does not contain any names.

# Select the option that lists all correct statements. (2 & 3)

####################################
########## VAPPLY ##################
####################################

## RECAP
# lapply()
# apply function over list or vector
# output generated is list

# sapply()
# apply function over list or vector
# try to SIMPLIFY list to array

# vapply()
# apply function over list or vector
# EXPLICITLY SPECIFY output format

## sapply() & vapply()

cities <- c("New York", "Paris", "London", "Tokyo",
            "Rio De Janeiro", "Cape Town")

sapply(cities, nchar)

vapply(X, FUN, FUN.VALUE, ..., USE.NAMES = TRUE)

## Prespecification is better that sapply or lapply
vapply(cities, nchar, numeric(1))

## Another example

first_and_last <- function(name) {
  name <- gsub(" ", "", name)
  letters <- strsplit(name, split = "")[[1]]
  return(c(first=min(letters), last=max(letters)))
}

sapply(cities, first_and_last)

vapply(cities, first_and_last, character(2))

vapply(cities, first_and_last, character(1)) #ERROR
vapply(cities, first_and_last, numeric(1)) #ERROR

## Another example

unique_letters <- function (name){
  name <- gsub(" ","", name)
  letters <- strsplit(name, split="")[[1]]
  return(unique(letters))
}

sapply (cities, unique_letters) #Results vector of different sizes

vapply(cities, unique_letters, character(4))


#### 47. USE VAPPLY

## INSTRUCTIONS ##

## Apply the function basics() over the list of temperatures, temp, using vapply(). 
## This time, you can use numeric(3) to specify the FUN.VALUE argument.
temp <- list(c(3, 7, 9, 6, -1), c(6, 9, 12, 13, 5), c(4, 8, 3, -1, -3), c(1, 4, 7, 2, -2),
             c(5, 7, 9, 4, 2), c(-3, 5, 8, 9, 4), c(3, 6, 9, 4, 1))

# Definition of basics()
basics <- function(x) {
  c(min = min(x), mean = mean(x), max = max(x))
}

# temp is already available in the workspace

# Definition of basics()
basics <- function(x) {
  c(min = min(x), mean = mean(x), max = max(x))
}

# Apply basics() over temp using vapply()
vapply(temp, basics, FUN.VALUE = numeric(3))


## 48. USE VAPPLY (2)

## In the video, Filip showed you that there are cases where the structure of the output of 
## the function you want to apply, FUN, does not correspond to the template you specify in 
## FUN.VALUE. In that case, vapply() will throw an error that informs you about 
## the misalignment between expected and actual output.

## INSTRUCTIONS ###

## Inspect the code on the right and try to run it. 
## If you haven't changed anything, an error should pop up. 
## That's because vapply() still expects basics() to return a vector of length 3. 
## The error message gives you an indication of what's wrong.
## Try to fix the error by editing the vapply() command.

# temp is already available in the workspace
temp <- list(c(3, 7, 9, 6, -1), c(6, 9, 12, 13, 5), c(4, 8, 3, -1, -3), c(1, 4, 7, 2, -2),
             c(5, 7, 9, 4, 2), c(-3, 5, 8, 9, 4), c(3, 6, 9, 4, 1))

# Definition of the basics() function
basics <- function(x) {
  c(min=min(x), mean=mean(x), median=median(x), max = max(x))
}

# Fix the error.
vapply(temp, basics, numeric(3))
vapply(temp, basics, FUN.VALUE = numeric(4))


## 49. FROM SAPPLY TO VAPPLY

## As highlighted before, vapply() can be considered a more robust version of sapply(), 
## because you explicitly restrict the output of the function you want to apply. 
## Converting your sapply() expressions in your own R scripts to vapply() 
## expressions is therefore a good practice (and also a breeze!).

## INSTRUCTIONS##

# Convert all the sapply() expressions on the right to their vapply() counterparts. 
# Their results should be exactly the same; you're only adding robustness. 
# You'll need the templates numeric(1) and logical(1).

# temp is already defined in the workspace 
temp <- list(c(3, 7, 9, 6, -1), c(6, 9, 12, 13, 5), c(4, 8, 3, -1, -3), c(1, 4, 7, 2, -2),
             c(5, 7, 9, 4, 2), c(-3, 5, 8, 9, 4), c(3, 6, 9, 4, 1))

# Convert to vapply() function
sapply(temp, max)
vapply(temp, max, numeric(1))

# Convert to vapply() function
sapply(temp, function(x, y){ mean(x) > y}, y = 5)
vapply(temp, function(x, y){mean(x) > y}, y = 5, FUN.VALUE= logical(1))



##################################################################
###################CHAPTER 5: UTILITIES###########################
##################################################################

# seq() funtion

seq(1,19, by = 8)

# rep() function

rep(c(2, 4, 6, 7), times=2)

rep(c(2, 4, 6, 8), each=2)

v1 <- c( 1.1, -7.1, 5.4, -2.7)
v2 <- c( -3.6, 4.1, 5.8, -8.0)

mean(c(sum(round(abs(v1)))),sum(round(abs(v2))))


li <- list( log = TRUE, ch = "hello", int_vec = sort(rep(seq(8, 2, by = -2), times = 2)))
li

seq(1, 10, by = 3)

rep(c(1) , times =3)

seq(8, 2, by = -2)

## rep( times = )

rep(c(1, 3, 5, 7), times= 2)

## rep ( each = 2)
rep(c(1, 3, 5, 7), each =2)


## sort()
sort(c(8, 6, 4, 2, 8, 6, 4, 2))

## sort( decreasing = TRUE)

sort(c(8, 6, 4, 2, 7, 4, 5, 5, 1), decreasing  = TRUE)


# str(li)
str(li)

# is.*() or as.*()
is.list(li)

li2 <- as.list(c(1, 2, 3))

is.list(li2)


# Unlist()
unlist(li)

## append(), rev()

rev(li)

str(li)

str(append(li, rev(li)))


## 50. MATHEMATICAL UTILITIES

# Have another look at some useful math functions that R features:
  
# abs(): calculate the absolute value.
# sum(): calculate the sum of all the values in a data structure.
# mean(): calculate the arithmetic mean.
# round(): Round the values to 0 decimal places by default. Try out ?
# round in the console for variations of round() and ways to change the number of digits to round to.
# As a data scientst in training, you've estimated a regression model on the sales data for the past six months. 
# After evaluating your model, you see that the training error of your model is quite regular, 
# showing both positive and negative values. The error values are already defined 
# in the workspace on the right (errors).

## INSTRUCTIONS
# Calculate the sum of the absolute rounded values of the training errors. 
# You can work in parts, or with a single one-liner. There's no need to store the result in a variable, 
# just have R print it.

# The errors has already been defined for you.
errors <- c(1.9, -2.6, 4.0, -9.5, -3.4, 7.3)

# Sum of absolute rounded values of errors
sum(abs(round(errors)))


## 51. FIND THE ERROR

# Don't edit these two lines
vec1 <- c(1.5, 2.5, 8.4, 3.7, 6.3)

# Fix the error
mean(c(abs(vec1), abs(vec2)))


## 52. DATA UTILITIES ##

#R features a bunch of functions to juggle around with data structures::
  
#  seq(): Generate sequences, by specifying the from, to and by arguments.
# rep(): Replicate elements of vectors and lists.
# sort(): Sort a vector in ascending order. Works on numerics, but also on character strings and logicals.
# rev(): Reverse the elements in a data structures for which reversal is defined.
# str(): Display the structure of any R object.
# append(): Merge vectors or lists.
# is.*(): Check for the class of an R object.
# as.*(): Convert an R object from one class to another.
# unlist(): Flatten (possibly embedded) lists to produce a vector.
# Remember the social media profile view data? Your LinkedIn and Facebook view counts for the last seven 
# days are already defined as lists on the right.


## INSTRUCTIONS 

## Convert both linkedin and facebook lists to a vector, and store them as li_vec and fb_vec respectively.
## Next, append fb_vec to the li_vec (Facebook data comes last). Save the result as social_vec.
## Finally, sort social_vec from high to low. Print the resulting vector.

# The Linkedin and Facebook vectors have been already created you

linkedin <- list(16, 9, 13, 5, 2, 17, 14)
facebook <- list(17, 7, 5, 16, 8, 13, 14)

# Convert linkedin and facebook to a vector: li_vec and fb_vec
li_vec <- as.vector(linkedin)
fb_vec <- as.vector(facebook)

# Append fb_vec to li_vec: social_vec
social_vec <- append(li_vec, fb_vec)
str(social_vec)
# Sort social_vec
sort(unlist(social_vec), decreasing = TRUE)


## 53. FIND THE ERROR (2)

# Just as before, let's switch roles. It's up to you to see what unforgivable mistakes we've made. 
# Go fix them!

## INSTRUCTIONS 

# Correct the expression. Make sure that your fix still uses the function rep() and seq()
# Fix me
seq(rep(1, 7, by = 2), times = 7)
seq(c(1), by = 7)
?rep
rep(1, 7, times = 2)
rep(seq(1, 7, by =2), times = 7)  # Correct

## 54. BEAT GAUSS USING R

##INSTRUCTIONS 

# Using the function seq(), create a sequence that ranges from 1 to 500 in increments of 3. 
# Assign the resulting vector to a variable seq1.
# Again with the function seq(), create a sequence that ranges from 1200 to 900 
# in increments of -7. Assign it to a variable seq2.
# Calculate the total sum of the sequences, either by using the sum() 
# function twice and adding the two results, or by first concatenating 
# the sequences and then using the sum() function once. Print the result to the console.

# Create first sequence: seq1
seq1 <- seq(1, 500, by = 3)

# Create second sequence: seq2
seq2 <- seq(1200, 900, by = -7)

# Calculate total sum of the sequences
sum(seq1, seq2)


### REGULAR EXPRESSIONS ####

# 1. Sequence of (meta) characters
# 2. Pattern existence.
# 3. Pattern Replacement
# 4. Pattern Extraction
# 5. grep(), grepl()
# 6. sub(), gsub()


# GREPL() - Vector of logicals
animals <- c("cat", "mouse", "impala", "ant", "kiwi")

## grepl(pattern = <regex> , x = <string>)

grepl(pattern = 'a', x = animals)

## Carot vector - begin in the line

grepl(pattern = "^a", x = animals)

## Dollar symbol - end of the line
grepl(pattern = "a$", x = animals)

## GREP() - Returns the indicies for the vector
grep(pattern = "a", x = animals)

## which()
which(grepl(pattern = "^a", x = animals))

grep(pattern = "a$", x = animals)


## SUB() and GSUB()

#sub(pattern = <x>, replacement = <str>, x = <str>)

sub(pattern = "a", replacement = "o", x = animals)
# [1] "cot"    "mouse"  "impola" "ont"    "kiwi"

gsub(pattern = "a", replacement = "o", x = animals)
# [1] "cot"    "mouse"  "impolo" "ont"    "kiwi" 

gsub(pattern = "a|i", replacement = "_", x = animals)

gsub(pattern = "a|i|o", replacement = "_", x = animals)


## 55. GREPL & GREP ###

# In their most basic form, regular expressions can be used to see whether a pattern exists 
# inside a character string or a vector of character strings. For this purpose, you can use:
  
#  grepl(), which returns TRUE when a pattern is found in the corresponding character string.
# grep(), which returns a vector of indices of the character strings that contains the pattern.
# Both functions need a pattern and x argument, where pattern is the regular expression you want 
# to match for, and the x argument is the character vector from which matches should be sought.

# In this and the following exercises, you'll be querying and manipulating a character vector 
# of email addresses! The vector emails has already been defined in the editor on the right 
# so you can begin with the instructions straight away!

### INSTRUCTIONS ###

# Use grepl() to generate a vector of logicals that indicates whether these email addressess 
# contain "edu". Print the result to the output.
# Do the same thing with grep(), but this time save the resulting indexes in a variable hits.
# Use the variable hits to select from the emails vector only the emails that contain "edu".

# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org", 
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for "edu"
grepl(pattern = "edu", x = emails)

# Use grep() to match for "edu", save result to hits
hits <- grep(pattern = "edu", x = emails)

# Subset emails using hits
emails[hits]


## 56. GREPL & GREPL (2)

# You can use the caret, ^, and the dollar sign, $ to match the content located in the start and end of a string, 
# respectively. This could take us one step closer to a correct pattern for matching only the ".edu" 
# email addresses from our list of emails. But there's more that can be added to make the pattern more robust:

# @, because a valid email must contain an at-sign.
# .*, which matches any character (.) zero or more times (*). Both the dot and the asterisk are metacharacters. 
# You can use them to match any character between the at-sign and the ".edu" portion of an email address.
# \\.edu$, to match the ".edu" part of the email at the end of the string. 
# The \\ part escapes the dot: it tells R that you want to use the . as an actual character.

# INSTRUCTIONS 

# Use grepl() with the more advanced regular expression to return a logical vector. Simply print the result.
# Do a similar thing with grep() to create a vector of indices. Store the result in the variable hits.
# Use emails[hits] again to subset the emails vector.

# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org", 
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for .edu addresses more robustly
grepl(pattern ="@.*\\.edu$", x = emails)

# Use grep() to match for .edu addresses more robustly, save result to hits
hits <- grep (pattern="@.*\\.edu$", x = emails)

# Subset emails using hits
emails[hits]


## 57. SUB & GSUB ##

# While grep() and grepl() were used to simply check whether a regular expression could be matched 
# with a character vector, sub() and gsub() take it one step further: you can specify a replacement argument. 
# If inside the character vector x, the regular expression pattern is found, the matching element(s) will be 
# replaced with replacement.sub() only replaces the first match, whereas gsub() replaces all matches.

# Suppose that emails vector you've been working with is an excerpt of DataCamp's email database. 
# Why not offer the owners of the .edu email addresses a new email address on the datacamp.edu domain? 
# This could be quite a powerful marketing stunt: Online education is taking over traditional learning institutions! 
# Convert your email and be a part of the new generation!

## INSTRUCTIONS ##

# With the advanced regular expression "@.*\\.edu$", use sub() to replace the match with "@datacamp.edu". 
# Since there will only be one match per character string, gsub() is not necessary here. 
# Inspect the resulting output.


# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org", 
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use sub() to convert the email domains to datacamp.edu
sub(pattern="@.*\\.edu$", replacement = "@datacamp.edu", x = emails)


## 58. SUB & GSUB (2)

## Regular expressions are a typical concept that you'll learn by doing and by seeing other examples. 
# Before you rack your brains over the regular expression in this exercise, 
# have a look at the new things that will be used:

#  .* : A usual suspect! It can read as "any character that is matched zero or more times. 

# \\s: Match a space. The "s" is normally a character, escaping it (\\) makes it metacharacter.
# [0-9]+ : Match the number 0 to 9, at least once(+).
# ([0-9]+): The parerntheses are used to make parts of the matching string available to define replacement.
# The \\1 in the `replacement` argument of `sub()` gets set to the string that is captured by the 
# regular expression [0-9]+

awards <- c("Won 1 Oscar.",
            "Won 1 Oscar. Another 9 wins & 24 nominations.",
            "1 win and 2 nominations.",
            "2 wins & 3 nominations.",
            "Nominated for 2 Golden Globes. 1 more win & 2 nominations.",
            "4 wins & 1 nomination.")

sub(".*\\s([0-9]+)\\snomination.*$", "\\1", awards)
      
# What does this code chunk return? awards is already defined in the workspace so you can start 
# playing in the console straight away.

# Possible Answers.
# 1. A vector of integers containing: 1, 24, 2, 3, 2, 1.
# 2. The vector awards gets returned as there isn't a single element in awards that matches the regular expression.
# 3. A vector of character strings containing: "1", "24", "2", "3", "2", "1".
# 4. A vector of character strings containing: "Won 1 Oscar.", "24", "2", "3", "2", "1". (ANSWER)
  

############# TIMES AND DATES ##########################333


## Current Date

today <- Sys.Date()
today

class(today)

now <- Sys.time()
now

class(now)

# Create Date Objects

my_date <- as.Date("1971-05-14")
class(my_date)

my_date1 <- as.Date("1971-14-05") #Throws an error

# Default format: %Y-%m-%d
# %Y = 4 digit year
# %m = 2 digit month
# %d = 2 digit day

my_date = as.Date("1971-14-05", format = "%Y-%d-%m")
my_date

# Create POSIXct object
my_take1 <- as.POSIXct("1971-05-14 11:25:14")
my_take1


# Date Arthimetic
my_date
my_date + 1

my_date2 <- as.Date("1998-05-04")


my_date2 - my_date

## Under the hoods 

my_date
  
unclass(my_date)  # date from Jan 1st 1970

unclass(my_time)

####  59.RIGHT HERE, RIGHT NOW

# In R, dates are represented by Date objects, while times are represented by POSIXct objects. 
# Under the hood, however, these dates and times are simple numerical values. 
# Date objects store the number of days since the 1st of January in 1970. 
# POSIXct objects on the other hand, store the number of seconds since the 1st of January in 1970.

# The 1st of January in 1970 is the common origin for representing times and dates in a wide range 
# of programming languages. There's is no particular reason for this, it is a simple convention. 
# Of course, it's also possible to create dates and times before 1970, the corresponding numerical 
# values are simply negative in this case.

###INSTRUCTIONS## 

# Ask R for the current date, and store the result in a variable today.
# To see what today looks like under the hood, call unclass() on it.
# Ask R for the current time, and store the result in a variable, now.
# To see the numerical value that corresponds to now, call unclass() on it.

# Get the current date: today
today <- Sys.Date()

# See what today looks like under the hood
unclass(today)

# Get the current time: now
now <- Sys.time()

# See what now looks like under the hood
unclass(now)


### 60. CREATE AND FORMAT DATEs
## To create a Date Object from a simple character string in R, you can use the as.Date() function. The
## character string has to obey a format that can be defined using a set of symbols (the examples correspond 
## to  13, January 1982):

## %Y - 4-digit year (1982)
## %y - 2-digit year (82)
## %m - 2-digit month (01)
## %d - 2-digit day of the month (13)
## %A - weekday (Wednesday)
## %a - abbreviated weekday (Wed)
## %B - month (January)
## %b - abbreviated month (Jan)

## The following R commands will all create the same Date object for 13 January, 1982:

as.Date('1982-01-13')
as.Date("Jan-13-82", format ="%b-%d-%y")
as.Date("13 January, 1982", format ="%d %B, %Y")

## Notice that the first line here did not need a format argument, because by default R matches your
## character string to the formats "%Y-%m-%d" or "%Y/%m/%d"

## In addtion to creating dates, you can also convert dates to character strings that use a 
## different data notation. you use the format() function. Try the following lines of code:

today <- Sys.Date()
today
format(Sys.Date(), format="%d %B, %Y")
format(Sys.Date(), format ="Today is a %A")

### INSTRUCTIONS ###
## In the editor on the right, three character strings representing dates have been created.
## Convert them to dates using as.Date(), and assign them to date1, date2, and date3 respectively.
## The code for date1 is already included.

## Extract useful information from the dates as character strings using format(). From the first date,
## select the weekday. From the second date, select the day of the month. From the third date, you should
## select the abbreviated month and the 4-digit year, separated by a space.

# Definition of character strings representing dates
str1 <- "May 23, '96"
str2 <- "2012-03-15"
str3 <- "30/January/2006"

# Convert the strings to dates: date1, date2, date3
date1 <- as.Date(str1, format="%b %d, '%y")
date2 <- as.Date(str2, format="%Y-%m-%d")
date3 <- as.Date(str3, format="%m/%B/%Y")

# Convert dates to formatted strings
format(date1, "%A")
format(date2, "%d")
format(date3, "%b %Y")


##### 61. CREATE AND FORMAT TIMES #####

## Similar to working with dates, you can use as.POSIXct() to convert from a character string to
## a POSIXct object, and format() to convert from a POSIXct object to a character string. Again.
## you have a wide variety of symbols:

## %H: hours as a decimal number (00-23)
## %M: minutes as a decimal number
## %S: seconds as a decimal number
## %T: shorthand notation for the typical format %H:%M:%S

## For a full list of conversion symbols, consult the strptime documentation in the console.
## ?strptime

## Again, as.POSIXct() uses a default format to match character strings. In this case,
## it's %Y-%m-%d %H:%M;%S. In this exercise, abstraction is made of different time zones.


### INSTRUCTIONS ###

## 1. Convert two strings that represent a timestamp, str1 and str2 to POSIXct objects, time1 and time2
## 2. Using format(), create a string from time1 containing only the minutes.
## 3. From time2, extract the hours and minutes as "hours:minutes AM/PM". Use ?striptime to find the correct
##   conversion symbols.

# Definition of character strings representing times
str1 <- "May 23, '96 hours:23 minutes:01 seconds:45"
str2 <- "2012-3-12 14:23:08"

# Convert the strings to POSIXct objects: time1, time2
time1 <- as.POSIXct(str1, format = "%B %d, '%y hours:%H minutes:%M seconds:%S")
time1
time2 <- as.POSIXct(str2, format = "%Y-%m-%d %H:%M:%S")
time2 

# Convert times to formatted strings
format(time1, '%M')
format(time2, '%I:%M %p')

##### 62. CALCULATIONS WITH DATES #####

## Both `Date` and `POSIXct` R objects are represented by simple numerical values under the hood.
## This makes calculation with time and date objects very straightforward: R performs the calculations
## using the underlying numerical values, and then converts the result back to human-readable time 
## information again.

## You can increment and decrement `Date` objects, or do actual calculations with them (try it out in the console!):
today <- Sys.Date()
today
today + 1
today - 1
as.Date('2016-03-12') - as.Date('2015-02-27')
## To control your eating habits, you decided to write down the dates of the last five days you ate pizza.
## In the workspace, these dates are defined as five `Date` objects, `day1` to `day5`. The code on the 
## right also contain a vector `pizza` with these 5 `Date` objects.

##### INSTRUCTIONS ####
## 1. Calculate the number of days that passed between the last and the first day you ate pizza. Print the result.
## 2. Use the function diff() on `pizza` to calculate the differences between consecutive `pizza` days. Store the results
##   in a new variable `day_diff.
## 3. Calculate the average period between two consecutive pizza days. Print the result.

day1 <- as.Date('2016-11-16')
day1
day2 <- as.Date('2016-11-11')
day2
day3 <- as.Date('2016-11-22')
day3
day4 <- as.Date('2016-11-09')
day4
day5 <- as.Date('2016-11-27')
day5

# day1, day2, day3, day4 and day5 are already available in the workspace

# Difference between last and first pizza day
day5 - day1

# Create vector pizza
pizza <- c(day1, day2, day3, day4, day5)
pizza
# Create differences between consecutive pizza days: day_diff
day_diff <- diff(pizza)

# Average period between two consecutive pizza days
mean(day_diff)


### 63. CALCULATIONS WITH TIMES ###

## Calculations with `POSIXct` objects are completely analogous to those using `Date` objects. Try
## to experiment with this code to increase or decrease `POSIXct` objects:

now <- Sys.time()
now
now + 3600 # add an hour
now - 3600*24 # subtract a day 

#Adding or substracting time objects is also straightforward:

birth <- as.POSIXct('1879-03-14 14:37:23')
birth
death <- as.POSIXct('1955-04-18 03:47:12')
death

einstein <- death - birth
einstein

## You're developing a website that requires users to log in and out.
## You want to know what is the total and average amount of time a particular
## user spends on your website. This user has logged in 5 times and logged out
## 5 times as well. These times are gathered in the vectors `login` and `logout`,
## which is already defined in the workspace.

#### INSTRUCTIONS #### 

## Calucate the differences between the two vectors `logout` and `login`, i.e.,  the
## time the user was online in each independent session. Store the result in the 
## variable `time_online`.
## Inspect the variable `time_online` by printing it.
## Calculate the total time that the user was online. Print the result.
## Calculate the average time the user was online. Print the result.

login <- c(as.POSIXct('2016-11-14 10:18:04', tz='GMT'),as.POSIXct('2016-11-19 09:14:18', tz='GMT'),
           as.POSIXct('2016-11-19 12:21:51', tz='GMT'),as.POSIXct('2016-11-19 12:37:24', tz='GMT'),
           as.POSIXct('2016-11-21 21:37:55', tz='GMT'))
login

logout <- c(as.POSIXct('2016-11-14 10:56:29', tz='GMT'),as.POSIXct('2016-11-19 09:14:52', tz='GMT'),
           as.POSIXct('2016-11-19 12:35:48', tz='GMT'),as.POSIXct('2016-11-19 13:17:22', tz='GMT'),
           as.POSIXct('2016-11-21 22:08:47', tz='GMT'))
logout

# login and logout are already defined in the workspace
# Calculate the difference between login and logout: time_online
time_online <- logout - login


# Inspect the variable time_online
time_online

# Calculate the total time online
sum(time_online)

# Calculate the average time online
mean(time_online)


### FINAL EXERCISE 64. TIME IS OF THE ESSENCE ###

## The dates when a season begins and ends can vary depending on who you ask.
## People in Australia will tell you that spring starts on September 1st. The
## Irish people will swear that spring stary on February 1st, with the celebration
## of St. Brigid's Day. Then there's also the difference between astronomical and 
## meteorological seasons: while astronomers are used to equinoxes and solstices,
## meteorologists divide the year into 4 fixed seasons that are each three months long.

## A Vector `astro` which contains character strings representing the dates on which
## the 4 astronomical seasons start, has been defined on your workspace.
## Similarly, a vector `meteo` has already been created for you, with the meteorological
## beginnings og a season.

### INSTRUCTIONS ###

## Use `as.Date()` to convert `astro` vector to a vector containing `Date` objects.
## You will need the `%d`, `%b` and `%Y` symbols to specify the `format`. Store the
## resulting vector as `astro_dates`.

## Use `as.Date()` to convert the `meteo` vector to a vector with `Date` objects.
## This time, you will need the `%B`, `%d` and `%y` symbols for the `format` argument.
## Store the resulting vector as `meteo_dates`.

## With a combination of `max()`, `abs()` and `-`, calculate the maximum absolute difference
## between the astronomical and the meteorological beginnings of a season, i.e., 
## `astro_dates` and `meteo_dates`. Simply print this maximum difference to the console output.
# Convert astro to vector of Date objects: astro_dates

astro <- c(spring = "20-Mar-2015", summer = "25-Jun-2015", fall = "23-Sep-2015", winter = "22-Dec-2015")
astro
meteo <- c(spring = "March 1, 15", summer="June 1, 15", fall = "September 1, 15", winter = "December 1, 15")
meteo

astro_dates <- as.Date(astro, format='%d-%b-%Y')
astro_dates
# Convert meteo to vector of Date objects: meteo_dates
meteo_dates <- as.Date(meteo, '%B %d, %y')
meteo_dates
# Calculate the maximum absolute difference between astro_dates and meteo_dates
max(abs(astro_dates - meteo_dates))


