//
//  MyTestSwift.swift
//  HelloGlasses
//
//  Created by haroon shah on 12/20/25.
//

import Foundation

// Function that takes a closure as an argument
func performOperation(on a: Int, and b: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}

func two() {
  // Define closure expressions for different operations
  let addClosure: (Int, Int) -> Int = { $0 + $1 }
  let subtractClosure: (Int, Int) -> Int = { $0 - $1 }
  let multiplyClosure: (Int, Int) -> Int = { $0 * $1 }

  let resultAdd = performOperation(on: 5, and: 3, operation: addClosure) // Result: 8
  let resultSubtract = performOperation(on: 10, and: 4, operation: subtractClosure) // Result: 6
  let resultMultiply = performOperation(on: 6, and: 2, operation: multiplyClosure) // Result: 12

  print(resultAdd, resultSubtract, resultMultiply)
}

func four() {
  struct Person {
      var name: String
      var age: Int
  }

  let people = [
      Person(name: "Alice", age: 28),
      Person(name: "Bob", age: 22),
      Person(name: "Charlie", age: 35)
  ]

  // Sorting by age using a closure
  let sortedByAge = people.sorted { (person1, person2) in
      return person1.age < person2.age
  }

  print(sortedByAge)
  // Output: [Person(name: "Bob", age: 22), Person(name: "Alice", age: 28), Person(name: "Charlie", age: 35)]
  
  let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  // Filtering even numbers using a closure
  let evenNumbers = numbers.filter { number in
      return number % 2 == 0
  }

  print(evenNumbers) // Output: [2, 4, 6, 8, 10]
}

// Function that returns a closure
/*
 • The function signature func makeMultiplier(factor: Int) -> (Int) -> Int means:
    • It takes one parameter, factor (an Int).
    • It returns a function that itself takes an Int and returns an Int.

 • Inside, it returns a closure: { number in return number * factor }.
    • This closure takes number as its argument.
    • It multiplies number by factor.

 • The key concept here is closure capture:
    • The closure “captures” the factor from the surrounding scope of makeMultiplier.
    • Even after makeMultiplier has finished executing, the returned closure keeps a reference to the factor value that was in effect at the time it was created.
 */
func makeMultiplier(factor: Int) -> (Int) -> Int {
    return { number in
        return number * factor
    }
}

func three() {
  let double = makeMultiplier(factor: 2)
  let triple = makeMultiplier(factor: 3)

  let resultDouble = double(5) // Result: 10
  let resultTriple = triple(4) // Result: 12

  print(resultDouble, resultTriple)
}


/*
 func fetchData(completion: @escaping (Result<Data, Error>) -> Void)
    • Declares a function that takes a single parameter: completion, which is a closure to be called when the "network request" finishes.
    • The closure parameter type is Result<Data, Error>, which means:
       • On success, you’ll get .success(Data)
       • On failure, you’ll get .failure(Error)
    • The @escaping attribute is required because the closure is called after the function returns (asynchronously).

 • DispatchQueue.global().asyncAfter(deadline: .now() + 2) { ... }
    • Schedules work to happen on a background global queue 2 seconds later.
    • This simulates network latency.

 • if Bool.random() { ... } else { ... }
    • Randomly decides whether the simulated request succeeds or fails.

 • On success:
    • let data = Data("Sample Data".utf8)
       • Creates some dummy Data from the string "Sample Data".
    • completion(.success(data))
       • Calls the completion closure with a successful result.

 • On failure:
    • let error = NSError(domain: "com.example", code: 1, userInfo: nil)
       • Creates a simple NSError describing a failure.
    • completion(.failure(error))
       • Calls the completion closure with a failure result.
 */
/*
 Notes and best practices

 • Threading: The completion is currently called on a background queue. If the caller needs to update UI, they should hop back to the main queue:
 
 fetchData { result in
       DispatchQueue.main.async {
           // update UI here
       }
   }
 
 Error type: You’re using NSError for simplicity; you could define a custom Error enum for more structured error handling.
• Modern alternative: With Swift Concurrency, you could provide an async/await version:
 func fetchData() async -> Result<Data, Error> {
       try? await Task.sleep(nanoseconds: 2_000_000_000)
       if Bool.random() {
           return .success(Data("Sample Data".utf8))
       } else {
           let error = NSError(domain: "com.example", code: 1)
           return .failure(error)
       }
   }
 
 */
/*
 • Add an async/await version of fetchData alongside the closure-based one.
 • Ensure the completion handler always returns on the main thread (safer for UI updates).
 • Replace the NSError with a small custom Error enum for clearer failures.
 */
func fetchData(completion: @escaping (Result<Data, Error>) -> Void) {
    // Simulate a network request delay
    DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
        if Bool.random() { // Simulate success or failure randomly
            let data = Data("Sample Data".utf8)
            completion(.success(data))
        } else {
            let error = NSError(domain: "com.example", code: 1, userInfo: nil)
            completion(.failure(error))
        }
    }
}

func runAllMyLib() {
  two()
  three()
  // Using the fetchData function with a closure
  fetchData { result in
      switch result {
      case .success(let data):
          print("Data received:", data)
      case .failure(let error):
          print("Error:", error)
      }
  }
}

// closure capture (enclosure)

func makeIncrementer(incrementAmount: Int) -> () -> Int {
    var total = 0

    let incrementer: () -> Int = {
        total += incrementAmount
        return total
    }

    return incrementer
}

func closureEnclosure() {
  let incrementByTwo = makeIncrementer(incrementAmount: 2)
  print(incrementByTwo()) // Prints: 2
  print(incrementByTwo()) // Prints: 4

  let incrementByFive = makeIncrementer(incrementAmount: 5)
  print(incrementByFive()) // Prints: 5
  print(incrementByFive()) // Prints: 10

  print(incrementByTwo()) // Prints: 6
  
  // some more ex
  let integerMultiplier = { (input: Int) -> Int in
      return input * 2
  }
  let value = 4
  let multipliedValue = integerMultiplier(value)
  print(multipliedValue) // Prints: 8

}
