#prerequisites
#Firefox- You also need to download a standalone selenium server from "http://selenium-release.storage.googleapis.com/index.html?path=2.53/".
#Choose "selenium-server-standalone-2.53.1.jar", it is the latest stable release
#Once it's downloaded to your desktop, just double click on it to activate it
#nothing will pop-up, but trust that it's working
#you can check lsof -i :4444 in Terminal to verify it as well

#packages required
library(magrittr)
library(rvest)
library(dplyr)
library(RSelenium)

#start the server by
startServer()
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4444, browserName = "firefox")
remDr$open()
remDr$navigate("https://www.votebuilder.com")

automate_bulk_upload<- function(x, y) {

        vrb_click<- paste("//*[@id='", x, "']", sep="")
        vrb <- remDr$findElement(using = 'xpath', vrb_click)
        vrb$clickElement()
        vrb$sendKeysToElement(list(y))}

#go to Bulk Upload Details Wizard
remDr$navigate("https://www.votebuilder.com/BulkUploadDetailsWizard.aspx")
remDr$navigate("https://www.votebuilder.com/BulkUploadCustomFields.aspx?RadWindowClientID=ctl00_ContentPlaceHolderVANPage_RadWindow1&ULFileTypeID=2&ULFileID=6004&ULFieldID=387")

#choose "Apply NCC 2016 Activity Region" for upload type, wait for popup box
#choose "regionname" for Choose Column from Data File" for NCC 2016 Activity Region
#choose "foname" for Choose Column from Data File" for NCC 2016 Activity Organizer
#click "next"

remDr$switchToFrame(remDr$findElement("name", "RadWindow1"))
region_source<- read_html(remDr$getPageSource()[[1]])
region_field<- tbl_df(region_source %>% html_nodes("td") %>% html_children() %>% html_children() %>% html_attr("id") )  %>% filter(grepl("ddl", value)) %>% sapply(as.character) %>% as.vector()
region_answer<- region_source %>% html_nodes("table") %>% extract(1) %>% html_table() %>% extract2(1) %>% slice(-1)  %>% select(X1) %>% sapply(as.character) %>% as.vector()
mapply(automate_bulk_upload, region_field, region_answer)
forward1<- remDr$findElement(using = 'xpath',"//*[@id='ctl01_ContentPlaceHolderVANPage_Next1']")
forward1$clickElement()
Sys.sleep(3)
fo_source<- read_html(remDr$getPageSource()[[1]])
fo_field<- tbl_df(fo_source %>% html_nodes("td") %>% html_children() %>% .[9:68] %>% html_children() %>% html_attr("id") )  %>% filter(grepl("ddl", value)) %>% sapply(as.character) %>% as.vector()
fo_answer<- fo_source %>% html_nodes("table") %>% extract(2) %>% html_table() %>% extract2(1) %>% slice(-1) %>% select(X2) %>% sapply(as.character) %>% as.vector()
mapply(automate_bulk_upload, fo_field, fo_answer)
forward2<- remDr$findElement(using = 'xpath',"//*[@id='ctl01_ContentPlaceHolderVANPage_Next2']")
forward2$clickElement()
