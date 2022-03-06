
# ======== SILICON VALLEY TRANSCRIPTS

library(tidyverse)
library(rvest)



url = 'https://transcripts.foreverdreaming.org/viewtopic.php?f=631&t=35553'

svalley = read_html(url)

words = svalley %>% html_elements('.postbody') %>% html_text2() %>% 
  # str_remove_all(pattern = "push") %>% 
  str_replace_all("window.adsbygoogle", replacement = "") %>% 
  str_replace_all("adsbygoogle", replacement = "") %>%
  str_remove_all("Transcripts Topic Top") %>%
  str_remove_all("[:punct:]") %>% 
  str_remove_all("[:symbol:]") %>% 
  str_replace_all("fck", replacement = "fuck") %>% 
  str_replace_all("dck", replacement = "dick") %>% 
  str_replace_all("asshle", replacement = "asshole") %>% 
  str_replace("     push", replacement = "") %>% 
  str_replace_all("itll", replacement = "it'll") %>% 
  str_replace_all("Ill", replacement = "I'll") %>% 
  str_replace_all("sx", replacement = "sex") %>% 
  str_replace_all("Well", replacement = "We'll") %>% 
  str_remove_all("explsin") %>% 
  str_replace_all("ATT", replacement = "AT&T")

# words
write_file(words,  file = './season6/siliconvalley6-90.txt')



