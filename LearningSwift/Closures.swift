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
 In this example, the fetchData function simulates a network request that completes after a delay. It takes a closure as an argument (completion) which is executed when the network request is finished. The closure carries a Result type to indicate either success (with the fetched data) or failure (with an error).


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
