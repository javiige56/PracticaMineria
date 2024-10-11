ggplot(nadadoresParticipantes, aes(x = edad, colour = gender)) +
  geom_density(lwd=2, linetype=1)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[Workspace loaded from C:/PracticaMineria/.RData]

> knitr::opts_chunk$set(echo = TRUE)
> # Cargamos las librerias que vamos necesitando a lo largo del codigo
  > library(dplyr)
Warning: package ‘dplyr’ was built under R version 4.3.2
Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:
  
  filter, lag

The following objects are masked from ‘package:base’:
  
  intersect, setdiff, setequal, union

> library(rstatix)
Warning: package ‘rstatix’ was built under R version 4.3.3
Attaching package: ‘rstatix’

The following object is masked from ‘package:stats’:
  
  filter

> library(ggplot2)
Warning: package ‘ggplot2’ was built under R version 4.3.2
> library(tidyr)
Warning: package ‘tidyr’ was built under R version 4.3.2
> datos2015<-read.csv("datos/2015_FINA.csv", header=TRUE, sep = ',')
> datos2015<-read.csv("datos/2015_FINA.csv", header=TRUE, sep = ',')
> edad
Error: object 'edad' not found
> datos2015$edad
NULL
> datos2015$gender
[1] "F" "F" "F" "F" "F" "F" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "F" "F" "F" "F" "F" "F" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M"
[36] "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M"
[71] "M" "M" "M" "M" "M" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "F" "F" "F"
[106] "M" "M" "M" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "M" "M" "M" "M" "M" "M" "M" "M"
[141] "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M"
[176] "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "F" "F" "F" "F" "F" "F" "F" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "F" "F"
[211] "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "M" "M" "M" "F" "F" "F" "M" "M" "F" "F" "F" "F" "F" "F" "M"
[246] "M" "F" "F" "F" "M" "M" "M" "M" "M" "M" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "M"
[281] "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "F" "F" "F" "F" "F" "F" "F" "F" "F" "M" "M" "M" "F" "F" "F"
[316] "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M"
[351] "M" "M" "M" "M" "M" "M" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "M" "M" "M" "M" "M" "M" "M" "M"
[386] "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F"
[421] "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F"
[456] "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F"
[491] "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M"
[526] "M" "M" "M" "M" "M" "M" "M" "M" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "M" "M" "M" "M" "M" "M"
[561] "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M"
[596] "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M"
[631] "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F"
[666] "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F"
[701] "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "M" "M" "M" "M" "M" "M" "M" "M" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F"
[736] "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M"
[771] "M" "M" "M" "M" "M" "M" "M" "M" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F"
[806] "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M"
[841] "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "F" "F" "F"
[876] "F" "F" "F" "F" "F" "F" "M" "M" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "M" "M"
[911] "M" "M" "M" "M" "F" "F" "M" "M" "M" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "M" "M" "M" "M" "M" "M" "M" "M" "M" "F" "F" "F" "F" "F"
[946] "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "M" "M" "M" "M" "M" "M" "F" "F" "F" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M" "M"
[981] "M" "M" "M" "M" "M" "M" "M" "M" "M" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F" "F"
[ reached getOption("max.print") -- omitted 10423 entries ]
> gender
Error: object 'gender' not found
> knitr::opts_chunk$set(echo = TRUE)
> # Cargamos las librerias que vamos necesitando a lo largo del codigo
  > library(dplyr)
> library(rstatix)
> library(ggplot2)
> library(tidyr)
> datos2015<-read.csv("datos/2015_FINA.csv", header=TRUE, sep = ',')
> dim(datos2015)
[1] 11423    22
> head(datos2015,1)
> summary(datos2015)
athleteid        lastname          firstname          birthdate            gender              name          
Min.   :100392   Length:11423       Length:11423       Length:11423       Length:11423       Length:11423      
1st Qu.:101501   Class :character   Class :character   Class :character   Class :character   Class :character  
Median :103266   Mode  :character   Mode  :character   Mode  :character   Mode  :character   Mode  :character  
Mean   :106980                                                                                                 
3rd Qu.:110718                                                                                                 
Max.   :125573                                                                                                 

