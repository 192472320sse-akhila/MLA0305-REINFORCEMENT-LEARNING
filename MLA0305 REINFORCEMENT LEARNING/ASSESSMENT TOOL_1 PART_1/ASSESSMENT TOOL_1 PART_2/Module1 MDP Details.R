#-------------------------------
# Module 1: Display MDP Details
#-------------------------------

# States
states <- c("S1", "S2", "S3")

# Actions
actions <- c("A1", "A2")

cat("States:\n")
print(states)

cat("\nActions:\n")
print(actions)

# Transition Probabilities
transition <- data.frame(
  Current_State = c("S1","S1","S1","S1",
                    "S2","S2","S2","S2",
                    "S3","S3","S3","S3"),
  Action = c("A1","A2","A1","A2",
             "A1","A2","A1","A2",
             "A1","A2","A1","A2"),
  Next_State = c("S2","S2","S3","S3",
                 "S1","S1","S3","S3",
                 "S1","S1","S2","S2"),
  Probability = c(0.6,0.4,0.2,0.8,
                  0.7,0.3,0.5,0.5,
                  0.9,0.1,0.4,0.6)
)

cat("\nTransition Probabilities:\n")
print(transition)

# Reward Table
reward <- data.frame(
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

cat("\nRewards:\n")
print(reward)
