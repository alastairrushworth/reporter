% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/inspect_mem.R
\name{inspect_mem}
\alias{inspect_mem}
\title{Summary and comparison of memory usage of dataframe columns}
\usage{
inspect_mem(df1, df2 = NULL)
}
\arguments{
\item{df1}{A data frame.}

\item{df2}{An optional second data frame with which to comparing memory usage.
Defaults to \code{NULL}.}
}
\value{
A tibble summarising and comparing the columnwise memory usage 
for one or a pair of data frames.
}
\description{
For a single dataframe, summarise the memory usage in each column. 
If two dataframes are supplied, compare memory usage for columns appearing 
in both dataframes.  For grouped dataframes, summarise the memory usage separately 
for each group.
}
\details{
For a \strong{single dataframe}, the tibble returned contains the columns: \cr
\itemize{
  \item \code{col_name}, a character vector containing column names of \code{df1}.
  \item \code{bytes}, integer vector containing the number of bytes in each column of \code{df1}.
  \item \code{size}, a character vector containing display-friendly memory usage of each column.
  \item \code{pcnt}, the percentage of the dataframe's total memory footprint 
  used by each column.
}
For a \strong{pair of dataframes}, the tibble returned contains the columns: \cr
\itemize{
  \item \code{col_name}, a character vector containing column names of \code{df1}
  and \code{df2}.
  \item \code{size_1}, \code{size_2}, a character vector containing memory usage of each column in
  each of \code{df1} and \code{df2}.
  \item \code{pcnt_1}, \code{pcnt_2}, the percentage of total memory usage of each column within 
  each of \code{df1} and \code{df2}.
}
For a \strong{grouped dataframe}, the tibble returned is as for a single dataframe, but where 
the first \code{k} columns are the grouping columns.  There will be as many rows in the result 
as there are unique combinations of the grouping variables.
}
\examples{
# Load dplyr for starwars data & pipe
library(dplyr)

# Single dataframe summary
inspect_mem(starwars)

# Paired dataframe comparison
inspect_mem(starwars, starwars[1:20, ])

# Grouped dataframe summary
starwars \%>\% group_by(gender) \%>\% inspect_mem()
}
\seealso{
\code{\link{show_plot}}
}
\author{
Alastair Rushworth
}
