#!/usr/bin/python
# -*- coding: iso-8859-1 -*-
# author: M. Luz Congosto & Wenceslao Arroyo Machado.
# Creative commons 3.0 spain
# http://creativecommons.org/licenses/by-nc/3.0/es/

library(readr)
library(stringr)
library(ggplot2)
library(tidyr)
library(scales)
library(dplyr)

name_file_csv='../datasets/sanchezcastejon_follower_profiles.csv'
followers_csv <- read_csv(name_file_csv)
df <- data.frame(followers_csv)


ggplot(data = df, aes(x = since))+
  geom_histogram(color = "white",
                 fill = "cornflowerblue",
                 bins=15,
                 aes(y=(..count..)/sum(..count..))) +
  stat_bin(bins=15,geom='text', color='black', size=2, aes(y=(..count..)/sum(..count..), label=paste0(round(100*(..count..)/sum(..count..),2),'%')),
           position=position_stack(vjust = 1), vjust = -0.5)+
  scale_y_continuous("Porcentaje de perfiles",labels = scales::percent_format(accuracy = 1))+
  labs(x = "Año de creación del perfil", y = "Porcentaje de perfiles",
       title = "Ditribución de los seguidores por antigüedad en Twitter")


ggplot(data = df, aes(x = trunc(log10(ifelse(followers == 0, 1, followers)))))+
  geom_histogram(color = "white",
                 fill = "cornflowerblue",
                 bins=8,
                 aes(y=(..count..)/sum(..count..))) +
  stat_bin(bins=8,geom='text', color='black', size=3, aes(y=(..count..)/sum(..count..), label=paste0(round(100*(..count..)/sum(..count..),2),'%')),
           position=position_stack(vjust = 1), vjust = -0.5)+
  scale_y_continuous(labels = scales::percent_format(accuracy = 1))+
  labs(x = "Log (Followers)", y = "Porcentaje de perfiles",
       title = "Ditribución por número de seguidores")
 
ggplot(data = df, aes(x = trunc(log10(statuses))))+
  geom_histogram(color = "white",
                 fill = "cornflowerblue",
                 bins=7,
                 aes(y=(..count..)/sum(..count..))) +
  stat_bin(bins=7,geom='text', color='black', size=3, aes(y=(..count..)/sum(..count..), label=paste0(round(100*(..count..)/sum(..count..),2),'%')),
           position=position_stack(vjust = 1), vjust = -0.5)+
  scale_y_continuous(labels = scales::percent_format(accuracy = 1))+
  labs(x = "Log (Tweets)", y = "Porcentaje de perfiles",
       title = "Ditribución por número de tweets publicados")

ggplot(data = df, aes(x = trunc(log10(following))))+
  geom_histogram(color = "white",
                 fill = "cornflowerblue",
                 bins=7,
                 aes(y=(..count..)/sum(..count..))) +
  stat_bin(bins=7,geom='text', color='black', size=3, aes(y=(..count..)/sum(..count..), label=paste0(round(100*(..count..)/sum(..count..),2),'%')),
           position=position_stack(vjust = 1), vjust = -0.5)+
  scale_y_continuous(labels = scales::percent_format(accuracy = 1))+
  labs(x = "Log (Following)", y = "Porcentaje de perfiles",
       title = "Ditribución por número de following")

df2 <- df[which(df$followers == 0),names(df) %in% c("screen_name","followers","statuses","since")]
df3 <- df[which(df$followers < 10),names(df) %in% c("screen_name","followers","statuses","since")]
dim(df2)/dim(df)
ggplot(data = df2, aes(x = since))+
  geom_histogram(color = "white",
                 fill = "cornflowerblue",
                 bins=15,
                 aes(y=(..count..)/sum(..count..))) +
  stat_bin(bins=15,geom='text', color='black', size=2, aes(y=(..count..)/sum(..count..), label=paste0(round(100*(..count..)/sum(..count..),2),'%')),
           position=position_stack(vjust = 1), vjust = -0.5)+
  scale_y_continuous(labels = scales::percent_format(accuracy = 1))+
  labs(x = "Año de creación del perfil", y = "Porcentaje de perfiles",
       title = "Ditribución por antigüedad en Twitter sin seguidores")

ggplot(data = df2, aes(x = trunc(log10(ifelse(statuses == 0, 1, statuses)))))+
  geom_histogram(color = "white",
                 fill = "cornflowerblue",
                 bins=7,
                 aes(y=(..count..)/sum(..count..))) +
  stat_bin(bins=7,geom='text', color='black', size=3, aes(y=(..count..)/sum(..count..), label=paste0(round(100*(..count..)/sum(..count..),2),'%')),
           position=position_stack(vjust = 1), vjust = -0.5)+
  scale_y_continuous(labels = scales::percent_format(accuracy = 1))+
  labs(x = "Log (Tweets)", y = "Porcentaje de perfiles",
       title = "Ditribución por tweets publicados sin seguidores")

ggplot(data = df3, aes(x = since))+
  geom_histogram(color = "white",
                 fill = "cornflowerblue",
                 bins=15,
                 aes(y=(..count..)/sum(..count..))) +
  stat_bin(bins=15,geom='text', color='black', size=2, aes(y=(..count..)/sum(..count..), label=paste0(round(100*(..count..)/sum(..count..),2),'%')),
           position=position_stack(vjust = 1), vjust = -0.5)+
  scale_y_continuous(labels = scales::percent_format(accuracy = 1))+
  labs(x = "Año de creación del perfil", y = "Porcentaje de perfiles",
       title = "Ditribución por antigüedad en Twitter < 10 seguidores")

ggplot(data = df3, aes(x = trunc(log10(ifelse(statuses == 0, 1, statuses)))))+
  geom_histogram(color = "white",
                 fill = "cornflowerblue",
                 bins=7,
                 aes(y=(..count..)/sum(..count..))) +
  stat_bin(bins=7,geom='text', color='black', size=3, aes(y=(..count..)/sum(..count..), label=paste0(round(100*(..count..)/sum(..count..),2),'%')),
           position=position_stack(vjust = 1), vjust = -0.5)+
  scale_y_continuous(labels = scales::percent_format(accuracy = 1))+
  labs(x = "Log (Tweets)", y = "Porcentaje de perfiles",
       title = "Ditribución por tweets publicados con < 10 seguidores")
