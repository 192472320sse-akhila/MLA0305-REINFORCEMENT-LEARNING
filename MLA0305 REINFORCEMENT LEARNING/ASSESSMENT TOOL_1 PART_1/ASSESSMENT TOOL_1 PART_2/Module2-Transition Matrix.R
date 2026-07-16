#---------------------------------------
# Module 2: Transition Probability Matrix
#---------------------------------------

states <- c("S1", "S2", "S3")

# Transition Probability Matrix for Action A1
A1 <- matrix(c(
  0.0, 0.6, 0.2,
  0.7, 0.0, 0.5,
  0.9, 0.4, 0.0
), nrow = 3, byrow = TRUE)

rownames(A1) <- states
colnames(A1) <- states

cat("Transition Probability Matrix for Action A1\n")
print(A1)

# Transition Probability Matrix for Action A2
A2 <- matrix(c(
  0.0, 0.4, 0.8,
  0.3, 0.0, 0.5,
  0.1, 0.6, 0.0
), nrow = 3, byrow = TRUE)

rownames(A2) <- states
colnames(A2) <- states

cat("\nTransition Probability Matrix for Action A2\n")
print(A2)