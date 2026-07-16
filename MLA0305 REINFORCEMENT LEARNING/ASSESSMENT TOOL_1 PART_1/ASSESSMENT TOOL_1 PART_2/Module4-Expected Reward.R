#---------------------------------------
# Module 4: Expected Immediate Reward
#---------------------------------------

states <- c("S1", "S2", "S3")
actions <- c("A1", "A2")

# Transition Probabilities
prob <- matrix(c(
  0.6,0.2,
  0.4,0.8,
  0.7,0.5,
  0.3,0.5,
  0.9,0.4,
  0.1,0.6
), ncol=2, byrow=TRUE)

# Rewards
reward <- matrix(c(
  5,-1,
  10,-5,
  3,2,
  7,1,
  4,0,
  6,-2
), ncol=2, byrow=TRUE)

row_names <- c("S1-A1","S1-A2",
               "S2-A1","S2-A2",
               "S3-A1","S3-A2")

for(i in 1:6)
{
  expected_reward <- sum(prob[i,] * reward[i,])
  
  cat(row_names[i], "\n")
  cat("Expected Immediate Reward =", expected_reward, "\n\n")
}