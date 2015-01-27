### Assignment : giveBlood() ###
# rm(list=ls())
# library(testthat)
# 
# source("/home/joswi05/Dropbox/RCourse2014/Admin/StudentSolutions/D6/lab6_grupp11.R",encoding="latin1")
# source("/home/joswi05/Dropbox/Rkurs/KursRprgmTeacher/Labs/Solutions/LabSolutions_6.R",encoding="latin1")

context("give_blood()")

error_info <- function(parameters, funcName){
  index<-sapply(X=parameters,FUN=is.null)
  parameters[index]<-"NULL"
  parameters<-lapply(X=parameters,FUN=as.character)
  x<-paste("Problem i ",funcName,"() när den anropas med: ",paste(paste(names(parameters),"=",parameters[names(parameters)],sep=""),collapse="  "),sep="")
  return(x)
}

test_that("Assignment: give_blood()", {
  # Create test suite
  library(lubridate)
  test_list <- list(
    list(lasttime = ymd("2014-02-24"),
         holiday = "hemma",
         sex = "f",
         type_of_travel = NULL),
    list(lasttime = ymd("2014-02-24"),
         holiday = "hemma",
         sex = "m",
         type_of_travel = NULL),
    list(lasttime = ymd("2014-02-24"),
         holiday = interval(ymd("2014-03-23"), ymd("2014-04-24")),
         sex = "f",
         type_of_travel = "malaria"),
    list(lasttime = ymd("2014-02-24"),
         holiday = interval(ymd("2014-03-23"), ymd("2014-04-24")),
         sex = "m",
         type_of_travel = "malaria"),
    list(lasttime = ymd("2014-02-24"),
         holiday = interval(ymd("2014-04-13"), ymd("2014-05-23")),
         sex = "f",
         type_of_travel = "other"),
    list(lasttime = ymd("2014-02-24"),
         holiday = interval(ymd("2014-04-13"), ymd("2014-05-23")),
         sex = "m",
         type_of_travel = "other")
  )
  
  test_results <- c("year=2014 month=Jun day=24 weekday=Tuesday",
                    "year=2014 month=May day=26 weekday=Monday",
                    "year=2014 month=Oct day=27 weekday=Monday",
                    "year=2014 month=Oct day=27 weekday=Monday",
                    "year=2014 month=Jun day=24 weekday=Tuesday",
                    "year=2014 month=Jun day=23 weekday=Monday")
    
  # övergripande om funktionen:
  expect_that(exists("give_blood"), is_true(),
              info = "Fel: give_blood() saknas.")
  expect_that(give_blood, is_a("function"),
              info = "Fel: give_blood ska vara en funktion.")
  expect_self_contained(object = give_blood,
                        "Fel: Funktionen har fria variabler")
  expect_that(all(names(formals(give_blood)) %in% c("lasttime","holiday","sex","type_of_travel")), condition=is_true(),
              info = "Fel: Argumenten har felaktiga namn.")
  expect_that(do.call(what=give_blood,args=test_list[[1]]), is_a("character"),
              info = "Fel: Funktionen returnerar inte en text-vektor")
  
  # testfall:
  for(i in seq_along(test_list)){
    expect_that(do.call(give_blood, test_list[[i]]) == test_results[i], is_true(),
                info = error_info(parameters=test_list[[i]],funcName="give_blood"))
  } 
})