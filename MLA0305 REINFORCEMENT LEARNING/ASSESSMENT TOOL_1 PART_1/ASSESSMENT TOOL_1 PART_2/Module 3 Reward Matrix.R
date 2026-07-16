#---------------------------------------
# Module 3: Reward Matrix
#---------------------------------------

reward_matrix <- data.frame(
  Current_State = c("S1","S1","S1","S1",
                    "S2","S2","S2","S2",
                    "S3","S3","S3","S3"),
  
  Action = c("A1","A2","A1","A2",
             "A1","A2","A1","A2",
             "A1","A2","A1","A2"),
  
  Next_State = c("S2","S2","S3","S3",
                 "S1","S1","S3","S3",
                 "S1","S1","S2","S2"),
  
  Reward = c(5,10,-1,-5,
             3,7,2,1,
             4,6,0,-2)
)

cat("Reward Matrix\n\n")
print(reward_matrix)