//: [Operators-Filter](@previous)

import Foundation
import Combine

// MARK: Subjects

let currentValueSample = CurrentValueSubject<String, Never>("Heyo")
let passthroughSample = PassthroughSubject<String, Never>()


currentValueSample.sink { (val) in
    print(val)
}

passthroughSample
    .filter({$0.count > 6})
    .sink { print($0) }


passthroughSample.send("Sample")

passthroughSample.send("Sample String2")

currentValueSample.send("Hello Combine")

// Subscribe the subject to a publisher, it relays the values
// CurrentValueSubject stores the most recent elements and send to new subscribers.
currentValueSample.subscribe(passthroughSample) // success!
//passthroughSample.subscribe(currentValueSample) // fail!

//: [Operators-FlatMap](@next)
