% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/inspect_num.R
\name{inspect_num}
\alias{inspect_num}
\title{Summary and comparison of numeric columns}
\usage{
inspect_num(df1, df2 = NULL, breaks = 20, include_int = TRUE)
}
\arguments{
\item{df1}{A dataframe.}

\item{df2}{An optional second dataframe for comparing categorical levels.
Defaults to \code{NULL}.}

\item{breaks}{Integer number of breaks used for histogram bins, passed to 
\code{graphics::hist()}.  Defaults to 20.}

\item{include_int}{Logical flag, whether to include integer columns in numeric summaries.
Defaults to \code{TRUE}.
\code{hist(..., breaks)}.  See \code{?hist} for more details.}
}
\value{
A \code{tibble} containing statistical summaries of the numeric 
columns of \code{df1}, or comparing the histograms of \code{df1} and \code{df2}.
}
\description{
For a single dataframe, summarise the numeric columns.  If two 
dataframes are supplied, compare numeric columns appearing in both dataframes.  
For grouped dataframes, summarise numeric columns separately for each group.
}
\details{
For a \strong{single dataframe}, the tibble returned contains the columns: \cr
\itemize{
  \item \code{col_name}, a character vector containing the column names in \code{df1}
  \item \code{min}, \code{q1}, \code{median}, \code{mean}, \code{q3}, \code{max} and 
  \code{sd}, the minimum, lower quartile, median, mean, upper quartile, maximum and 
  standard deviation for each numeric column.
  \item \code{pcnt_na}, the percentage of each numeric feature that is missing
  \item \code{hist}, a named list of tibbles containing the relative frequency of values 
  falling in bins determined by \code{breaks}.
} 
For a \strong{pair of dataframes}, the tibble returned contains the columns: \cr
\itemize{
  \item \code{col_name}, a character vector containing the column names in \code{df1}
  and \code{df2}
  \item \code{hist_1}, \code{hist_2}, a list column for histograms of each of \code{df1} and \code{df2}.
  Where a column appears in both dataframe, the bins used for \code{df1} are reused to 
  calculate histograms for \code{df2}.
  \item{jsd}, a numeric column containing the Jensen-Shannon divergence.  This measures the 
  difference in distribution of a pair of binned numeric features.  Values near to 0 indicate
  agreement of the distributions, while 1 indicates disagreement.
  \item \code{pval}, the p-value corresponding to a NHT that the true frequencies of histogram bins are equal.
  A small p indicates evidence that the the two sets of relative frequencies are actually different.  The test
  is based on a modified Chi-squared statistic.
}
For a \strong{grouped dataframe}, the tibble returned is as for a single dataframe, but where 
the first \code{k} columns are the grouping columns.  There will be as many rows in the result 
as there are unique combinations of the grouping variables.
}
\examples{
# Load dplyr for starwars data & pipe
library(dplyr)

# Single dataframe summary
inspect_num(starwars)

# Paired dataframe comparison
inspect_num(starwars, starwars[1:20, ])

# Grouped dataframe summary
starwars \%>\% group_by(gender) \%>\% inspect_num()
}
\seealso{
\code{\link{show_plot}}
}
\author{
Alastair Rushworth
}