code              eventid            heat            lane           points        reactiontime       swimtime      
Length:11423       Min.   :  1.00   Min.   : 1.00   Min.   :0.000   Min.   :  52.0   Min.   :0.4200   Min.   :  21.19  
Class :character   1st Qu.: 13.00   1st Qu.: 1.00   1st Qu.:2.000   1st Qu.: 783.0   1st Qu.:0.6800   1st Qu.: 114.10  
Mode  :character   Median : 30.00   Median : 3.00   Median :4.000   Median : 853.0   Median :0.7200   Median : 231.31  
Mean   : 53.15   Mean   : 3.08   Mean   :4.485   Mean   : 826.6   Mean   :0.7205   Mean   : 366.11  
3rd Qu.: 39.00   3rd Qu.: 4.00   3rd Qu.:7.000   3rd Qu.: 902.0   3rd Qu.:0.7600   3rd Qu.: 523.24  
Max.   :428.00   Max.   :12.00   Max.   :9.000   Max.   :1028.0   Max.   :0.9700   Max.   :1137.27  
NA's   :71       NA's   :61       NA's   :59       
     split         cumswimtime      splitdistance       daytime        round              distance        relaycount
 Min.   : 1.000   Min.   :  21.19   Min.   :  50.0   Min.   : 930   Length:11423       Min.   :  50.0   Min.   :1   
 1st Qu.: 1.000   1st Qu.:  49.45   1st Qu.:  50.0   1st Qu.:1000   Class :character   1st Qu.: 200.0   1st Qu.:1   
 Median : 3.000   Median :  99.36   Median : 150.0   Median :1048   Mode  :character   Median : 400.0   Median :1   
 Mean   : 6.296   Mean   : 197.01   Mean   : 314.8   Mean   :1192                      Mean   : 580.5   Mean   :1   
 3rd Qu.: 8.000   3rd Qu.: 255.23   3rd Qu.: 400.0   3rd Qu.:1117                      3rd Qu.: 800.0   3rd Qu.:1   
 Max.   :30.000   Max.   :1137.27   Max.   :1500.0   Max.   :1943                      Max.   :1500.0   Max.   :1   
                  NA's   :59                                                                                        
stroke          splitswimtime   
Length:11423       Min.   : 21.19  
Class :character   1st Qu.: 29.10  
Mode  :character   Median : 30.82  
Mean   : 31.02  
3rd Qu.: 32.77  
Max.   :101.02  
NA's   :59      
> datos2015<- datos2015 %>% convert_as_factor(gender,name,code,round,heat,lane,stroke)
> summary(datos2015)
   athleteid        lastname          firstname          birthdate         gender              name           code     
 Min.   :100392   Length:11423       Length:11423       Length:11423       F:5236   United States: 755   USA    : 755  
 1st Qu.:101501   Class :character   Class :character   Class :character   M:6187   China        : 507   CHN    : 507  
 Median :103266   Mode  :character   Mode  :character   Mode  :character            Australia    : 479   AUS    : 479  
 Mean   :106980                                                                     Great Britain: 462   GBR    : 462  
 3rd Qu.:110718                                                                     Germany      : 411   GER    : 411  
 Max.   :125573                                                                     Italy        : 382   ITA    : 382  
                                                                                    (Other)      :8427   (Other):8427  
    eventid            heat           lane          points        reactiontime       swimtime           split       
 Min.   :  1.00   1      :3181   4      :1303   Min.   :  52.0   Min.   :0.4200   Min.   :  21.19   Min.   : 1.000  
 1st Qu.: 13.00   2      :2297   6      :1269   1st Qu.: 783.0   1st Qu.:0.6800   1st Qu.: 114.10   1st Qu.: 1.000  
 Median : 30.00   3      :1838   5      :1247   Median : 853.0   Median :0.7200   Median : 231.31   Median : 3.000  
 Mean   : 53.15   4      :1561   2      :1246   Mean   : 826.6   Mean   :0.7205   Mean   : 366.11   Mean   : 6.296  
 3rd Qu.: 39.00   5      :1317   3      :1215   3rd Qu.: 902.0   3rd Qu.:0.7600   3rd Qu.: 523.24   3rd Qu.: 8.000  
 Max.   :428.00   6      : 439   7      :1202   Max.   :1028.0   Max.   :0.9700   Max.   :1137.27   Max.   :30.000  
                  (Other): 790   (Other):3941   NA's   :71       NA's   :61       NA's   :59                        
