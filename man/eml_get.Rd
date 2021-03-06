% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eml_get.R
\docType{methods}
\name{eml_get}
\alias{eml_get}
\alias{eml_get,attributeList-method}
\alias{eml_get,unitList-method}
\title{eml_get}
\usage{
eml_get(x, element = NULL, ...)

\S4method{eml_get}{attributeList}(x, eml = x, join = TRUE)


  \S4method{eml_get}{unitList}(x = read_eml(system.file("xsd/eml-unitDictionary.xml",
  package = "EML")))
}
\arguments{
\item{x}{an EML object or child/descendant object}

\item{element}{name of the element to be extracted. If multiple occurances are found, will extract all}

\item{...}{additional arguments for specific get_* methods, see details}

\item{eml}{the eml file from which to look up references (optional)}

\item{join}{when returning attributeList tables, should we join the tables into one table? (logical, default TRUE)}
}
\description{
eml_get
}
\details{
Some elements have custom get_<class> functions which return the requested metadata in a more natural format, such
as get_attributeList, which returns data.frames containing the desired metadata.  If such a function exists for the element
requested, that function is called instead. Additional arguments given to `eml_get` will be passed to that function via ...,
for example, compare \code{\link{get_attributes}} to the example shown here.
}
\section{Methods (by class)}{
\itemize{
\item \code{attributeList}: get method for attributeList

\item \code{unitList}: get method for UnitList
}}
\examples{
f <- system.file("xsd/test", "eml-datasetWithUnits.xml", package = "EML")
eml <- read_eml(f)
eml_get(eml, "physical")
eml_get(eml, "attributeList")
eml_get(eml, "attributeList", join = FALSE)  ## use additional arguments to get_attributeList

## The first argument need not be an "eml" class, it could be a child element; e.g.
eml_get(eml@dataset@dataTable, "physical")

}

