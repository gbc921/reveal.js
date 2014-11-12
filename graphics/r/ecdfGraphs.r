# variables
setwd(".")
folder="/home/gabriel/Gabriel/UTFPR/TCC/Sources/Graphics/r/"
pathLoss="885"
pathLossDecimal=as.numeric(pathLoss)/10
pathLossDecimal="8.85"

pdfFileName=paste0(pathLoss, "pathLoss", ".pdf")
graphTitle=paste0("CSMA/CA (Vermelho) vs PbP-DCF (Azul)\n 1x20MHz vs 2x10MHz - Ofdm6Mbps\n Path Loss = ",pathLossDecimal)

dcfsamples<-read.table(paste0("dcf-final-test-",pathLoss,"-mbps.txt"));
pbpsamples<-read.table(paste0("pbp-final-test-",pathLoss,"-mbps.txt"));

highestDCFSample<-max(dcfsamples$V1);
highestPbPSample<-max(pbpsamples$V1);
highestOverall<-max(highestPbPSample, highestDCFSample);

pdf(pdfFileName);
plot(ecdf(dcfsamples$V1), verticals=TRUE, lwd=8, main=graphTitle, ylab="Probabilidade cumulativa" ,xlab="Vazão acumulada (Mbps)", col='red', xlim=c(0,highestOverall));

lines(ecdf(pbpsamples$V1), col="blue", verticals=TRUE, lwd=8);

#lines(ecdf(dcfsamples$V1), ecdf(pbpsamples$V1))
#text(locator(), labels=c("CSMA/CA","PbP-DCF"));

dev.off();
