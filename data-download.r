# Human readable url
# http://www.sfgate.com/cgi-bin/article.cgi?f=/c/a/2007/12/30/REHS_alameda.txt
# Machine readable url
# http://www.sfgate.com/c/a/2008/06/15/REHS.tb
#
# Foreclosure data:
# http://b2.caspio.com/dp.asp?AppKey=92721000f8j5e7c2j2b5c8c8b6i0

# Get the data -----------------------
start <- as.Date("2003-04-27")
end <- as.Date("2008-11-16")

sundays <- as.POSIXlt(seq.Date(start, end, "week"))
base_url <- "http://www.sfgate.com/c/a"
suffix <- "REHS.tbl"

pad <- function(x) sprintf("%02d", x)

urls <- paste(
  base_url, 
  1900 + sundays$year, 
  pad(sundays$mon + 1), 
  pad(sundays$mday), 
  suffix,
  sep="/")

cat(paste(urls, collapse="\n"), file = "paths.txt")
