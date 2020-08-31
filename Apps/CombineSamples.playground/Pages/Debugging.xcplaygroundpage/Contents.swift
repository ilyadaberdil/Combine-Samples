//: [Memory Management](@previous)

import Foundation
import Combine

enum SampleError: Error {
    case error
}

let subject = PassthroughSubject<String, Error>()
let subscription = subject
    .handleEvents(receiveSubscription: { (subscription) in
        print("Receive subscription")
    }, receiveOutput: { output in
        print("Received output: \(output)")
    }, receiveCompletion: { response in
        switch response {
        case .finished:
            print("Receive completion Finished")
        case .failure(let error):
            print("Receive completion Failure \(error.localizedDescription)")
        }
    }, receiveCancel: {
        print("Receive cancel")
    }, receiveRequest: { demand in
        print("Receive request: \(demand)")
    })
    .replaceError(with: "Error occurred")
    .sink { _ in }

subject.send("Hello!")

//subscription.cancel()
subject.send(completion: .finished)
//subject.send(completion: .failure(SampleError.error))

//: [Next](@next)
