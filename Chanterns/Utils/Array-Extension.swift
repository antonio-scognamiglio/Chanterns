//
//  Array-Extension.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 07/04/23.
//

import Foundation

extension Array {

    func splitInSubArrays(into size: Int) -> [[Element]] {

        var output: [[Element]] = []

        (0..<size).forEach {

            var subArray: [Element] = []

            for elem in stride(from: $0, to: count, by: size) {
                subArray.append(self[elem])
            }

            output.append(subArray)
        }
        print("************NUMERO ARRAY*********")
        print(output.count)
        return output
    }
}

// This extension is useful when you need to iterate a nested array, normally Array don't have Id
extension Array: Identifiable where Element: Hashable {
   public var id: Int { self.hashValue }
}
