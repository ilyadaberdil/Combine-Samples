//: [Operators - FlatMap](@previous)

import Foundation
import Combine

let usernamePublisher = PassthroughSubject<String?,Never>()
let passwordPublisher = PassthroughSubject<String?,Never>()

// MARK: CombineLatest

Publishers.CombineLatest(usernamePublisher, passwordPublisher)
    .map { username, password -> Bool in
        guard let username = username, let password = password else { return false }
        if username.lowercased() == "Berdil".lowercased(),
            password == "123" {
            return true
        } else {
            return false
        }
}
.replaceError(with: false)
.sink { (isValid) in
    print(isValid)
}


// MARK: Zip

Publishers.Zip(usernamePublisher, passwordPublisher)
    .map { username, password -> String in
        guard let username = username, let password = password else { return "-" }
        return "\(username) \(password)"
}
.sink { (value) in
    print("Zip: \(value)")
}

usernamePublisher.send(nil)
passwordPublisher.send("123")
usernamePublisher.send("berdil")
passwordPublisher.send("123") //for zip



//: [Just-Future](@next)
