# Date functions for parsing like: mdy, ymd, ydm, dmy, mdy

month_seq <- seq(as.Date("2000-01-01"), as.Date("2000-12-31"), "month")
months <- factor(months(month_seq), levels = months(month_seq))
months_abbr <- factor(months(month_seq, TRUE), levels = months(month_seq, TRUE))

wday_seq <- seq(as.Date("2000-01-02"), as.Date("2000-01-08"), "day")
wdays <- factor(weekdays(wday_seq), levels = weekdays(wday_seq))
wdays_abbr <- factor(weekdays(wday_seq, TRUE), levels = weekdays(wday_seq, TRUE))

second <- function(x) as.POSIXlt(x)$sec
minute <- function(x) as.POSIXlt(x)$min
hour <- function(x) as.POSIXlt(x)$hour
yday <- function(x) as.POSIXlt(x)$yday + 1
wday <- function(x) as.POSIXlt(x)$wday + 1
mday <- function(x) as.POSIXlt(x)$mday
week <- function(x) yday(x) %/% 7 + 1
month <- function(x) as.POSIXlt(x)$mon + 1
year <- function(x) as.POSIXlt(x)$year + 1900
tz <- function(x) {
	tzs <- attr(as.POSIXlt(x),"tzone")
	tzs[length(tzs)]
}

"second<-" <- function(x, value) as.POSIXlt(x) - (second(x) - value)
"minute<-" <- function(x, value) as.POSIXlt(x) - (minute(x) - value) * 60
"hour<-" <- function(x, value) as.POSIXlt(x) - (hour(x) - value) * 3600
"yday<-" <- function(x, value) as.POSIXlt(x) - (yday(x) - value) * 3600 * 24
"wday<-" <- function(x, value) as.POSIXlt(x) - (wday(x) - value) * 3600 * 24
"mday<-" <- function(x, value) as.POSIXlt(x) - (mday(x) - value) * 3600 * 24
"week<-" <- function(x, value) as.POSIXlt(x) - (week(x) - value) * 3600 * 24 * 7
"month<-" <- function(x, value) {
	ISOdatetime(year(x) + (value - 1) %/% 12,  (value - 1) %% 12 + 1, mday(x), hour(x), minute(x), second(x), tz(x))
}
"year<-" <- function(x, value) {
	ISOdatetime(value,  month(x), mday(x), hour(x), minute(x), second(x), tz(x))
}
"tz<-" <- function(x, value) {
	ISOdatetime(year(x),  month(x), mday(x), hour(x), minute(x), second(x), value)
}
