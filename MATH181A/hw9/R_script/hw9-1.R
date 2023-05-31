# =====================  Data collection ======================================
# use R to download yahoo finance data and find the simple return using adjusted close price
# install packages needed to download yahoo finance data
install.packages("pdfetch") # used to download data
install.packages("xts") # used to extract "numerical" data from downloaded object
library(pdfetch)
library(xts)

# you need to know the stock symbol on yahoo finance. Google them!
# for Apple, the symbol is AAPL
AAPL <- pdfetch_YAHOO("AAPL",  # import stock symbol
                      from = as.Date("2023-01-01"), # choose start date
                      to = as.Date("2023-05-23"), # choose end date, Sys.Date is system date
                      interval = "1d" # choose price interval, "1d", "1wk", "1m"
)
plot(AAPL)
                      
# extract the "numbers" from the downloaded xtc object
AAPL.aClose <- coredata(AAPL$AAPL.adjclose)

# calculate simple return using r_simp = [p_t - p_(t-1)]/p(t-1)
# r_simp is simple return, p is adjusted close price, and t is time
AAPL.simRet = AAPL.aClose[2:length(AAPL.aClose)]/AAPL.aClose[1:length(AAPL.aClose)-1]-1
plot(AAPL.simRet)

# =====================  Bootstrap CI ======================================
# adding your code here:

xBar = mean(AAPL.simRet)
x = replicate(1000, sample(AAPL.simRet, size=length(AAPL.simRet), replace=TRUE))
xBars = colMeans(x)

criticalVal = quantile(xBars - xBar, probs=c(0.05, 0.95))

CIlower = xBar - unname(criticalVal[2])
CIupper = xBar - unname(criticalVal[1])
print(c(CIlower, CIupper))