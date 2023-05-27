import Foundation
import Combine

let subject = PassthroughSubject<String, Never>()

let subscription = subject
    .print("[Debug]")
    .sink { value in
    print("Received Value: \(value)")
}

subject.send("Hello")
subject.send("Hello again")
subject.send("Hello for the last time")

//subject.send(completion: .finished)
subscription.cancel()

subject.send("Hello ?? :(")
