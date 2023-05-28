import Foundation
import Combine
import UIKit

//URLSessionTask Publisher and JSON Decoding Operator
struct SomeDecodable: Decodable {
}

URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.google.com")!)
    .map { data, response in
        return data
    }
    .decode(type: SomeDecodable.self, decoder: JSONDecoder())


//Notification
let center = NotificationCenter.default
let noti = Notification.Name("MyNoti")
let notiPublisher = center.publisher(for: noti, object: nil)
let subscription1 = notiPublisher.sink { _ in
    print("Noti Received")
}

center.post(name: noti, object: nil)
subscription1.cancel()


//KeyPath binding to NSObject instances
let ageLabel = UILabel()
print("Text: \(ageLabel.text)")

Just(28)
    .map {"Age is \($0)"}
    .assign(to: \.text, on: ageLabel)

print("Text: \(ageLabel.text)")



//Timer
//autoconnect -> subscribe 되면 바로 실행
let timePublisher = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

let subscription2 = timePublisher.sink { time in
    print("time: \(time)")
}

DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    subscription2.cancel()
}