cumswimtime      splitdistance       daytime     round         distance        relaycount    stroke     splitswimtime   
Min.   :  21.19   Min.   :  50.0   Min.   : 930   FIN:1475   Min.   :  50.0   Min.   :1    BACK  :1053   Min.   : 21.19  
1st Qu.:  49.45   1st Qu.:  50.0   1st Qu.:1000   PRE:8904   1st Qu.: 200.0   1st Qu.:1    BREAST:1205   1st Qu.: 29.10  
Median :  99.36   Median : 150.0   Median :1048   SEM:1022   Median : 400.0   Median :1    FLY   :1095   Median : 30.82  
Mean   : 197.01   Mean   : 314.8   Mean   :1192   SOP:   4   Mean   : 580.5   Mean   :1    FREE  :6782   Mean   : 31.02  
3rd Qu.: 255.23   3rd Qu.: 400.0   3rd Qu.:1117   SOS:  18   3rd Qu.: 800.0   3rd Qu.:1    MEDLEY:1288   3rd Qu.: 32.77  
Max.   :1137.27   Max.   :1500.0   Max.   :1943              Max.   :1500.0   Max.   :1                  Max.   :101.02  
NA's   :59                                                                                               NA's   :59      
> datos2015$birthdate <- as.Date(datos2015$birthdate)
> #Calculamos la edad
  > fechaKazan<- as.Date("2015-07-24")
> datos2015$edad <- as.numeric(difftime(fechaKazan, datos2015$birthdate, units = "weeks")) %/% 52  # Convertir de semanas a años
> nadadoresParticipantes <- datos2015 %>%
  +   distinct(athleteid, .keep_all = TRUE)
> summary(nadadoresParticipantes$edad)
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
10.00   19.00   21.00   21.32   24.00   38.00 
> boxplot(nadadoresParticipantes$edad)
> summary(boxplot(nadadoresParticipantes$edad))
Length Class  Mode     
stats  5     -none- numeric  
n      1     -none- numeric  
conf   2     -none- numeric  
out   12     -none- numeric  
group 12     -none- numeric  
names  1     -none- character
> summary(nadadoresParticipantes$edad)
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
10.00   19.00   21.00   21.32   24.00   38.00 
> ggplot(nadadoresParticipantes, aes(x = edad, colour = gender)) +
  +   geom_density(lwd=2, linetype=1)
> boxplot(nadadoresParticipantes$edad)
> t.test(edad~gender,data=nadadoresParticipantes)

Welch Two Sample t-test

data:  edad by gender
t = -4.8835, df = 1042, p-value = 1.206e-06
alternative hypothesis: true difference in means between group F and group M is not equal to 0
95 percent confidence interval:
  -1.6322652 -0.6965245
sample estimates:
  mean in group F mean in group M 
20.67814        21.84253 

> table(nadadoresParticipantes$edad>30)

FALSE  TRUE 
1092    18 
> table(nadadoresParticipantes$edad>30,nadadoresParticipantes$gender)

F   M
FALSE 488 604
TRUE    6  12
> 6/(488+6)
[1] 0.01214575
> 600/(488+6)
[1] 1.214575
> 1200/(604+12)
[1] 1.948052
> tabla1<-table(nadadoresParticipantes$edad>30,nadadoresParticipantes$gender)
> chisq.test(tabla1)

Pearson's Chi-squared test with Yates' continuity correction

data:  tabla1
X-squared = 0.5219, df = 1, p-value = 0.47

> tabla1<-table(nadadoresParticipantes$edad<20,nadadoresParticipantes$gender)
> chisq.test(tabla1)

Pearson's Chi-squared test with Yates' continuity correction

data:  tabla1
X-squared = 16.173, df = 1, p-value = 5.78e-05

> tabla1

F   M
FALSE 290 434
TRUE  204 182
> 20400/(290+204)
[1] 41.29555
> 18200/(434+182)
[1] 29.54545
> tabla1<-table(nadadoresParticipantes$edad<18,nadadoresParticipantes$gender)
> tabla1

F   M
FALSE 387 549
TRUE  107  67
> chisq.test(tabla1)

Pearson's Chi-squared test with Yates' continuity correction

