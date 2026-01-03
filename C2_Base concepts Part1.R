#------------------------------------------------------------------------------#
# Basic concepts - Part1                                                    ####
#------------------------------------------------------------------------------#

# 1.create a sample dataset
# 2.copy a an existing dataset
# 3.subset observations
# 4.subset variables
# 5.subset observations and variables
# 6.renaming variables
# 7.adding a new variables
# 8.appending new datasets
# 9.merging new datasets
# 10.merging new datasets - select unmatched records
# 11.Create a cartesian product
# 12.sorting observatrions
# 13.fetching frequenies
# 14.descriptive for numeric variables
# 15.first dot concept equilent to R
# 16.Last dot concept - subset last reocrd within a subgroup
# 17.first dot and last dot concept - identify the groups which has only one reocrd
# 18.handling duplicates
# 19.transpose the data - long to wide
# 20.transpose the data - wide to long
# 21.arrays - repeat the same logic / action on muliple variables



library(tidyverse)
library(dplyr)

|------------------|--------------------------|-----------------------------------|------------------------------------------|------------------------------------|
| Statement        | Meaning                  | When to Use                       | Typical Scenarios                        | Example                            |
|------------------|--------------------------|-----------------------------------|------------------------------------------|------------------------------------|
| `NA`             | Missing value (generic)  | Value should exist but is missing | Survey not answered, missing measurement | `age <- c(25, NA, 30)`             |
|------------------|--------------------------|-----------------------------------|------------------------------------------|------------------------------------|
| `NA_integer_`    | Missing integer          | Missing whole number              | Missing count, ID, index                 | `ids <- c(1L, 2L, NA_integer_)`    |
|------------------|--------------------------|-----------------------------------|------------------------------------------|------------------------------------|
| `NA_real_`       | Missing numeric (double) | Missing decimal/continuous value  | Height, weight, salary                   | `height <- c(5.6, NA_real_)`       |
|------------------|--------------------------|-----------------------------------|------------------------------------------|------------------------------------|
| `NA_character_`  | Missing text             | Missing string/text               | Name, gender, category                   | `name <- c("Amit", NA_character_)` |
|------------------|--------------------------|-----------------------------------|------------------------------------------|------------------------------------|
| `NA_logical_`    | Missing TRUE/FALSE       | Missing logical value             | Unknown condition, unanswered yes/no     | `passed <- c(TRUE, NA_logical_)`   |
|------------------|--------------------------|-----------------------------------|------------------------------------------|------------------------------------|
| `NaN`            | Not a Number             | Result of undefined math          | `0/0`, `Inf - Inf`                       | `x <- 0/0`                         |
|------------------|--------------------------|-----------------------------------|------------------------------------------|------------------------------------|
| `Inf`            | Positive infinity        | Value exceeds numeric limit       | Division by zero, overflow               | `x <- 1/0`                         |
|------------------|--------------------------|-----------------------------------|------------------------------------------|------------------------------------|
| `-Inf`           | Negative infinity        | Negative overflow                 | Negative division by zero                | `x <- -1/0`                        |
|------------------|--------------------------|-----------------------------------|------------------------------------------|------------------------------------|
| `NULL`           | No object                | Object should not exist           | Empty result, remove object              | `x <- NULL`                        |
|------------------|--------------------------|-----------------------------------|------------------------------------------|------------------------------------|


#------------------------------------------------------------------------------#
# 1.create a sample dataset                                                 ####
#------------------------------------------------------------------------------#


class <- tribble(
  ~name,~sex,~age,~height,~weight,
  "Nagendra Sudanapalli","Male",25,5.09, 75,
  "Amit M","Male",26,5.10, 80,
  "Shiva Shankari","Female",27,5.11, 77
)

new_class <- data.frame(
  id = 1:4,
  name = c("Alice", "Bob", "Charlie", "David"),
  age = c(25, 30, 35, 40),
  city = c("NY", "LA", "SF", "CHI")
)


