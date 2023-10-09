/*

PROBLEM NAME --- WRONG ANSWERS

There's a multiple-choice test with N questions, numbered from 1 to N.

Each question has 2 answer options, labelled A and B. You know that the correct answer for the ith question is the ith character in the string C, which is either "A" or "B", but you want to get a score of 0 on this test by answering every question incorrectly.

Your task is to implement the function getWrongAnswers(N, C) which returns a string with N characters, the ith of which is the answer you should give for question i in order to get it wrong (either "A" or "B").

Constraints
1 ≤ N ≤ 100

Ci ∈ {"A", "B"}

Sample test case #1
N = 3
C = ABA

Expected Return Value = BAB

Sample test case #2
N = 5
C = BBBBB

Expected Return Value = AAAAA

*/

// Solution
// Time Complexity: Linear - O(N) --> Because the number of operations increases with the length of the string
// Space Complexity: Linear - O(N) --> Because the size of the output string increases with the length of the input N.

func getWrongAnswers(_ N: Int, _ C: String) -> String {

  var string: String = ""

  while string.count < N {
    for char in C {
      if char == "A" {
        string.append("B")
      } else {
        string.append("A")
      }
    }
  }

  return string
}

// Test cases
let result1 = getWrongAnswers(3, "ABA")
print(result1)  // Output: "BAB"

let result2 = getWrongAnswers(5, "BBBBB")
print(result2)  // Output: "AAAAA"
