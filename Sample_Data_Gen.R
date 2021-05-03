# Setup
library(readr)
library(reshape2)
library(redcapAPI)
library(dplyr)

setwd('P:/RC_Tutorials')
source('api_key.R')
rcon = redcapConnection('https://redcap.hnrc.tufts.edu/api/', token)

# Import Data
data = read_csv('P:/Standard Project/HNRCAStandardProject_DATA_2019-11-19_1222.csv')
data$redcap_event_name = factor(data$redcap_event_name, levels = unique(data$redcap_event_name))
colnames(data)[colnames(data)=='vd_visitdate'] = 'vd_date'
data = select(data, -contains('reason'), -contains('dispenseby'), -contains('withdraw'))

# Convert to long
dataLong = melt(data, id.vars = colnames(data)[1:4], na.rm = T)
row.names(dataLong) = c()

# # Create some IDs
# IDs = sample(10000:99999, 20)

# Generate data
sampData = data.frame()
for (ID in IDs){
  cData = dataLong
  cData$hnrcid = ID
  sDate = sample(seq(as.Date('2019/01/01'), as.Date('2019/12/31'), by = 'day'), 1)

  cData[grepl('date', cData$variable),] = cData[grepl('date', cData$variable),] %>% group_by(variable) %>% mutate(value = as.character(sDate + 0:(n()-1)))
  cData$value[grepl('icf', cData$variable)] = sample(c(0,1),2)
  cData$value[grepl('fast', cData$variable)] = 1
  
  cData$value[cData$variable=='med_type'] = 1
  cData$value[cData$variable=='med_name'] = sample(c('aspirin', 'ibuprofen', 'naproxen sodium'), 2, replace=T)
  cData$value[cData$variable=='med_dose'] = sample(c('100mg', '200mg', '400mg', '800mg'), 2, replace=T)
  cData$value[cData$variable=='med_freq'] = sample(c('Daily', 'Weekly', 'Monthly'), 2, replace=T)
  cData$value[cData$variable=='med_prescription'] = sample(0:1,2)
  
  cData$value[cData$variable=='vacc_type'] = sample(c('DTaP', 'HPV', 'Flu', 'MMR'),2)
  
  cData$value[cData$variable=='v_sbp'] = round(rnorm(4,125,10),0)
  cData$value[cData$variable=='v_dbp'] = round(rnorm(4,70,10),0)
  cData$value[cData$variable=='v_temp'] = round(rnorm(4,98,1),1)
  cData$value[cData$variable=='v_pulse'] = round(rnorm(4,65,12),0)
  cData$value[cData$variable=='v_resp'] = round(rnorm(4,16,1),0)
  
  cData$value[cData$variable=='hw_height'] = round(rnorm(4,170,15),0)
  cData$value[cData$variable=='hw_weight'] = round(rnorm(40,75,15),0)
  
  cData$value[grepl('time', cData$variable)] = paste0(formatC(sample(8:18, 16, replace=T), flag = '0', width = 2),
                                                              ':',sample(10:59, 16, replace=T))
  
  cData$value[cData$variable=='bd_drawloc'] = sample(c('LACV','RACV'), 4, replace=T)
  cData$value[cData$variable=='bd_gauge'] = 21
  
  cData$value[grepl('return', cData$variable)] = rnorm(2,0,3) %>% round(.,0) %>% abs()
  cData$value[grepl('pc_', cData$variable) & !grepl('date', cData$variable)] = sample(c(0,1,2),6,replace=T)
  cData$value[cData$variable=='study_complete'] = sample(c(0,1),1)
  
  cData[nrow(cData)+1,] = c(ID, 'enrollment_visit_arm_1',NA,NA,'group_assign',sample(1:4,1))
  cData$value[cData$variable=='randomization_complete'] = 2
  
  cData[nrow(cData)+1,] = c(ID, 'screening_visit_arm_1',NA,NA,'vd_sex',sample(1:2,1))
  
  sampData = rbind(sampData, cData)
}

# filter(sampData, str_detect(variable, 'time'))

# Convert to wide
sampWide = dcast(sampData, hnrcid+redcap_event_name+redcap_repeat_instrument+redcap_repeat_instance~variable)

# Upload
if(FALSE) {
importRecords(rcon,sampWide)
}

# Save
rm(rcon) + rm(token)
save.image('Sample_Data_Gen.RData')








# dataLong$value[grepl('date', dataLong$variable)] = 
#   dataLong$value[grepl('date', dataLong$variable)] %>% as.integer() %>% 
#     as.Date(., origin="1970-01-01") %>% as.character()
  
# dataWide$redcap_event_name = factor(dataWide$redcap_event_name, levels = unique(data$redcap_event_name))



# events = c('screening_visit_arm_1', 'enrollment_visit_arm_1', 'adherence_arm_1',
#            'visit_1_arm_1', 'visit_2_arm_1', 'visit_3_arm_1',
#            'completion_arm_1')
