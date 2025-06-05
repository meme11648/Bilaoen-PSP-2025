###CODING PROJECT ONE:

#---------Part 1--------------#
#The first thing we'll often end up doing for a new project is loading in our
#data. Let's load in beach data
#First get the working directory
getwd()

#Then, set your working directory to the directory that contains beach data
#Hint: after typing "", trying using tab to navigate directories
setwd("/Users/username/path/to/file")

#Read in your data and save it as an object
beach <- read.csv("beach_data.csv") #check environment to see if it loaded

#---------Part 2--------------#
#OK. Now that we've got our data loaded in, let's start answering questions!

#QUESTION 1: What is the standard deviation of the weight?
ANSWER GOES HERE


#QUESTION 2: plot the weight using the barplot() function
ANSWER GOES HERE


#Great, you just generated your first plot! Now let's customize
#Remember in the R Basics videos the function w/ setting format? I never covered
#it in detail, but we're going over it now!
#Remember, this is the format
fx(argument, setting1, setting2, setting3, etc)

#We're going to be applying settings to the barplot function to change the
#appearance

#Setting 1: names.
#The names setting controls the bar lables of our barplot
barplot(argument, names = )
#What should come after the equal sign if we want the names to be the sample
#names from our beach data?

#QUESTION 3: Plot the barplot with Sample names
#Hint: Click on the "zoom" button above the plot to see all the names
ANSWER GOES HERE


#OK! We're getting somewhere. Now we're going to change color of the columns
#because...design. Add the col setting with the desired color enclosed in quotes
barplot(argument, names = , )
#What should come after the commma to change the color of the bars?

#QUESTION 5: Plot the barplot with a different color
ANSWER GOES HERE


#Woohoo! You just worked on your first plot. Remember,the function formats are
#guides to help you recognize patterns. Formats can be different based on the
#function. For instance, some function look like this:
fx(arg, setting1(), setting2(), setting3())

#Instead of this
fx(arg, setting1 = , setting2 = , setting3 = )
#You'll get the hang of which functions use which formats with practice and
#note-taking! To get an idea of a function that uses a peculiar format, let's
#tackle this final question!

#---------Part 3--------------#
#We want to know if there's a difference in weight between the animals. This
#requires stats. I was TERRIFIED of stats (and coding) as an undergrad. So take
#it from me that you don't need a ton of stats (or code) to run this
#comprison. We just need to remember the critical value, and its meaning!

#The critical value is p < 0.05. If we're running a comparison and p < 0.05,
#it means that what we're observing did not happen by chance. In other words,
#the event we think we're obersving is actually happening. i.e.

#Is there a differnce in weight between the animals?
#If p > 0.05: then no. The differences in weight observed are coincidences of the
#sample size, or some other coincidence.

#If p < 0.05: then yes. The observations are not due to coincidence. They're
#actually different!
#Got it? I hope so :)

#To run a comparsion, we're going to use the aov() function. It works like this:
aov(arg1 ~ arg2)
#Input the numerical column into arg1, and the categorial column into arg2

#OK. We ran it and got a whole bunch of values in the console, but we don't know
#how to make sense of them. Let's wrap the summary() function around the
#function we just ran to summarize these numbers.
#The critical value is under Pr(>F)!

#QUESTION 6: Is there a difference in weight between the animals?
ANSWER GOES HERE

#Congrats! You just ran a two-way ANOVA test! These are the results papers are
#written off of!

#As far as I can tell, aov() and other statistical comparison functions that run
#comparisons are the only functions that use the tilde symbol (~) in this way.
#You won't encounter this symbol often when coding. The aov() function is an
#example of how some functions may be structured outside of the patterns we
#learned in R Basics. The function format patterns we learned simply cover the
#broad majority of formats.


#---------Part 4--------------#
#BONUS QUESTION: Is there a difference in weight between tidal zones?
ANSWER GOES HERE
