//: [Subjects](@previous)

import Foundation
import Combine


struct User {
   let name: CurrentValueSubject<String, Never>
}

let userSubject = PassthroughSubject<User, Never>()
        
// MARK: Failure Case
//
//userSubject
//   .map { $0.name } // compilation error here
//   .sink { print($0) }
//
//let user = User(name: .init("User 1"))
//userSubject.send(user)
//

// MARK: Success Case

/// It will fail with compilation error, since userSubject is a publisher of publishers. The flatMap operator allows to overcome this and reach name values:
userSubject
    .flatMap{ $0.name }
   // .flatMap(maxPublishers: .max(1)) { $0.name }
    .sink { print($0) }

let user = User(name: .init("User 1"))
userSubject.send(user)

let anotherUser = User(name: .init("AnotherUser 1"))

userSubject.send(anotherUser)

anotherUser.name.send("AnotherUser 2")

user.name.send("User 2")

//: [Operators-Combination](@next)
