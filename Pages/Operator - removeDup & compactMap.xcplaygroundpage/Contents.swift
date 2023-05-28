import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

//removeDuplicates
let words = "hey hey hey are you there ?"
    .components(separatedBy: " ")
    .publisher

words
    .removeDuplicates()
    .sink { value in
        print(value)
    }.store(in: &subscriptions)


//compactMap
let strings = ["a", "1", "3.4", "der", "1.89"].publisher

strings
    .compactMap { Float($0) }
    .sink { value in
        print(value)
    }.store(in: &subscriptions)


//ignoreOutput
let numbers = (1...100).publisher

numbers
    .ignoreOutput()
    .sink(receiveCompletion: { print("Completed with: \($0)") },
          receiveValue: { print($0 )})
    .store(in: &subscriptions)


//prefix
let tens = (1...10).publisher

tens
    .prefix(5)
    .sink(receiveCompletion: { print("Completed with: \($0)") },
          receiveValue: { print($0 )})
    .store(in: &subscriptions)
