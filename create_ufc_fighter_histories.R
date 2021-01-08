library(data.table)


df <- fread('E:/UFC-Analytics/Processed Data/fight_level_stats.csv')


fighters <- c('Stipe Miocic', 'Conor McGregor', 'Khabib Nurmagomedov', 'Israel Adesanya', 'Kamaru Usman', 
              'Max Holloway', 'Amanda Nunes', 'Ronda Rousey', 'Holly Holm', 'Valentina Shevchenko')



df <- df[F1_Name %in% fighters, .(F1_Name, F2_Name, 
                                  Date = EventDate, Event, WeightClass = WeightClass_clean, 
                                  TitleFight = grepl('belt', FightBonus), 
                                  Result = Result_clean, EndRound, EndTime, 
                                  F1_Reach_in, F2_Reach_in, F1_Height_in, F2_Height_in, F1_Win, F1_Loss, 
                                  F1_StrikesLanded = F1_TSl, F2_StrikesLanded = F2_TSl, 
                                  F1_StrikesAttempted = F1_TSa, F2_StrikesAttempted = F2_TSa)]

setkey(df, F1_Name, Date)


fwrite(df, 'E:/Tutorials/data/ufc_fighter_histories.csv')

