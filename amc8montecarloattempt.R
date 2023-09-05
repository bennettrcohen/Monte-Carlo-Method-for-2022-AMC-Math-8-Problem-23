## Initialize n, number of iterations
## Initialize success, a success count variable
n <- 100000
success <- 0

for (i in 1:n) {
  ## Randomly generate a 3x3 grid of triangles and circles
  ## Triangle = 0
  ## Circle = 1
  board <- sample(c(0,1), replace = T, size = 9)
  board_mat <- matrix(board, nrow = 3)
  board_mat
  
  ## Calculate row and column sums of the grid
  row <- rowSums(board_mat)
  col <- colSums(board_mat)
  
  ## A row sum of 0 or 3 indicates a line of 3 circles or triangles
  xtri <- length(which(row == 0))
  xcir <- length(which(row == 3))
  
  ## A column sum of 0 or 3 indicates a line of 3 circles or triangles
  ytri <- length(which(col == 0))
  ycir <- length(which(col == 3))
  
  
  ## Check if success condition has been met
  if (xtri >= 1 & xcir >= 1) {
    success <- success + 1
  }
  
  if (ytri >= 1 & ycir >= 1) {
    success <- success + 1
  }
}

## Compute proportion of success over total iterations
## Take that proportion of total possible configurations
(success/n) * 2^9