data:  tabla1
X-squared = 23.307, df = 1, p-value = 1.381e-06

> 10700/(107+387)
[1] 21.65992
> 6700/(549+67)
[1] 10.87662
> knitr::opts_chunk$set(echo = TRUE)
> # Cargamos las librerias que vamos necesitando a lo largo del codigo
  > library(dplyr)
> library(rstatix)
> library(ggplot2)
> library(tidyr)
> datos2015<-read.csv("datos/2015_FINA.csv", header=TRUE, sep = ',')
> dim(datos2015)
[1] 11423    22
> head(datos2015,1)
> summary(datos2015)
athleteid        lastname          firstname          birthdate        
Min.   :100392   Length:11423       Length:11423       Length:11423      
1st Qu.:101501   Class :character   Class :character   Class :character  
Median :103266   Mode  :character   Mode  :character   Mode  :character  
Mean   :106980                                                           
3rd Qu.:110718                                                           
Max.   :125573                                                           

gender              name               code              eventid            heat      
Length:11423       Length:11423       Length:11423       Min.   :  1.00   Min.   : 1.00  
Class :character   Class :character   Class :character   1st Qu.: 13.00   1st Qu.: 1.00  
Mode  :character   Mode  :character   Mode  :character   Median : 30.00   Median : 3.00  
Mean   : 53.15   Mean   : 3.08  
3rd Qu.: 39.00   3rd Qu.: 4.00  
Max.   :428.00   Max.   :12.00  

lane           points        reactiontime       swimtime           split       
Min.   :0.000   Min.   :  52.0   Min.   :0.4200   Min.   :  21.19   Min.   : 1.000  
1st Qu.:2.000   1st Qu.: 783.0   1st Qu.:0.6800   1st Qu.: 114.10   1st Qu.: 1.000  
Median :4.000   Median : 853.0   Median :0.7200   Median : 231.31   Median : 3.000  
Mean   :4.485   Mean   : 826.6   Mean   :0.7205   Mean   : 366.11   Mean   : 6.296  
3rd Qu.:7.000   3rd Qu.: 902.0   3rd Qu.:0.7600   3rd Qu.: 523.24   3rd Qu.: 8.000  
Max.   :9.000   Max.   :1028.0   Max.   :0.9700   Max.   :1137.27   Max.   :30.000  
NA's   :71       NA's   :61       NA's   :59                        
  cumswimtime      splitdistance       daytime        round              distance     
 Min.   :  21.19   Min.   :  50.0   Min.   : 930   Length:11423       Min.   :  50.0  
 1st Qu.:  49.45   1st Qu.:  50.0   1st Qu.:1000   Class :character   1st Qu.: 200.0  
 Median :  99.36   Median : 150.0   Median :1048   Mode  :character   Median : 400.0  
 Mean   : 197.01   Mean   : 314.8   Mean   :1192                      Mean   : 580.5  
 3rd Qu.: 255.23   3rd Qu.: 400.0   3rd Qu.:1117                      3rd Qu.: 800.0  
 Max.   :1137.27   Max.   :1500.0   Max.   :1943                      Max.   :1500.0  
 NA's   :59                                                                           
