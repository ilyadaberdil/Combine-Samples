import Combine
import Foundation


extension Notification.Name {
    static let personName = Notification.Name("personName")
    static let personLastName = Notification.Name("personLastName")
}

class Person {
    var name: String
    var lastName: String
    
    init(name: String, lastName: String) {
        self.name = name
        self.lastName = lastName
    }
}

let person: Person = .init(name: "Berdil", lastName: "Karaçam")

// MARK: Failure Case

// STEP-1
//let personPublisher = NotificationCenter.Publisher(center: .default, name: .personName, object: person)
//let personSubscriber = Subscribers.Assign(object: person, keyPath: \.name)
//personPublisher.subscribe(personSubscriber)


// MARK: Success Case

// STEP-2

//let personPublisher = NotificationCenter.Publisher(center: .default, name: .personName, object: person)
////Operators
//let converter = Publishers.Map(upstream: personPublisher, transform: { $0.userInfo?["newName"] as? String ?? ""})
//let personSubscriber = Subscribers.Assign(object: person, keyPath: \.name)
//converter.subscribe(personSubscriber)
////


// STEP-3
//
//NotificationCenter.Publisher(center: .default, name: .personName, object: person)
//    .map { $0.userInfo?["filteredName"] as? String ?? ""}
//    .assign(to: \.name, on: person)


// STEP-4
//
NotificationCenter.Publisher(center: .default, name: .personName, object: person)
    .compactMap { $0.userInfo?["newName"] as? String}
    .filter({$0.count > 4})
    .prefix(5) //String yerine dizi alsaydık ilk 5 elemanı almak için..
    .assign(to: \.name, on: person)

//

//Sample

NotificationCenter.default.post(name: .personName, object: person, userInfo: ["filteredName": "Tan", "newName":"Ilyada"])
print(person.name)


//: [Operators - Map](@next)















































