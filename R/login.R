library(RSelenium)
startServer()
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4444, browserName = "firefox")
remDr$open()

van_login <- function(x, y, z){
    remDr$navigate("https://www.votebuilder.com")
    option1 <- remDr$findElement(using = 'xpath', "//*[@id='TextBoxUserName']")
    option1$sendKeysToElement(list(x))
    option2 <- remDr$findElement(using = 'xpath', "//*[@id='TextBoxPassword']")
    option2$sendKeysToElement(list(y))
    option3 <- remDr$findElement(using = 'xpath',"//*[@id='ctl00_ContentPlaceHolderVANPage_ButtonLogin']")
    option3$clickElement()
    one<- remDr$findElement(using = 'css', "div.pin-row:nth-child(1) > div:nth-child(1) > div:nth-child(1) > span:nth-child(2)")
    one<- unlist(one$getElementText())
    two<- remDr$findElement(using = 'css', "div.pin-row:nth-child(1) > div:nth-child(2) > div:nth-child(1) > span:nth-child(2)")
    two<- unlist(two$getElementText())
    three<- remDr$findElement(using = 'css', "div.pin-row:nth-child(1) > div:nth-child(3) > div:nth-child(1) > span:nth-child(2)")
    three<- unlist(three$getElementText())
    four<- remDr$findElement(using = 'css', "div.pin-row:nth-child(2) > div:nth-child(1) > div:nth-child(1) > span:nth-child(2)")
    four<- unlist(four$getElementText())
    five<- remDr$findElement(using = 'css', "div.pin-row:nth-child(2) > div:nth-child(2) > div:nth-child(1) > span:nth-child(2)")
    five<- unlist(five$getElementText())
    six<- remDr$findElement(using = 'css', "div.pin-row:nth-child(2) > div:nth-child(3) > div:nth-child(1) > span:nth-child(2)")
    six<- unlist(six$getElementText())
    seven<- remDr$findElement(using = 'css', "div.pin-row:nth-child(3) > div:nth-child(1) > div:nth-child(1) > span:nth-child(2)")
    seven<- unlist(seven$getElementText())
    eight<- remDr$findElement(using = 'css', "div.pin-row:nth-child(3) > div:nth-child(2) > div:nth-child(1) > span:nth-child(2)")
    eight<- unlist(eight$getElementText())
    nine<- remDr$findElement(using = 'css', "div.pin-row:nth-child(3) > div:nth-child(3) > div:nth-child(1) > span:nth-child(2)")
    nine<- unlist(nine$getElementText())
    if(unlist(strsplit(z,""))[1]==1){a <- one}
    else if (unlist(strsplit(z,""))[1]==2){a <- two}
    else if (unlist(strsplit(z,""))[1]==3){a <- three}
    else if (unlist(strsplit(z,""))[1]==4){a <- four}
    else if (unlist(strsplit(z,""))[1]==5){a <- five}
    else if (unlist(strsplit(z,""))[1]==6){a <- six}
    else if (unlist(strsplit(z,""))[1]==7){a <- seven}
    else if (unlist(strsplit(z,""))[1]==8){a <- eight}
    else if (unlist(strsplit(z,""))[1]==9){a <- nine}
    if(unlist(strsplit(z,""))[2]==1){b <-one}
    else if (unlist(strsplit(z,""))[2]==2){b <- two}
    else if (unlist(strsplit(z,""))[2]==3){b <- three}
    else if (unlist(strsplit(z,""))[2]==4){b <- four}
    else if (unlist(strsplit(z,""))[2]==5){b <- five}
    else if (unlist(strsplit(z,""))[2]==6){b <- six}
    else if (unlist(strsplit(z,""))[2]==7){b <- seven}
    else if (unlist(strsplit(z,""))[2]==8){b <- eight}
    else if (unlist(strsplit(z,""))[2]==9){b <- nine}
    if(unlist(strsplit(z,""))[3]==1){c <-one}
    else if (unlist(strsplit(z,""))[3]==2){c <- two}
    else if (unlist(strsplit(z,""))[3]==3){c <- three}
    else if (unlist(strsplit(z,""))[3]==4){c <- four}
    else if (unlist(strsplit(z,""))[3]==5){c <- five}
    else if (unlist(strsplit(z,""))[3]==6){c <- six}
    else if (unlist(strsplit(z,""))[3]==7){c <- seven}
    else if (unlist(strsplit(z,""))[3]==8){c <- eight}
    else if (unlist(strsplit(z,""))[3]==9){c <- nine}
    if(unlist(strsplit(z,""))[4]==1){d <-one}
    else if (unlist(strsplit(z,""))[4]==2){d <- two}
    else if (unlist(strsplit(z,""))[4]==3){d <- three}
    else if (unlist(strsplit(z,""))[4]==4){d <- four}
    else if (unlist(strsplit(z,""))[4]==5){d <- five}
    else if (unlist(strsplit(z,""))[4]==6){d <- six}
    else if (unlist(strsplit(z,""))[4]==7){d <- seven}
    else if (unlist(strsplit(z,""))[4]==8){d <- eight}
    else if (unlist(strsplit(z,""))[4]==9){d <- nine}
    pin<- paste0(a,b,c,d)
    option9 <- remDr$findElement(using = 'xpath',"//*[@id='ctl00_ContentPlaceHolderVANPage_VANDetailsItemPIN_VANInputItemDetailsItemPINCode_PINCode']")
    option9$sendKeysToElement(list(pin))
    option10 <- remDr$findElement(using = 'xpath',"//*[@id='ctl00_ContentPlaceHolderVANPage_ButtonNarrowSubmit']")
    option10$clickElement()
    }
