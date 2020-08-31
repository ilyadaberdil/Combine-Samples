//: [Operators - Combination](@previous)

import Foundation
import Combine

// MARK: JUST

Just(503)
    .sink { print($0) }

let sampleJustPublisher = Just("Sample Just Publisher")

let subscription = sampleJustPublisher
    .sink { (val) in
        print(val)
}

// MARK: JUST, FUTURE

struct User {
    let id: Int
    let name: String
}

let users = [User(id: 0, name: "John"),
             User(id: 1, name: "Freddie"),
             User(id: 2, name: "Elvis")]

enum FetchError: Error {
    case userNotFound
}

func fetchUser(for userId: Int, completion: (_ result: Result<User, FetchError>) -> Void) {
    if let user = users.first(where: { $0.id == userId }) {
        completion(Result.success(user))
    } else {
        completion(Result.failure(FetchError.userNotFound))
    }
}

let fetchUserPublisher = PassthroughSubject<Int, FetchError>()

fetchUserPublisher
    .flatMap { userId -> Future<User, FetchError> in
        return Future { promise in
            fetchUser(for: userId) { (result) in
                switch result {
                case .success(let user):
                    promise(.success(user))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
}
.map { user in user.name }
.catch { (error) -> Just<String> in
    print("Error occurred: \(error)")
    return Just("Not found")
}
.sink { result in
    print("User is \(result)")
}

fetchUserPublisher.send(0)
fetchUserPublisher.send(5)

//: [Schedulers](@next)
