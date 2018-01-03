# 1. Run t-tests with the "iris" data set
#    - compare sepal width
#    - two different pairwise comparisons (i.e., between the three species)
#    HINT: use the t.test() function

MyIrisData <- iris
colnames(MyIrisData)
View(MyIrisData)


HINT - MAKE SEPARATE VECTORS PER SPECIES

Sepal.Width.Setosa <- MyIrisData$Sepal.Width[MyIrisData$Species == "setosa"]
Sepal.Width.Versicolor <- MyIrisData$Sepal.Width[MyIrisData$Species == "versicolor"]
Sepal.Width.Virginica <- MyIrisData$Sepal.Width[MyIrisData$Species == "virginica"]
***"Coding like this is a good habit to develop"***


t.test(x = MyIrisData$Sepal.Width[MyIrisData$Species == "setosa"], y = MyIrisData$Sepal.Width[MyIrisData$Species == "versicolor"])
t.test(x = MyIrisData$Sepal.Width[MyIrisData$Species == "setosa"], y = MyIrisData$Sepal.Width[MyIrisData$Species == "virginica"])

OR

t.test(Sepal.Width.Virginica, Sepal.Width.Versicolor)
t.test(Sepal.Width.Setosa, Sepal.Width.Versicolor)

# 2. Find the overall correlation between Sepal.Length and Petal.Length
#    HINT: use the cor() function

cor(MyIrisData$Sepal.Length, MyIrisData$Petal.Length)

# 3. Get the correlation between Sepal.Length and Petal.Length 
#    a. overall
cor(MyIrisData$Sepal.Length, MyIrisData$Petal.Length)

#    b. for each Species separately
summary(MyIrisData)

cor(MyIrisData$Sepal.Length[MyIrisData$Species == "setosa"], MyIrisData$Petal.Length[MyIrisData$Species == "setosa"])
cor(MyIrisData$Sepal.Length[MyIrisData$Species == "versicolor"], MyIrisData$Petal.Length[MyIrisData$Species == "versicolor"])
cor(MyIrisData$Sepal.Length[MyIrisData$Species == "virginica"], MyIrisData$Petal.Length[MyIrisData$Species == "virginica"])


# 4. Look at the built-in data set ToothGrowth. Use a t-test to compare tooth
#    lengths in the different supplement types.
#    HINT: first use head() and summary() to "peek" at the data




# 5. Re-run #4 t-test as a true "Student's" t-test, not a Welch's. 
#    Re-run it an additional time as a paired t-test.
#    HINT: read the help file carefully!

# 6. Run a Wilcoxon Signed Rank test for the same comparisons in #1
#    HINT: use help.search() or ?? to find a function to do this

# 7. Save all results (and only those results!) in an .RData object
#    - try to think of (at least) two ways to do this

# 8. Look at the format of your Homework data set
#     - find a function to read in your data
#     - needed for tonight's Homework
#    HINT: start with the help for read.table()