View(class) 
View(new_class)


#------------------------------------------------------------------------------#
# 2.copy a an existing dataset                                              ####
#------------------------------------------------------------------------------#

Cpy_class <- class

View(cpy_class)
View(Cpy_class)


#------------------------------------------------------------------------------#
# 3.subset observations                                                     ####
#------------------------------------------------------------------------------#

Sobs_class_c <- class %>% filter(sex=="Female")
Sobs_class_n <- class %>% filter(age==26)

View(Sobs_class_c)
View(Sobs_class_n)


#------------------------------------------------------------------------------#
# 4.subset variables                                                        ####
#------------------------------------------------------------------------------#

Svar_class_k <- class %>% select(name)
Svar_class_d <- class %>% select(-name)


View(Svar_class_k)
View(Svar_class_d)


#------------------------------------------------------------------------------#
#  5.subset observations and variables                                      ####
#------------------------------------------------------------------------------#

SOV_class_k <- class %>% filter(sex=="Male") %>% select(-sex)

View(SOV_class_k)


#------------------------------------------------------------------------------#
#  6.renaming variables                                                     ####
#------------------------------------------------------------------------------#

Rname <- class %>% rename(emp_name=name)

View(Rname)


#------------------------------------------------------------------------------#
#  7.adding a new variables                                                 ####
#------------------------------------------------------------------------------#

add_var <- mutate(class,age1=age+2)

add_var1 <- mutate(class,
                   sexn = case_when(
                     sex == "Male" ~ 1,
                     sex == "Female" ~ 2
                   ))

View(add_var)
View(add_var1)


#------------------------------------------------------------------------------#
#  8.appending new datasets                                                 ####
#------------------------------------------------------------------------------#

app_dsn  <- rbind(class,class)
app_dsn1 <- bind_rows(class,class) 


# Feature					            	          rbind()																			            bind_rows()
#--------------------------------------------------------------------------------------------------------------------------------------
# Package					                      Base R																			          dplyr (tidyverse)
# Column Matching	                      Columns must match exactly (names, order, type)		    Columns are matched by name only
# Missing Columns		                    ❌ Fails if a column is missing							    		✅ Fills missing columns with NA
# Data Types				                    ❌ May error if types mismatch		      		    			✅try to convert them to a common type 
#                                                                                             and missed column values filled with NA
# Performance			                       Fast for small, matching data							    			Slower but more flexible


View(app_dsn)
View(app_dsn1)


#------------------------------------------------------------------------------#
# 9.merging new datasets, select unmatched records, cartesian product        ###
#------------------------------------------------------------------------------#

# Sample dataset 1
df1 <- data.frame(
  ID = c(1, 2, 3, 4),
  Name = c("Alice", "Bob", "Charlie", "David"),
  Age = c(25, 30, 35, 40),
  City = c("NY", "LA", "Chicago", "Houston")
)

# Sample dataset 2
df2 <- data.frame(
  ID = c(3, 4, 5, 6),
  Name = c("Charlie", "David", "Eve", "Frank"),
  Salary = c(70000, 80000, 90000, 100000),
  Department = c("HR", "Finance", "IT", "Marketing")
)

# Sample dataset 3
df3 <- data.frame(
  ID = c(2, 4, 6, 7),
  Name = c("Bob", "David", "Frank", "Grace"),
  Experience = c(3, 8, 5, 2),
  Country = c("USA", "USA", "Canada", "UK")
)



# merging with two datasets:

Base_ijoin <- merge(df1, df2, by = "ID")                  # Inner join (only matching rows)
Base_ljoin <- merge(df1, df2, by = "ID", all.x = TRUE)    # Left join (all rows from df1, matching from df2)
Base_rijoin <- merge(df1, df2, by = "ID", all.y = TRUE)   # Right join (all rows from df2, matching from df1)
Base_fjoin <- merge(df1, df2, by = "ID", all = TRUE)      # Full join (all rows from both datasets)
Base_semijoin <- merge(df1, df2["ID"], by = "ID")         # Semi Join (df1 rows that match df2 by ID)
Base_antijoin <- df1[!df1$ID %in% df2$ID, ]               # Anti Join (df1 rows that do NOT match df2 by ID)
Base_crossjoin <- merge(df1, df2, by = NULL)              # Cross Join (All combinations of df1 and df2)