relaycount    stroke          splitswimtime   
Min.   :1    Length:11423       Min.   : 21.19  
1st Qu.:1    Class :character   1st Qu.: 29.10  
Median :1    Mode  :character   Median : 30.82  
Mean   :1                       Mean   : 31.02  
3rd Qu.:1                       3rd Qu.: 32.77  
Max.   :1                       Max.   :101.02  
NA's   :59      
> datos2015<- datos2015 %>% convert_as_factor(gender,name,code,round,heat,lane,stroke)
> summary(datos2015)
   athleteid        lastname          firstname          birthdate         gender  
 Min.   :100392   Length:11423       Length:11423       Length:11423       F:5236  
 1st Qu.:101501   Class :character   Class :character   Class :character   M:6187  
 Median :103266   Mode  :character   Mode  :character   Mode  :character           
 Mean   :106980                                                                    
 3rd Qu.:110718                                                                    
 Max.   :125573                                                                    
                                                                                   
            name           code         eventid            heat           lane     
 United States: 755   USA    : 755   Min.   :  1.00   1      :3181   4      :1303  
 China        : 507   CHN    : 507   1st Qu.: 13.00   2      :2297   6      :1269  
 Australia    : 479   AUS    : 479   Median : 30.00   3      :1838   5      :1247  
 Great Britain: 462   GBR    : 462   Mean   : 53.15   4      :1561   2      :1246  
 Germany      : 411   GER    : 411   3rd Qu.: 39.00   5      :1317   3      :1215  
 Italy        : 382   ITA    : 382   Max.   :428.00   6      : 439   7      :1202  
 (Other)      :8427   (Other):8427                    (Other): 790   (Other):3941  
     points        reactiontime       swimtime           split         cumswimtime     
 Min.   :  52.0   Min.   :0.4200   Min.   :  21.19   Min.   : 1.000   Min.   :  21.19  
 1st Qu.: 783.0   1st Qu.:0.6800   1st Qu.: 114.10   1st Qu.: 1.000   1st Qu.:  49.45  
 Median : 853.0   Median :0.7200   Median : 231.31   Median : 3.000   Median :  99.36  
 Mean   : 826.6   Mean   :0.7205   Mean   : 366.11   Mean   : 6.296   Mean   : 197.01  
 3rd Qu.: 902.0   3rd Qu.:0.7600   3rd Qu.: 523.24   3rd Qu.: 8.000   3rd Qu.: 255.23  
 Max.   :1028.0   Max.   :0.9700   Max.   :1137.27   Max.   :30.000   Max.   :1137.27  
 NA's   :71       NA's   :61       NA's   :59                         NA's   :59       
 splitdistance       daytime     round         distance        relaycount    stroke    
 Min.   :  50.0   Min.   : 930   FIN:1475   Min.   :  50.0   Min.   :1    BACK  :1053  
 1st Qu.:  50.0   1st Qu.:1000   PRE:8904   1st Qu.: 200.0   1st Qu.:1    BREAST:1205  
 Median : 150.0   Median :1048   SEM:1022   Median : 400.0   Median :1    FLY   :1095  
 Mean   : 314.8   Mean   :1192   SOP:   4   Mean   : 580.5   Mean   :1    FREE  :6782  
 3rd Qu.: 400.0   3rd Qu.:1117   SOS:  18   3rd Qu.: 800.0   3rd Qu.:1    MEDLEY:1288  
 Max.   :1500.0   Max.   :1943              Max.   :1500.0   Max.   :1                 
                                                                                       
 splitswimtime   
 Min.   : 21.19  
 1st Qu.: 29.10  
 Median : 30.82  
 Mean   : 31.02  
 3rd Qu.: 32.77  
 Max.   :101.02  
 NA's   :59      
> datos2015$birthdate <- as.Date(datos2015$birthdate)
> #Calculamos la edad
  > fechaKazan<- as.Date("2015-07-24")
> datos2015$edad <- as.numeric(difftime(fechaKazan, datos2015$birthdate, units = "weeks")) %/% 52  # Convertir de semanas a años
> nadadoresParticipantes <- datos2015 %>%
  +   distinct(athleteid, .keep_all = TRUE)
> summary(nadadoresParticipantes$edad)
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
10.00   19.00   21.00   21.32   24.00   38.00 
> datos_edad_10 <- datos2015[datos2015$edad == 10, ]
> datos_edad_10
> ggplot(nadadoresParticipantes, aes(x = edad)) +
  + geom_density() +
  + ggtitle("Distribución. Edades.")
> summary(nadadoresParticipantes$gender)
F   M 
494 616 
> hist_varF <- ggplot(data = subset(nadadoresParticipantes,gender== 'F')) +
  + geom_histogram(mapping = aes(x = edad), binwidth = 2)
> 
  > hist_varM <- ggplot(data = subset(nadadoresParticipantes,gender== 'M'))+
  + geom_histogram(mapping = aes(x = edad), binwidth = 2)
