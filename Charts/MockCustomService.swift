//
//  ViewController.swift
//  Charts
//
//  Created by Martin Mitrevski on 02.12.17.
//  Copyright © 2017 Mitrevski. All rights reserved.
//


import UIKit

class MockCustomService: NSObject, CustomService {
    func loadCustomData(forDate date: Date) -> [CustomEntry] {
        let moonrise = CustomType(originY: 14,
                                   height: 8,
                                   color: .darkGray,
                                   title: "Moonrise")
        let sunrise = CustomType(originY: 2,
                                  height: 10,
                                  color: .orange,
                                  title: "Sunrise")
        let major = CustomType(originY: 11,
                                height: 6,
                                color: .cyan,
                                title: "Day")
        let moonriseEndEntry = CustomEntry(type: moonrise, startTime: (0,0),
                                            endTime: (3,42),
                                            hasStart: false,
                                            hasEnd: true)
        let moonriseStartEntry = CustomEntry(type: moonrise, startTime: (18,3),
                                              endTime: (24,0),
                                              hasStart: true,
                                              hasEnd: false)
        let sunriseEntry = CustomEntry(type: sunrise, startTime: (6,3),
                                        endTime: (15,48),
                                        hasStart: true,
                                        hasEnd: true)
        let majorFirst = CustomEntry(type: major, startTime: (2,47),
                                      endTime: (4,47),
                                      hasStart: true,
                                      hasEnd: true)
        let majorSecond = CustomEntry(type: major, startTime: (15,16),
                                      endTime: (17,16),
                                      hasStart: true,
                                      hasEnd: true)
        
        return [moonriseStartEntry, moonriseEndEntry, sunriseEntry, majorFirst, majorSecond]
    }
    

}
