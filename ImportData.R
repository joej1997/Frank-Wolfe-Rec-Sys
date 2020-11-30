combined_data_1 <- read.csv2("C:/Users/joeja/Desktop/CPSC/CPSC536M/Project/combined_data_1.txt", header=FALSE, sep="")

library(stringr)
library(lubridate)
MovieDat<-matrix(NA,nrow = 0,ncol = 3)
dat<-combined_data_1$V1
for(i in 1:length(dat)){
  if(str_detect(dat[i],":")){
    curmovie<-as.numeric(substr(dat[i],1,str_length(dat[i])-1))
    print(i)
  } else{
    cur<-str_split(dat[i],",")
    if(year(as.Date(cur[[1]][3]))==2000){
      vec<-c(curmovie, as.numeric(cur[[1]][1]), as.numeric(cur[[1]][2]))
      MovieDat<-rbind(MovieDat,vec)
    }
  }
}


combined_data_1 <- read.csv2("C:/Users/joeja/Desktop/CPSC/CPSC536M/Project/combined_data_2.txt", header=FALSE, sep="")

dat<-combined_data_1$V1
for(i in 1:length(dat)){
  if(str_detect(dat[i],":")){
    curmovie<-as.numeric(substr(dat[i],1,str_length(dat[i])-1))
    print(i)
  } else{
    cur<-str_split(dat[i],",")
    if(year(as.Date(cur[[1]][3]))==2000){
      vec<-c(curmovie, as.numeric(cur[[1]][1]), as.numeric(cur[[1]][2]))
      MovieDat<-rbind(MovieDat,vec)
    }
  }
}


combined_data_1 <- read.csv2("C:/Users/joeja/Desktop/CPSC/CPSC536M/Project/combined_data_3.txt", header=FALSE, sep="")

dat<-combined_data_1$V1
for(i in 1:length(dat)){
  if(str_detect(dat[i],":")){
    curmovie<-as.numeric(substr(dat[i],1,str_length(dat[i])-1))
    print(i)
  } else{
    cur<-str_split(dat[i],",")
    if(year(as.Date(cur[[1]][3]))==2000){
      vec<-c(curmovie, as.numeric(cur[[1]][1]), as.numeric(cur[[1]][2]))
      MovieDat<-rbind(MovieDat,vec)
    }
  }
}



combined_data_1 <- read.csv2("C:/Users/joeja/Desktop/CPSC/CPSC536M/Project/combined_data_4.txt", header=FALSE, sep="")

dat<-combined_data_1$V1
for(i in 1:length(dat)){
  if(str_detect(dat[i],":")){
    curmovie<-as.numeric(substr(dat[i],1,str_length(dat[i])-1))
    print(i)
  } else{
    cur<-str_split(dat[i],",")
    if(year(as.Date(cur[[1]][3]))==2000){
      vec<-c(curmovie, as.numeric(cur[[1]][1]), as.numeric(cur[[1]][2]))
      MovieDat<-rbind(MovieDat,vec)
    }
  }
}

MovieDatFinal<-MovieDat
MovieDatFinal<-as.data.frame(MovieDatFinal)
colnames(MovieDatFinal)<-c("MovieID","UserID","Rating")


netflix_genres <- read.csv("C:/Users/joeja/Desktop/CPSC/CPSC536M/Project/netflix_genres.csv")
MovieDatFinal<-merge(MovieDatFinal,netflix_genres,by.x="MovieID",by.y="movieId")
MovieDatFinal$Action<-str_detect(MovieDatFinal$genres,"Action")
MovieDatFinal$Adventure<-str_detect(MovieDatFinal$genres,"Adventure")
MovieDatFinal$Animation<-str_detect(MovieDatFinal$genres,"Animation")
MovieDatFinal$Biography<-str_detect(MovieDatFinal$genres,"Biography")
MovieDatFinal$Comedy<-str_detect(MovieDatFinal$genres,"Comedy")
MovieDatFinal$Crime<-str_detect(MovieDatFinal$genres,"Crime")
MovieDatFinal$Documentary<-str_detect(MovieDatFinal$genres,"Documentary")
MovieDatFinal$Drama<-str_detect(MovieDatFinal$genres,"Drama")
MovieDatFinal$Family<-str_detect(MovieDatFinal$genres,"Family")
MovieDatFinal$Fantasy<-str_detect(MovieDatFinal$genres,"Fantasy")
MovieDatFinal$History<-str_detect(MovieDatFinal$genres,"History")
MovieDatFinal$Horror<-str_detect(MovieDatFinal$genres,"Horror")
MovieDatFinal$Music<-str_detect(MovieDatFinal$genres,"Music")
MovieDatFinal$Musical<-str_detect(MovieDatFinal$genres,"Musical")
MovieDatFinal$Mystery<-str_detect(MovieDatFinal$genres,"Mystery")
MovieDatFinal$RealityTV<-str_detect(MovieDatFinal$genres,"Reality-TV")
MovieDatFinal$Romance<-str_detect(MovieDatFinal$genres,"Romance")
MovieDatFinal$Sport<-str_detect(MovieDatFinal$genres,"Sport")
MovieDatFinal$SciFi<-str_detect(MovieDatFinal$genres,"Sci-Fi")
MovieDatFinal$TalkShow<-str_detect(MovieDatFinal$genres,"Talk-Show")
MovieDatFinal$Thriller<-str_detect(MovieDatFinal$genres,"Thriller")
MovieDatFinal$War<-str_detect(MovieDatFinal$genres,"War")
MovieDatFinal$Western<-str_detect(MovieDatFinal$genres,"Western")

MovieDatFinal$genres<-NULL

write.csv(MovieDatFinal,"C:/Users/joeja/Desktop/CPSC/CPSC536M/Project/MovieDat.csv",row.names = F)