> hist_varF 
> hist_varM
> summary(nadadoresParticipantes$name)
China            United States                    Italy 
39                       37                       31 
Russia                Australia                  Germany 
30                       29                       27 
Great Britain                   Brazil                    Japan 
25                       23                       23 
France                   Canada                  Hungary 
22                       19                       16 
Poland           Czech Republic                   Mexico 
16                       13                       13 
Greece                   Turkey                Venezuela 
12                       12                       12 
Finland                    Spain              Switzerland 
11                       11                       11 
Belarus                   Israel              Netherlands 
10                       10                       10 
Serbia                 Slovenia                   Sweden 
10                       10                       10 
Austria                  Denmark                    Egypt 
9                        9                        9 
Korea                Singapore                 Colombia 
9                        9                        8 
Estonia                Lithuania                 Malaysia 
8                        8                        8 
New Zealand                 Thailand                  Belgium 
8                        8                        7 
Chinese Taipei                Hong Kong                 Slovakia 
7                        7                        7 
Ukraine               Uzbekistan                Argentina 
7                        7                        6 
India                Indonesia                   Jordan 
6                        6                        6 
Luxembourg                  Bahamas                 Bulgaria 
6                        5                        5 
Croatia                  Iceland                   Kuwait 
5                        5                        5 
Latvia                  Moldova                 Paraguay 
5                        5                        5 
Portugal             South Africa                  Vietnam 
5                        5                        5 
Albania        Antigua & Barbuda                  Armenia 
4                        4                        4 
Aruba               Azerbaijan                  Bahrain 
4                        4                        4 
Barbados                  Bolivia       Bosnia-Herzegovina 
4                        4                        4 
Botswana                    Chile               Costa Rica 
4                        4                        4 
Cyprus       Dominican Republic            Faroe Islands 
4                        4                        4 
Fina                  Georgia                    Ghana 
4                        4                        4 
Guatemala                 Honduras              Ivory Coast 
4                        4                        4 
Kenya                   Kosovo               Kyrgyzstan 
4                        4                        4 
Lebanon                    Macau                 Maldives 
4                        4                        4 
Malta                 Mongolia               Mozambique 
4                        4                        4 
Namibia                    Nepal Northern Mariana Islands 
4                        4                        4 
Pakistan         Papua New Guinea                     Peru 
4                        4                        4 
Philippines                  Romania                   Rwanda 
4                        4                        4 
(Other) 
242 
> ejemplo<-datos2015[datos2015$distance == 100 & datos2015$stroke=="BACK" & datos2015$code=="AUS", ]
> head(ejemplo,6)
> nadadoresPruebas <- datos2015 %>%
  +   distinct(eventid, athleteid, .keep_all = TRUE)
> 
  > nadadoras800free<-nadadoresPruebas[nadadoresPruebas$distance==800 & nadadoresPruebas$gender=="F", ]
> 
  > dim(nadadoras800free)
[1] 52 23
> ggplot(nadadoresPruebas, aes(x = reactiontime)) +
  + geom_density() +
  + ggtitle("Distribución. reactiontime")
> 
  > nadadorasPruebas<-nadadoresPruebas[nadadoresPruebas$gender=="F" & nadadoresPruebas$stroke=="FREE", ]
> ggplot(nadadoras800free, aes(x = reactiontime)) +
  + geom_density() +
  + ggtitle("Distribución. reactiontime 800m free Women")
> 
  > ggplot(nadadoras50free, aes(x=reactiontime))+geom_density()+ggtitle("Dstribución. reactiontime 50m free Women")
> ggplot(nadadoresPruebas, aes(nadadoresPruebas$lane)) + geom_bar(fill = "orange") +
  + theme_bw()
> ggplot(nadadoresPruebas, aes(x = points)) +
  + geom_density() +
  + ggtitle("Distribución. points")
> ggplot(nadadoresPruebas, aes(daytime)) + geom_bar(width=0.5, colour="red", fill="skyblue") + ggtitle("Daytime en los que se producen las pruebas")
> prueba800libresPreliminar<- datos2015[datos2015$distance==800 & datos2015$gender=="F" & datos2015$stroke=="FREE" & datos2015$round=="PRE", ]
> 
  > prueba800libresPreliminar <- prueba800libresPreliminar %>%
  +     select(lastname,firstname,gender, reactiontime, splitdistance, splitswimtime, edad, swimtime)
> pruebawide <- prueba800libresPreliminar %>%
  +   pivot_wider(names_from = splitdistance,       # Los valores de 'Split' serán los nombres de las columnas
                  +               values_from =splitswimtime)     # Los valores de 'Tiempo' llenarán las celdas
> pruebawide
> View(pruebawide)