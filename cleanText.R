
# ============= clean text

library(tidyverse)
library(stringi)
library(tidytext)
# install.packages('quanteda')
library(quanteda)
library("quanteda.textplots")
library(quanteda.textstats)


# stopped at 2-10, clean text in in clean2-0
tdf = read.delim2(file = "./season2/siliconvalley2-10.txt", header = F)
tdf

tdf = tdf %>% 
  str_replace_all("its", replacement = "it's") %>% 
  str_replace_all("fck", replacement = "fuck") %>% 
  str_replace_all("dck", replacement = "dick") %>% 
  str_replace_all("asshle", replacement = "asshole") %>% 
  str_replace_all("     push", replacement = "") %>% 
  str_replace_all("mtherfucking", replacement = "motherfucking") %>% 
  str_replace_all("mtherfucker", replacement = "motherfucker") %>% 
  str_remove_all("Hip hop music plays") %>% 
  str_remove_all("Rock music plays") %>% 
  str_remove_all("Chanting continues") %>% 
  str_remove_all("Pop music playing") %>% 
  str_remove_all("Latino hiphop music plays") %>% 
  str_remove_all("rap music playing") %>% 
  str_remove_all("light instrumental music") %>% 
  str_remove_all("Music fades") %>% 
  str_remove_all("mariachi band playing") %>% 
  str_remove_all("singing in Spanish") %>% 
  str_remove_all("singing continues") %>% 
  str_remove_all("Background vocals") %>% 
  str_replace_all("wer", replacement = "we're ") %>% 
  str_replace_all("Id", replacement = "I'd") %>% 
  str_remove_all("music playing") %>% 
  str_replace_all("powe're ful", replacement = "powerful") %>% 
  str_replace_all("viewe're s", "viewers")


tdf = as.character(tdf)
tdf


write_file(tdf, file = './season2/clean2-0.txt')
# 








# --------------
sv = readtext::readtext('./tidytext.txt')
corpus(sv)

sv = as.character(sv)
sv
# ---------------




# qtdf = readtext::readtext('./season1/siliconvalley1-00.txt')
# 
# corpus('./season1/siliconvalley1-00.txt')


tdf = as.character(tdf)
tdf

# qtdf = as.character(qtdf)
# qtdf



#------------- tokenized
# ttdf = tokens(tdf)

svt = tokens(sv, remove_punct = TRUE)
svt

#------------- keyword in context = search for word
# kwic(ttdf, pattern = 'Hooli')
# 
# kwic(ttdf, pattern = 'Piper')
# 
# kwic(ttdf, pattern = 'Hooli', valuetype = 'regex')

kwic(svt, pattern = 'Hooli')

# tokenizing text
# tqtdf = tokens(qtdf)
# 
# # remove punctuation
# tokens(tqtdf, remove_punct = TRUE)


#-----------  document feature matrix, features = columns
# tolower() and remove punct() by default

# qdfm = tqtdf %>% dfm()
# qdfm

tdf2 = tdf %>% dfm()

#----- remove English stop words

svt2 = svt %>% dfm(remove= stopwords('english'), remove_punct= TRUE)
svt2

# tdf3 = tdf2 %>% dfm(remove= stopwords('english'), remove_punct= TRUE)

# qdfm2 = tqtdf %>% dfm(remove= stopwords('english'), remove_punct= T)
# qdfm2
# 
# qtdf2 = qtdf %>% dfm(remove= stopwords('english'), remove_punct=T)
# qtdf2

#---------- check stop words 
head( stopwords('en'), 10)

#----------  a list of the most frequently occurring features
topfeatures(tdf3, 20) # top 20

topfeatures(svt2, 20)













library("quanteda.textplots")

textplot_wordcloud(svt2, 
                   min_count = 6, 
                   random_color = FALSE, 
                   rotation = 0.25,
                   color = RColorBrewer::brewer.pal(8, 'PRGn')
)

