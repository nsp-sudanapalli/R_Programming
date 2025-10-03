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






#------------------------------------------------------------------------------#
# 1.create a sample dataset                                                 ####
#------------------------------------------------------------------------------#


class <- tribble(
  ~name,~sex,~age,~height,~weight,
  "Nagendra Sudanapalli","Male",25,5.09, 75,
  "Amit M","Male",26,5.10, 80,
  "Shiva Shankari","Female",27,5.11, 77
)

View(class) 


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



