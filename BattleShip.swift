/*

PROBLEM NAME -- BATTLESHIP

You're playing Battleship on a grid of cells with R rows and C columns.
There are 0 or more battleships on the grid, each occupying a single distinct cell.
The cell in the ith row from the top and jth column from the left either contains a battleship (Gi,j = 1) or doesn't (Gi,j = 0).
You're going to fire a single shot at a random cell in the grid.
You'll choose this cell uniformly at random from the R * C possible cells.
You're interested in the probability that the cell hit by your shot contains a battleship.
Your task is to implement the function getHitProbability(R, C, G) which returns this probability.

Note: Your return value must have an absolute or relative error of at most 10 to the power −6 to be considered correct.

Constraints
1 ≤ R, C ≤ 100
0 ≤ Gi,j ≤ 1

Sample Explanation
In the first case, 3 of the 6 cells in the grid contain battleships.
Therefore, the probability that your shot will hit one of them is 3/6 = 0.5

In the second case, all 4 cells contain battleships, resulting in a probability of 1.0 of hitting a battleship.
*/

/* SAMPLE TEST CASES

TEST CASE 1:
R = 2
C = 3
G = 0 0 1
    1 0 1

Expected Return Value = 0.50000000

TEST CASE 2:
R = 2
C = 2
G = 1 1
    1 1

Expected Return Value = 1.00000000

SOLUTION

Time Complexity
The function iterates through each cell in the R×C grid exactly once to count the number of battleships.
Therefore, the time complexity is O(R×C).

Space Complexity
The function uses a constant amount of additional space (for variables like numberOfBattleships and totalNumberOfCells).
The grid G is passed as an input, so we don't consider it when calculating the additional space complexity.
Therefore, the space complexity is O(1).

In summary:

Time Complexity:
O(R×C)
Space Complexity:
O(1)

*/

func getHitProbability(_ R: Int, _ C: Int, _ G: [[Int]]) -> Float {

  var numberOfBattleShips: Int = 0

  var numberOfCells: Int = R * C

  //Find the actual number of battleships
  for row in 0..<R {
    for column in 0..<C {
      if G[row][column] == 1 { // Meaning cell has battleship
        numberOfBattleShips += 1
      }
    }
  }

  let probabilityOfHittingBattleship = Float(numberOfBattleShips) / Float(numberOfCells)

  return probabilityOfHittingBattleship
}

// Sample Test Case 1
let R1 = 2
let C1 = 3
let G1 = [
    [0, 0, 1],
    [1, 0, 1]
]
print(getHitProbability(R: R1, C: C1, G: G1))  // Expected output: 0.5

// Sample Test Case 2
let R2 = 2
let C2 = 2
let G2 = [
    [1, 1],
    [1, 1]
]
print(getHitProbability(R: R2, C: C2, G: G2))  // Expected output: 1.0