dp_ijoin      <-  inner_join(df1, df2, by = "ID")
dp_ljoin      <-  left_join(df1, df2, by = "ID")
dp_rjoin      <-  right_join(df1, df2, by = "ID")
dp_fjoin      <-  full_join(df1, df2, by = "ID")
dp_semijoin   <- semi_join(df1, df2, by = "ID")
dp_antijoin   <- anti_join(df1, df2, by = "ID")          # Anti Join (df1 rows that do NOT match df2 by ID)
dp_crossjoin  <- cross_join(df1, df2)                    # Cross Join (All combinations of df1 and df2) - cartesian product

# merging with three datasets:

# Inner Join
inner <- df1 %>%
  inner_join(df2, by = c("ID", "Name")) %>%
  inner_join(df3, by = c("ID", "Name"))

# Left Join (df1 as base)
left <- df1 %>% left_join(df2, by = c("ID", "Name")) %>% 
                left_join(df3, by = c("ID", "Name"))

# Right Join (df1 <- df2 <- df3 as base)
right <- df3 %>% right_join(df2, by = c("ID", "Name")) %>% 
                 right_join(df1, by = c("ID", "Name"))

# Full Join
full <- df1 %>% full_join(df2, by = c("ID", "Name")) %>% 
                full_join(df3, by = c("ID", "Name"))

# Anti Join (df1 not in df2 or df3)
anti <- df1 %>% anti_join(df2, by = c("ID", "Name")) %>% 
                anti_join(df3, by = c("ID", "Name"))

# Semi Join (df1 rows that match in both df2 and df3)
semi <- df1 %>% semi_join(df2, by = c("ID", "Name")) %>% 
                semi_join(df3, by = c("ID", "Name"))


#------------------------------------------------------------------------------#
# 10.sorting observatrions                                                  ####
#------------------------------------------------------------------------------#


sort_n  <- arrange(class,weight)
sort_c  <- arrange(class,name)
sort_nc <- arrange(class,desc(weight),name)



#------------------------------------------------------------------------------#
#  11.fetching frequenies                                                   ####
#------------------------------------------------------------------------------#

desc_data<-tribble(
  ~name,~sex,~age,~height,~weight,
  "Alfred","M",14,69,112.5,
  "Alice","F",13,56.5,84,
  "Barbara","F",13,65.3,98,
  "Henry","M",14,63.5,102.5,
  "James","M",12,57.3,83,
)

freq <- count(desc_data, sex)
freq1 <- count(desc_data,sex,age)

cnt_per <- desc_data %>%
            count(sex) %>%
            mutate(percentage = paste0(round(100 * n / sum(n), 1), " %"))

#------------------------------------------------------------------------------#
#  12.descriptive for numeric variables                                     ####
#------------------------------------------------------------------------------#

age_sum <- mean(desc_data$age)

# it can't create a dataframe, because it is scalar.(just has a value)
#A data frame in R must have at least one column with column names, 
#even if it contains only one row.

age_sum <- data.frame(mean = mean(desc_data$age))

# data.frame() must be used when you want to assign a value to a column name and create a dataset.


stats<-summarize(desc_data,
                   n=n(), 
                   mean=mean(height),
                   median=median(height),
                   sd=sd(height),
                   min=min(height),
                   max=max(height))



# 13.first dot concept equilent to R
# 14.Last dot concept - subset last reocrd within a subgroup
# 15.first dot and last dot concept - identify the groups which has only one reocrd
# 16.handling duplicates
# 17.transpose the data - long to wide
# 18.transpose the data - wide to long
# 19.arrays - repeat the same logic / action on muliple variables
