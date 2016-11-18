lineGraph <- function(x)
{
  dates = data.frame(table(x$createdDate))
  dates_sorted = dates[order(as.Date(dates$Var1,format="%d/%m/%Y")),,drop=FALSE]
  date = as.Date(dates_sorted$Var1, "%d/%m/%Y")
  frequency = dates_sorted$Freq
  plot(date,frequency,type="o",xlab="Date",ylab="Frequency",
       main="Tweets over time")
}

multiLineGraph <- function(a, b, c)
{
  a_dates = data.frame(table(a$createdDate))
  b_dates = data.frame(table(b$createdDate))
  c_dates = data.frame(table(c$createdDate))
  
  a_dates_sorted = a_dates[order(as.Date(a_dates$Var1,format="%d/%m/%Y")),,drop=FALSE]
  b_dates_sorted = b_dates[order(as.Date(b_dates$Var1,format="%d/%m/%Y")),,drop=FALSE]
  c_dates_sorted = c_dates[order(as.Date(c_dates$Var1,format="%d/%m/%Y")),,drop=FALSE]
  
  a_date = as.Date(a_dates_sorted$Var1, "%d/%m/%Y")
  b_date = as.Date(b_dates_sorted$Var1, "%d/%m/%Y")
  c_date = as.Date(c_dates_sorted$Var1, "%d/%m/%Y")
  
  a_frequency = a_dates_sorted$Freq
  b_frequency = b_dates_sorted$Freq
  c_frequency = c_dates_sorted$Freq
  
  plot(a_date,a_frequency,type="o",xlim=range(c(min(a_date),max(c_date))),
       ylim=range(c(0,8000)),col="red",xlab=" ",ylab=" ")
  par(new=T)
  plot(b_date,b_frequency,type="o",xlim=range(c(min(a_date),max(c_date))),
       ylim=range(c(0,8000)),col="green",xlab=" ",ylab=" ")
  par(new=T)
  plot(c_date,c_frequency,type="o",xlim=range(c(min(a_date),max(c_date))),
       ylim=range(c(0,8000)),col="blue",xlab="Date",ylab="Frequency",
       main="Tweets over time - Combined")
}