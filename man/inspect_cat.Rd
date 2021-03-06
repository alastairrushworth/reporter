% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/inspect_cat.R
\name{inspect_cat}
\alias{inspect_cat}
\title{Summary and comparison of the levels in categorical columns}
\usage{
inspect_cat(df1, df2 = NULL, include_int = FALSE)
}
\arguments{
\item{df1}{A dataframe.}

\item{df2}{An optional second data frame for comparing categorical levels.
Defaults to \code{NULL}.}

\item{include_int}{Logical flag - whether to treat integer columns as categories.  Default is \code{FALSE}.}
}
\value{
A tibble summarising or comparing the categorical features 
in one or a pair of dataframes.
}
\description{
For a single dataframe, summarise the levels of each categorical 
column.  If two dataframes are supplied, compare the levels of categorical features 
that appear in both dataframes.  For grouped dataframes, summarise the levels 
of categorical features separately for each group.
}
\details{
For a \strong{single dataframe}, the tibble returned contains the columns: \cr
\itemize{
  \item \code{col_name}, character vector containing column names of \code{df1}.
  \item \code{cnt} integer column containing count of unique levels found in each column, 
  including \code{NA}.
  \item \code{common}, a character column containing the name of the most common level.
  \item \code{common_pcnt}, the percentage of each column occupied by the most common level shown in 
  \code{common}.
  \item \code{levels}, a named list containing relative frequency tibbles for each feature.
}
For a \strong{pair of dataframes}, the tibble returned contains the columns: \cr
\itemize{
  \item \code{col_name}, character vector containing names of columns appearing in both 
  \code{df1} and \code{df2}.
  \item \code{jsd}, a numeric column containing the Jensen-Shannon divergence.  This measures the 
  difference in relative frequencies of levels in a pair of categorical features.  Values near 
  to 0 indicate agreement of the distributions, while 1 indicates disagreement.
  \item \code{pval}, the p-value corresponding to a NHT that the true frequencies of the categories are equal.
  A small p indicates evidence that the the two sets of relative frequencies are actually different.  The test
  is based on a modified Chi-squared statistic.
  \item \code{lvls_1}, \code{lvls_2}, the relative frequency of levels in each of \code{df1} and \code{df2}.
}
For a \strong{grouped dataframe}, the tibble returned is as for a single dataframe, but where 
the first \code{k} columns are the grouping columns.  There will be as many rows in the result 
as there are unique combinations of the grouping variables.
}
\examples{
# Load dplyr for starwars data & pipe
library(dplyr)

# Single dataframe summary
inspect_cat(starwars)

# Paired dataframe comparison
inspect_cat(starwars, starwars[1:20, ])

# Grouped dataframe summary
starwars \%>\% group_by(gender) \%>\% inspect_cat()
}
\seealso{
\code{\link{inspect_imb}}, \code{\link{show_plot}}
}
\author{
Alastair Rushworth
}
