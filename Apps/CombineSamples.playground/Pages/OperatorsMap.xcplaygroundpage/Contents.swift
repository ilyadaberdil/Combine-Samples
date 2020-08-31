//: [PublisherSubscriber](@previous)

import Foundation
import Combine

// MARK: Operators - Map

[1, 2, 3]
.publisher
.map { $0 * 5 }
.sink { print($0) }
//: [Operators - Filter](@next)
