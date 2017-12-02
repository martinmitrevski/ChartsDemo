//
//  ViewController.swift
//  Charts
//
//  Created by Martin Mitrevski on 02.12.17.
//  Copyright © 2017 Mitrevski. All rights reserved.
//


import UIKit
import Charts

class YearValueFormatter: NSObject, IAxisValueFormatter {
    let years = ["2012", "2013", "2014", "2015", "2016"]
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return years[Int(value)]
    }
}
