import Foundation
import Combine

//Basic CombineLatest
let stringPublisher = PassthroughSubject<String, Never>()
let numberPublisher = PassthroughSubject<Int, Never>()

//case1
Publishers.CombineLatest(stringPublisher, numberPublisher)
    .sink { (str, num) in
        print("Receive: \(str), \(num)")
    }

//case2
//stringPublisher.combineLatest(numberPublisher)
//    .sink { (str, num) in
//    print("Receive: \(str), \(num)")
//}

stringPublisher.send("a")
numberPublisher.send(1)
stringPublisher.send("b")
stringPublisher.send("c")
numberPublisher.send(2)
numberPublisher.send(3)


//Advanced CombineLatest
let userNamePublisher = PassthroughSubject<String, Never>()
let passwordPublisher = PassthroughSubject<String, Never>()

let validatedCredentialSubscription = userNamePublisher.combineLatest(passwordPublisher)
    .map { (username, password) -> Bool in
        return !username.isEmpty && !password.isEmpty && password.count > 8
    }
    .sink { valid in
        print("redential valid?: \(valid)")
    }

userNamePublisher.send("jasonLee")
passwordPublisher.send("weakPW")
passwordPublisher.send("veryStrongPassword")


//Merge
let publisher1 = [1, 2, 3, 4, 5].publisher
let publisher2 = [300, 400, 500].publisher

//case1
let mergedPublisherSubscription = Publishers.Merge(publisher1, publisher2)
    .sink { value in
        print("Merge: subsicription received value: \(value)")
    }

//case2
//let mergedPublisherSubscription = publisher1.merge(with: publisher2)
//    .sink { value in
//        print("Merge: subsicription received value: \(value)")
//    }
