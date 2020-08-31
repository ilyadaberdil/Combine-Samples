//: [Operators - Map](@previous)
import Combine
import Foundation


// MARK: Operators: Filters

_ = Publishers.Sequence(sequence: [1,2,2,3,3,4,7])
.map { $0 * 2 }
.filter { $0.isMultiple(of: 2) }
.dropFirst(3)
.removeDuplicates()
.sink(receiveValue: { value in
    print(value)
})

//: [Subjects](@next)
