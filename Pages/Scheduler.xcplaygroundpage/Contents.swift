import Foundation
import Combine

let arrayPublisher = [1, 2, 3].publisher

let queue = DispatchQueue(label: "custom")

let subscription = arrayPublisher
    .subscribe(on: queue)
    .map { value -> Int in
        print("transform: \(value), thread: \(Thread.current)")
        return value
    }
    .receive(on: DispatchQueue.main)
    .sink { value in
        print("Received Value: \(value), thread: \(Thread.current)")
    }
