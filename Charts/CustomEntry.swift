//
//  ViewController.swift
//  Charts
//
//  Created by Martin Mitrevski on 02.12.17.
//  Copyright © 2017 Mitrevski. All rights reserved.
//


import Foundation
import UIKit

struct CustomType {
    let originY: CGFloat
    let height: CGFloat
    let color: UIColor
    let title: String
}

struct CustomEntry {
    let type: CustomType
    let startTime: (CGFloat, CGFloat)
    let endTime: (CGFloat, CGFloat)
    let hasStart: Bool
    let hasEnd: Bool
    var originX: CGFloat {
        get {
            return startTime.0 + startTime.1 / 60.0
        }
    }
    var width: CGFloat {
        get  {
            return (endTime.0 + endTime.1 / 60) - originX
        }
    }
    var startTimeString: String {
        get {
            return string(fromTime: startTime)
        }
    }
    var endTimeString: String {
        get {
            return string(fromTime: endTime)
        }
    }
}

func string(fromTime time:(CGFloat, CGFloat)) -> String {
    let hour = Int(time.0)
    let hourString = hour < 10 ? "0\(hour)" : "\(hour)"
    let minutes = Int(time.1)
    let minutesString = minutes < 10 ? "0\(minutes)" : "\(minutes)"
    return "\(hourString):\(minutesString)"
}
