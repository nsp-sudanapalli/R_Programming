
################################################################################
# Pane	Key Points                                                          ####
################################################################################

Source	• Top-left
        • Write/edit R scripts, R Markdown, Shiny apps
        • Run code line by line or in chunks
        • Syntax highlighting & navigation

Console	• Bottom-left
        • Type and run R commands directly
        • Shows output, errors, warnings
Environment / History	
        • Top-right
        • Environment: shows variables, data frames, functions
        • History: shows previously run commands
Files / Plots / Packages / Help / Viewer	
        • Bottom-right
        • Files: navigate directories
        • Plots: view graphs/charts
        • Packages: install/manage packages
        • Help: view documentation
        • Viewer: display web content/Shiny apps
Extra Tips	
        • Panes can be moved/resized
        • Customize layout: Tools → Global Options → Pane Layout
        • Run code shortcut: Ctrl+Enter (Windows) / Cmd+Enter (Mac)



################################################################################
# Global environment : Data, Values, and Functios                           ####
################################################################################

# Global environment : Data, Values, and Functions

In R, everything in the global environment can be categorized into **three main types**: **Data**, **Values**, and **Functions**.

-------------
## 1. Data ##
-------------
Data are objects that **store information**. They can be simple or structured and often hold multiple values.  
**Types of data:**

- **Vector**:                       Sequence of elements of the same type                Example: `c(1, 2, 3)`
- **List**:                         Can hold elements of different types                 Example: `list(name="Alice", age=25)`
- **Matrix**:                       2D array; all elements must be the same type         Example: `matrix(1:6, nrow=2)`
- **Data frame**:                   Table where each column can be a different type      Example: `data.frame(Name=c("A","B"), Age=c(20,25))`
- **Factor**:                       Categorical data                                     Example: `factor(c("Male","Female"))`
- **Environment / S4 objects**:     Special structured data                              Example: `new.env()`

> **Note:** Data structures allow you to organize and manipulate multiple values at once.

---------------
## 2. Values ##
---------------
Values are **single atomic elements**. Technically, they are **vectors of length 1**.  

**Common types of values:**

- **Numeric**:         Numbers with decimals       Example: `x <- 3.14`
- **Integer**:         Whole numbers               Example: `y <- 5L`
- **Character**:       Text                        Example: `name <- "Alice"`
- **Logical**:         TRUE or FALSE               Example: `flag <- TRUE`
- **Complex**:         Complex numbers             Example: `z <- 1+2i`

> **Note:** Values are the building blocks of data structures.

------------------
## 3. Functions ##
------------------
Functions are **objects that perform actions**. They take inputs (arguments) and return outputs.

**Types of functions:**
- **Built-in functions**: Provided by R         Example: `mean(x)`
- **User-defined functions**: Created by you    Example: `add <- function(a, b) { a + b }`

> **Note:** Functions act on values and data to produce results.

-------------
## Summary ##
-------------
- **Data** → Structured collections (vectors, lists, matrices, data frames, factors, environments)  
- **Values** → Single atomic pieces of information (numbers, text, logicals)  
- **Functions** → Executable actions that manipulate values and data



################################################################################
# List of Packages for Tables, Listings, Figures.                           ####
################################################################################

# gt								  Modern grammar for generating beautiful, publication-ready tables.
# flextable					  Creates complex, customizable tables for Word/PowerPoint/HTML outputs.
# huxtable					  Easy formatting of tables with LaTeX and HTML support.
# kableExtra				  Enhances knitr::kable() with formatting and styling for tables.
# officer						  Exports tables (e.g., from flextable) to Word or PowerPoint.
# arsenal						  Powerful for generating summary tables with statistical comparisons.
# table1						  For descriptive statistics (e.g., Table 1: baseline characteristics).
# rtables						  Used by the pharma industry (especially Roche) for complex table layouts.
# tidyverse					  Includes dplyr, tidyr—crucial for data wrangling before table creation.


################################################################################
# List of Packages for Listings                                             ####
################################################################################

# DT	              Interactive HTML-based listings (DataTables JS).
# formattable	      Table formatting with conditional formatting.
# pander	          Converts R objects to markdown—helpful for listings in reports.
# tibble	          Modern replacement for data.frame—common in tidyverse pipelines.
# openxlsx	        Export listings directly to Excel.


################################################################################
# List of Packages for Figures.                                             ####
################################################################################

# ggplot2	          Grammar of graphics—main plotting system in R.
# ggpubr	          Wrapper around ggplot2 for publication-ready figures.
# survminer    	    For survival analysis plots (e.g., Kaplan-Meier curves).
# plotly	          Interactive plotting (HTML-based).
# lattice	          Advanced base plotting system.
# ComplexHeatmap	  For creating complex heatmaps often used in exploratory analysis.
# forestplot	      Used to generate forest plots (common in meta-analyses or risk ratios).
# cowplot,          patchwork	Combine multiple ggplot objects.


################################################################################
# List of Packages for Clinical Trials                                     #####
################################################################################

# Tplyr	            Tailored for TLFs in clinical trials; provides layered summary table logic.
# metacore	        Helps with metadata management, supports SDTM/ADaM.
# metatools	        Used in conjunction with metacore for automating ADaM dataset creation.
# pharmaRTF	        Formats tables/listings into RTF documents suitable for submission.
# admiral	          Part of the Roche pharmaverse suite—supports ADaM dataset creation.
# xportr	          Exports datasets to SAS Transport Format (.xpt), required for FDA submission.
# visR	            Visualizations for clinical data, including survival, safety, etc.


