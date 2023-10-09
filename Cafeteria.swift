/*

PROBLEM NAME -- CAFETERIA

A cafeteria table consists of a row of N seats, numbered from 1 to N from left to right.
Social distancing guidelines require that every diner be seated such that K seats to their left and K seats to their right (or all the remaining seats to that side if there are fewer than K) remain empty.
There are currently M diners seated at the table, the ith of whom is in seat Si.

No two diners are sitting in the same seat, and the social distancing guidelines are satisfied.

Determine the maximum number of additional diners who can potentially sit at the table without social distancing guidelines being violated for any new or existing diners, assuming that the existing diners cannot move and that the additional diners will cooperate to maximize how many of them can sit down.
Please take care to write a solution which runs within the time limit.

Constraints
1 ≤ N ≤ 10 to the power 15

1 ≤ K ≤ N

1 ≤ M ≤ 500,000
M ≤ N

1 ≤ Si ≤ N

Sample test case #1

N = 10
K = 1
M = 2
S = [2, 6]

Expected Return Value = 3

Sample test case #2
N = 15
K = 2
M = 3
S = [11, 6, 14]

Expected Return Value = 1

Sample Explanation

In the first case, the cafeteria table has N=10 seats, with two diners currently at seats 2 and 6 respectively.
The table initially looks as follows, with brackets covering the K=1 seat to the left and right of each existing diner that may not be taken.

  1 2 3 4 5 6 7 8 9 10
  [   ]   [   ]

Three additional diners may sit at seats 4, 8, and 10 without violating the social distancing guidelines.

In the second case, only 1 additional diner is able to join the table, by sitting in any of the first 3 seats.

SOLUTION:

TIME COMPLEXITY:
SPACE COMPLEXITY:

*/

// N = Number of Seats
// K = Social Distancing Seats
// M = Number of Seated Diners
// S = List of Occupied Seats

func maxAdditionalDiners(N: Int, K: Int, M: Int, S: [Int]) -> Int {
    // Sort the array of seats already occupied by existing diners.
    let sortedOccupiedSeats = S.sorted()

    // Keep track of the number of additional diners
    var additionalDiners = 0

    // Check for open spots before the first diner
    if let firstDiner = sortedOccupiedSeats.first {
        additionalDiners += max(0, (firstDiner - K - 1) / (K + 1))
    }

    // Check for open spots after the last diner
    if let lastDiner = sortedS.last {
        additionalDiners += max(0, (N - (lastDiner + K)) / (K + 1))
    }

    // Check for open spots between adjacent diners
    for i in 1..<M {
        let distanceBetweenDiners = sortedS[i] - sortedS[i - 1] - 1
        let noGoZones = 2 * K  // The distance that must be empty to the left and right of each diner
        let potentialSpots = distanceBetweenDiners - noGoZones
        additionalDiners += max(0, potentialSpots / (K + 1))
    }

    return additionalDiners
}

// Sample test case #1
print(maxAdditionalDiners(N: 10, K: 1, M: 2, S: [2, 6]))  // Output should be 3

// Sample test case #2
print(maxAdditionalDiners(N: 15, K: 2, M: 3, S: [11, 6, 14]))  // Output should be 1
