
import Foundation
import UIKit

struct CombinedType {
    let title: String
    let color: UIColor
    let priority: Int
}

struct CombinedPart {
    let type: CombinedType
    let value: Int
}

struct CombinedEntry {
    let year: String
    let parts: [CombinedPart]
    var total: Int {
        get {
            return parts.map({ return $0.value }).reduce(0, +)
        }
    }
    var values: [Double] {
        get {
            return parts.map({ return Double($0.value) })
        }
    }
    var colors: [UIColor] {
        get {
            return parts.map({ return $0.type.color })
        }
    }
    var titles: [String] {
        get {
            return parts.map({ return $0.type.title })
        }
    }
}
