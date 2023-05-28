import Foundation
import Combine

//Transform - Map
let numberPublisher = PassthroughSubject<Int, Never>()
let subscription1 = numberPublisher
    .map { $0 * 2 }
    .sink { value in
        print("Tranformed Value: \(value)")
    }

numberPublisher.send(10)
numberPublisher.send(20)
numberPublisher.send(30)
subscription1.cancel()


//filter
let stringPublisher = PassthroughSubject<String, Never>()
let subscription2 = stringPublisher
    .filter { $0.contains("a") }
    .sink { value in
        print("Filtered Value: \(value)")
    }

stringPublisher.send("abc")
stringPublisher.send("Jack")
stringPublisher.send("Joon")
stringPublisher.send("Json")
subscription2.cancel()
