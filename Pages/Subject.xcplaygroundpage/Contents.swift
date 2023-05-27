import Foundation
import Combine

//PassthroughSubject
let relay = PassthroughSubject<String, Never>()
let subscription = relay.sink { value in
    print("Received Value: \(value)")
}

relay.send("Hello")
relay.send("World!")

//CurrentValueSubject
let variable = CurrentValueSubject<String, Never>("")

variable.send("Initial text")

let subscription2 = variable.sink { value in
    print("Received Value: \(value)")
}

variable.send("More text")
variable.value

let publisher = ["Here", "We", "Go"].publisher
//publisher.subscribe(relay)
//publisher.subscribe(variable)
